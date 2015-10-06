# File: gset2uacalc.g
# Author: William DeMeo
# Date: 2011.06.06
# Updated: 2012.09.24
#
# Description: GAP routines for creating a uacalc algebra file from GAP groups.
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
#

gset2uacalc:=function(args)
    # gset2uacalc:=function([G, algebraname])
    # Convert a gap action group to a uacalc algebra file.
    #    
    # Input: G            The action group created in GAP, 
    #                     for example, like this:
    #                     G := Action( K, RightCosets(K,H), OnRight );
    #
    #        algebraname  (optional, default=StructureDescription(G)) 
    #                     A string which will serve as both the name of 
    #                     the algebra in uacalc, and also the filename 
    #                     (the .ua suffix will be added).
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.05.19
    
    local nargin, G, algebraname, filename, outfile, N, opcount, g, x;
    G:=args[1]; 
    
    nargin := Length(args);
    if nargin < 2 then 
        algebraname:=StructureDescription(G); 
    else 
        algebraname:=args[2]; 
    fi;
    
    
    filename := Concatenation(algebraname, ".ua");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    Print("uacalc file: ", filename, "\n");

    N:=NrMovedPoints(G);
    
    PrintTo(outfile, "<?xml version=\"1.0\"?>\n");
    AppendTo(outfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
    AppendTo(outfile, "<cardinality>", N, "</cardinality>\n");
    AppendTo(outfile, "<operations>\n");
    opcount:=0;
    
    for g in GeneratorsOfGroup(G) do
        AppendTo(outfile, "<op>\n<opSymbol><opName>g", opcount, "</opName>\n");
        AppendTo(outfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        AppendTo(outfile, 1^g-1);
        for x in [2..N] do
            AppendTo(outfile, ",", x^g-1);
        od;
        AppendTo(outfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        opcount:=opcount+1;
    od;
    AppendTo(outfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
end;


group2uacalc:=function(args)
    # group2uacalc:=function([G, algebraname])
    # Convert a group to a uacalc algebra file.
    #    
    # Input: G            A group created in GAP, for example, like this:
    #                     G := SymmetricGroup(5);
    #                     or like this:
    #                     G := SmallGroup(60,5);
    #
    #        algebraname  (optional, default=StructureDescription(G)) 
    #                     A string which will serve as both the name of 
    #                     the algebra in uacalc, and also the filename 
    #                     (the .ua suffix will be added).
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.06.06
    
    local nargin, G, algebraname, filename, outfile, N, opcount, g, x;
    G:=args[1]; 
    
    nargin := Length(args);
    if nargin < 2 then 
        algebraname:=StructureDescription(G); 
    else 
        algebraname:=args[2]; 
    fi;
    
    filename := Concatenation(algebraname, ".ua");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    Print("uacalc file: ", filename, "\n");
    
    N:=NrMovedPoints(G);
    
    PrintTo(outfile, "<?xml version=\"1.0\"?>\n");
    AppendTo(outfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
    AppendTo(outfile, "<cardinality>", N, "</cardinality>\n");
    AppendTo(outfile, "<operations>\n");
    opcount:=0;
    
    for g in GeneratorsOfGroup(G) do
        AppendTo(outfile, "<op>\n<opSymbol><opName>g", opcount, "</opName>\n");
        AppendTo(outfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        AppendTo(outfile, 1^g-1);
        for x in [2..N] do
            AppendTo(outfile, ",", x^g-1);
        od;
        AppendTo(outfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        opcount:=opcount+1;
    od;
    AppendTo(outfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
end;
