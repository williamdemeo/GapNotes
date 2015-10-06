# Gap function for finding an M7 upper interval in a give group G.
#
# Author: William DeMeo <williamdemeo@gmail.com>
# Date: 2010.08.02

findM7UpperInG:=function(G)
    
    local pathname, filename, outfile, i, j, k, p, q, r, s, t, u, v, numsg, G, H, ms, numms, count, intSubs, numintSubs, 
          msind, zeros, threes, mark, coreflag, core;
    
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/findM7UpperInG.out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    
    ms := MaximalSubgroupClassReps(G);
    numms := Size(ms);
    # p is the 1st atom
    for p in [1..(numms-6)] do
        # q is the 2nd atom
        for q in [(p+1)..(numms-5)] do
            H := Intersection(ms[p],ms[q]);
                            
            # Test whether H is normal in G (in which case we don't care)
            # if IsNormal(G, H) then
            #     # do nothing
            # else
                                
                # Test whether interval [H, G] has exactly 9 subgroups (including H and G);
                # but since GAP doesn't count H and G, check whether numintSubs is 7.
                intSubs := IntermediateSubgroups(G, H);
                numintSubs := Size(intSubs.subgroups);
                if numintSubs = 7 then
                                    
                    # r is the 3rd atom
                    for r in [(q+1)..(numms-4)] do
                        if H = Intersection(ms[p],ms[r]) and 
                           H = Intersection(ms[q],ms[r]) then
                            
                            # s is the 4th atom
                            for s in [(r+1)..(numms-3)] do
                                if H = Intersection(ms[p],ms[s]) and 
                                   H = Intersection(ms[q],ms[s]) and
                                   H = Intersection(ms[r],ms[s]) then
                                                    
                                    # t is the 5th atom
                                    for t in [(s+1)..(numms-2)] do
                                        if H = Intersection(ms[p],ms[t]) and 
                                           H = Intersection(ms[q],ms[t]) and
                                           H = Intersection(ms[r],ms[t]) and 
                                           H = Intersection(ms[s],ms[t]) then
                                                            
                                            # u is the 6th atom
                                            for u in [(t+1)..(numms-1)] do
                                                if H = Intersection(ms[p],ms[u]) and 
                                                   H = Intersection(ms[q],ms[u]) and
                                                   H = Intersection(ms[r],ms[u]) and 
                                                   H = Intersection(ms[s],ms[u]) and
                                                   H = Intersection(ms[t],ms[u]) then
                                                    
                                                    # v is the 7th atom
                                                    for v in [(u+1)..numms] do
                                                        if H = Intersection(ms[p],ms[v]) and 
                                                           H = Intersection(ms[q],ms[v]) and
                                                           H = Intersection(ms[r],ms[v]) and 
                                                           H = Intersection(ms[s],ms[v]) and
                                                           H = Intersection(ms[t],ms[v]) and
                                                           H = Intersection(ms[u],ms[v]) 
                                                           then
                                                            
                                                            msind := List([p, q, r, s, t, u, v]);
                                                            Print("\nFOUND A POSSIBLE EXAMPLE: "[H, G] = [", StructureDescription(H),
                                                                  ", ", StructureDescription(G), "]\n");
                                                            
                                                            AppendTo(outfile, msind, ";  [ ", 
                                                                    StructureDescription(H), " , ", 
                                                                    StructureDescription(G), 
                                                                    "];   ");
                                                            
                                                            # Check if all max subgps in [H, G] are core-free.
                                                            # (They must all be if this is a true counterexample.)
                                                            coreflag := 0;
                                                            for k in [1..Size(msind)] do
                                                                core := Core(G, ms[msind[k]]);
                                                                if IsTrivial(core) then
                                                                    # do nothing 
                                                                else
                                                                    coreflag :=1;
                                                                    AppendTo(outfile, " Core(ms[", msind[k], "]) = ",
                                                                            StructureDescription(core),". ");
                                                                    Print("  ...but it has non-core-free max subgp ",
                                                                          "ms[", msind[k], "] = ", 
                                                                          StructureDescription(ms[msind[k]]),"\n");
                                                                fi;
                                                            od;
                                                            if coreflag = 0 then
                                                                Print("...and all max subgps core-free ==> COUNTER-EXAMPLE!!\n");
                                                                AppendTo(outfile, " ALL CORE-FREE ==> COUNTEREXAMPLE!!!");
                                                            fi;
                                                            AppendTo(outfile, "\n");
                                                        fi;
                                                    od;  # v
                                                fi; 
                                            od;  # u  
                                        fi; 
                                    od;   # t
                                fi;
                            od; # s
                        fi;
                    od;  # r
                fi;
            #fi;  # IsNormal
        od;
    od;
end;;
                                                    
                   