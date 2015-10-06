# A GAP program to list number of conjugacy classes and maximal subgroup class reps 
# for groups of all orders N1 up to N2 which are nonabelian, solvable, and non-nilpotent.
# Gap function for testing a conjecture of Ed Bertram.
#
# Author: William DeMeo <williamdemeo@gmail.com>
# Date: 2010.07.31

testConjecture:=function(G, g, name, verbose)
    # INPUTS
    # G     The group
    #
    # g     Another copy of the group
    #       Unfortunately, it's not clear to me how to get a copy of, 
    #       say, the conjugacy classes, which saves their original names.  
    #       So, until I figure this out, you have to pass two distinct copies, 
    #       G and g, of the same group to this function.
    #
    # name  The name of the group (used in output file name)
    #
    # verbose  if verbose=false, no extra info is printed to outfile
    #          if verbose=true, extra info is printed to outfile
    #
    # OUTPUTS
    # name.out  A file with the results ( <-- fix this: describe the resulting file )
    #
    # EXAMPLE
    #       gap> Read("testConjecture.g");
    #       gap> s4 := SymmetricGroup(4);; S4 := SymmetricGroup(4);;
    #       gap> name := "S4";;
    #       gap> testConjecture(S4, s4, name, true);  # for verbose output
    #       gap> testConjecture(S4, s4, name, false); # for terse output
    #
    # WARNING: This program will overwrite any file named "name.out", if such a file
    #          already exists in the directory called pathname (defined below)
    
    local i, j, k, cc, numcc, ccRenamed, mscr, nummscr, mscrRenamed, alphabet, Alphabet, 
          pathname, filename, outfile, intersectList, unionMaxjs, unionNNMaxjs, numcci, nummscri;
    
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/sessions/";
    outfile := Concatenation(pathname, name, ".out");
    
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/", name, ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "The Group G = ", StructureDescription(G), "\n");

N1 := 100;  N2 := 110;
filename := "SolvableNonNilGroups";
pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/sessions/";
outfile := Concatenation(pathname, filename, String(N1), "To", String(N2), ".out");
    
PrintTo(outfile, "GAP_ID  |CClasses|  |CClassesMaxSubgps|  Group description          \n");
for i in [N1..N2] do
    jj := NumberSmallGroups(i);
    for j in [1..jj] do
        G := SmallGroup(i,j);
        if IsAbelian(G) or IsNilpotentGroup(G) then
            # do nothing
        elif IsSolvableGroup(G) then
            ncc := NrConjugacyClasses(G);
            mscr := MaximalSubgroupClassReps(G);
            nmscr := Size(mscr);
            AppendTo(outfile, String(i), "  ", String(j), "    ", 
                    String(ncc), "            ", String(nmscr), "           ", 
                    StructureDescription(G), "\n");
        fi;
    od;
od;
        
        
        