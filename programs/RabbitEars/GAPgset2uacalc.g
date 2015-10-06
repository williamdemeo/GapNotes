# File: GAPgset2uacalc.g
# Author: William DeMeo
# Date: 2011.05.19
#
# Description: GAP routine for creating a uacalc algebra file from a group action.
#
#        ATTENTION!  YOU MUST EDIT THE VARIABLE pathname 
#                    which appears in the very first function, getPathName, below.
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
#
getPathName := function()    
    # Get the path where output files will be stored.
    local pathname;
    if ARCH_IS_WINDOWS() then
        pathname := "H:\\Dropbox\\ClosureCore\\UACalcFiles\\";   # <<< ATTENTION!  You may want to edit this variable.
        if IsDirectoryPath(pathname) then
            Print("Output directory: ", pathname, "\n");
        else
            Print("Warning: output directory: ", pathname, " is unavailable... \n");
            pathname := "C:\\Documents and Settings\\williamdemeo\\My Documents\\Dropbox\\ClosureCore\\UACalcFiles\\";   # <<< ATTENTION!
              if IsDirectoryPath(pathname) then
                Print("       ...using instead: ", pathname, "\n");
            else
                Print("Warning: output directory: ", pathname, " is unavailable... \n");
            fi;
        fi;
    else
        pathname := "~/Dropbox/ClosureCore/UACalcFiles/"; # <<< ATTENTION!
        if IsDirectoryPath(pathname) then
            Print("Output directory: ", pathname, "\n");
        else
            Print("Warning: output directory: ", pathname, " is unavailable... \n");
        fi;
    fi;
    return pathname;
end;

GAPgset2uacalc:=function(G)
    # Convert a gap action group to a uacalc algebra file.
    #    
    # Input: G         The action group created in GAP, 
    #                  for example, like this:
    #                  G := Action( K, RightCosets(K,H), OnRight );
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.05.19
    
    local pathname, prefix, filename, outfile, N, opcount, g;
    
    N:=Size(MovedPoints(G));
    
    pathname := getPathName();
    prefix:=Concatenation(pathname, prefix);
    filename := Concatenation(pathname, StructureDescription(g), ".ua");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "<?xml version=\"1.0\"?>\n");
    AppendTo(outfile, "<algebra>\n<basicAlgebra>\n<algName>", StructureDescription(g), "</algName>\n");
    AppendTo(outfile, "<cardinality>", N, "</cardinality>\n");
    AppendTo(outfile, "<operations>\n");
    opcount:=0;
    
    for g in GeneratorsOfGroup(G) do
        AppendTo(outfile, "<op>\n<opSymbol><opName>g", opcount, "</opName>\n");
        AppendTo(outfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        for x in [1..N] do
            AppendTo(outfile, x^g-1, ",");
        od;
        AppendTo(outfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        opcount:=opcount+1;
    od;
    AppendTo(outfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
end;
