# A GAP program to list number of conjugacy classes and maximal subgroup class reps 
# for groups of all orders N1 up to N2 which are nonabelian, solvable, and non-nilpotent.
#
# Author: William DeMeo <williamdemeo@gmail.com>
# Date: 2010.07.31

findSolvableNonNilGroups:=function(N1,N2)
    # INPUTS
    # N1, N2   (positive integers) Program searches among all groups of 
    #          orders N1 <= |G| <= N2
    #
    # OUTPUTS
    # findSolvableNonNilGroupsN1ToN2.out  A file with the results ( <-- fix this: describe the resulting file )
    #
    # EXAMPLE
    #       gap> findSolvableNonNilGroups(100,110);
    #
    # WARNING: This program will overwrite any file named 
    #          findSolvableNonNilGroupsN1ToN2.out where N1 
    #          and N2 are the integers above.
    
    local i, j, jj, G, ncc, mscr, nmscr, pathname, filename, outfile, rt0, rt1, elapsed;
    
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/SolvableNonNilGroups", String(N1), "To", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "GAP_ID  |CClasses|  |CClassesMaxSubgps|  Group description          \n");
    for i in [N1..N2] do
        jj := NumberSmallGroups(i);
        Print("Checking all ", jj, " groups of order |G| = ", i, "...");
        rt0 := Runtimes();
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
        rt1 := Runtimes();
        elapsed := rt1.user_time - rt0.user_time;
        Print(" done.  (time elapsed: ", StringTime(elapsed), ")\n");
    od;
end;;
        
        
        