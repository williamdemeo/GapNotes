# Gap function for finding a group G which has Sub[A4] as an upper interval
# [H, G] such that H is not normal in G.
#
# Author: William DeMeo <williamdemeo@gmail.com>
# Date: 2010.07.29

findA4Upper:=function(N1, N2)
    # Search among all small groups of orders N1 up to N2.  
    # 
    
    local pathname, filename, outfile, i, j, k, p, q, r, s, t, numsg, G, H, ms, numms, count, classes, intSubs, numintSubs, 
          msind, zeros, threes, mark, coreflag, core, numPcounters, numcounters;
    
    numPcounters := 0;   # running total of possible counter-examples
    numcounters := 0;    # running total of actual counter-examples
    
    classes := false;  # if true, then just consider maximal subgroup class reps
                      # if false, then consider all maximal subgroups
    
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/findA4Upper", String(N1), "-", String(N2), ".out");
    #filename := Filename(pathname, "outputs/findA4Upper", String(N1), "-", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "(Note: we no longer list the cases in which H is NORMAL in G...\n");
    AppendTo(outfile, "       ...so the list below will be empty unless there is a possible counter-example.)\n\n");
    AppendTo(outfile, "Small groups of orders ",  String(N1), " up to ", String(N2), " with an upper A4\n\n");
    AppendTo(outfile, "GAPid;        Max Subgroups;             [H, G];                        Non-trivial Cores.\n");
    
    for i in [N1..N2] do
        numsg := NumberSmallGroups(i);
        Print("Checking all ", numsg, " groups of order |G| = ", i, "...");
        for j in [1..numsg] do
            G := SmallGroup(i,j);
            
            # First let's just check the non-Solvable groups.
            if IsAbelian(G) or IsSolvableGroup(G) then
                # do nothing
            else 
                if classes then
                    ms := MaximalSubgroupClassReps(G);
                else
                    ms := MaximalSubgroups(G);
                fi;
                numms := Size(ms);
                if numms < 5 then
                    # do nothing
                else
                    for p in [1..(numms-4)] do
                        for q in [(p+1)..(numms-3)] do
                            H := Intersection(ms[p],ms[q]);
                            
                            # Test whether H is normal in G (in which case we don't care -- there are lots of these)
                            
                            if IsNormal(G, H) then
                                # do nothing
                            else
                                
                                # Test whether interval [H, G] has exactly 10 subgroups (including H and G);
                                # but since GAP doesn't count H and G, check whether numintSubs is 8 (not 10).
                                intSubs := IntermediateSubgroups(G, H);
                                numintSubs := Size(intSubs.subgroups);
                                if numintSubs = 8 then
                                
                                    for r in [(q+1)..(numms-2)] do
                                        if H = Intersection(ms[p],ms[r]) and H = Intersection(ms[q],ms[r]) then
                                            for s in [(r+1)..numms-1] do
                                                if H = Intersection(ms[p],ms[s]) and H = Intersection(ms[q],ms[s]) and
                                                   H = Intersection(ms[r],ms[s]) then
                                                    for t in [(s+1)..numms] do
                                                        if H = Intersection(ms[p],ms[t]) and H = Intersection(ms[q],ms[t]) and
                                                           H = Intersection(ms[r],ms[t]) and H = Intersection(ms[s],ms[t]) then
                                                            msind := List([p, q, r, s, t]);
                                                            zeros := 0; threes := 0;
                                                            for k in [1..5] do
                                                                intSubs := IntermediateSubgroups(ms[msind[k]],H);
                                                                numintSubs := Size(intSubs.subgroups);
                                                                if numintSubs = 0 then
                                                                    zeros := zeros + 1;
                                                                elif numintSubs = 3 then
                                                                    threes := threes + 1;
                                                                fi;
                                                            od;
                                                            # we want four of the max subgroups M to have no subgroups in [H,M]
                                                            # (so we want zeros = 4)
                                                            # we want one of the max subgroups M to have three subgroups in [H,M]
                                                            # (so we want zeros = 4)
                                                            if zeros = 4 and threes = 1 then
                                                                numPcounters := numPcounters + 1;
                                                                Print("\n", numPcounters, " ", numcounters, 
                                                                      "FOUND A POSSIBLE COUNTER-EXAMPLE: GAPid = [", 
                                                                      i, ", ", j, "]; [H, G] = [", StructureDescription(H),
                                                                      ", ", StructureDescription(G), "]\n");
                                                                
                                                                AppendTo(outfile, i, " ", j, ";   ", msind, ";  [ ", 
                                                                        StructureDescription(H), " , ", StructureDescription(G), 
                                                                        "];   ");
                                                                # Here we check if all max subgroups in [H, G] are core-free.
                                                                # They must all be core-free if this is a true counterexample.
                                                                coreflag := 0;
                                                                for k in [1..5] do
                                                                    core := Core(G, ms[msind[k]]);
                                                                    if IsTrivial(core) then
                                                                        # do nothing 
                                                                    else
                                                                        coreflag :=1;
                                                                        AppendTo(outfile, " Core(ms[", msind[k], "]) = ",
                                                                                StructureDescription(core),". ");
                                                                        Print("  ...but it has non-core-free max subgroup ",
                                                                              "ms[", msind[k], "] = ", StructureDescription(ms[msind[k]]),
                                                                              "\n");
                                                                    fi;
                                                                od;
                                                                if coreflag = 0 then
                                                                    numcounters := numcounters + 1;
                                                                    Print("...and all max subgps core-free ==> COUNTER-EXAMPLE!!\n");
                                                                    AppendTo(outfile, " ALL CORE-FREE ==> COUNTEREXAMPLE!!!");
                                                                fi;
                                                                AppendTo(outfile, "\n");
                                                            fi;
                                                        fi;         # if H = ... p t
                                                    od;             # for t in [(s+1)..numms]
                                                fi;             # if H = ... p s
                                            od;                 #  for s in [(r+1)..numms-1]
                                        fi;             # if H = ... p r
                                    od;
                                fi;
                            fi;
                        od;
                    od;
                fi;
            fi;
        od;
        Print(" ... done.\n");
    od;
end;;
                                                    
                   