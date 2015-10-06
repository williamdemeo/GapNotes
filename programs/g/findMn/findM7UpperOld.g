# Gap function for finding a group G which has M7 as an upper interval
# [H, G] such that H is not normal in G.
#
# Author: William DeMeo <williamdemeo@gmail.com>
# Date: 2010.08.02

findM7Upper:=function(N1, N2)
    # Search among all small groups of orders N1 up to N2.  
    # 
    
    local pathname, filename, outfile, i, j, k, p, q, r, s, t, u, v, numsg, G, H, ms, numms, count, intSubs, numintSubs, 
          msind, zeros, threes, mark, coreflag, core, numPcounters, numcounters, tic, toc, tic1, toc1, 
          elapsed00, elapsed0, elapsed1, elapsed2, elapsed3, meetcnt;
    
    numPcounters := 0;   # running total of possible counter-examples
    numcounters := 0;    # running total of actual counter-examples
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/findM7Upper", String(N1), "-", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "Small groups of orders ",  String(N1), " up to ", String(N2), " with an upper M7\n\n");
    AppendTo(outfile, "GAPid;        Max Subgroups;             [H, G];                        Non-trivial Cores.\n");
    
    # For profiling:
    elapsed00:= 0; # elapsed00 is aggregate time required to compute the number of groups of a given size
    elapsed0 := 0; # elapsed0 is aggregate time required to construct the small groups, and check if they're abelian or solvable 
    elapsed1 := 0; # elapsed1 is aggregate time required to find their max subgroups. 
    elapsed2 := 0; # elapsed2 is aggregate time required to do everything not included in elapsed00--elapsed1
    elapsed3 := 0; # elapsed3 is aggregate time required to compute whether H is normal in G
    
    for i in [N1..N2] do
        
        Print(numPcounters, " ", numcounters, " Checking groups of order |G| = ", i, "...");
        AppendTo(outfile, numPcounters, " ", numcounters, " Checking groups of order |G| = ", i, "...");
        
        meetcnt := 0;        # the number of maximal subgroups which meet at a single subgrous
        
        tic := Runtime();
        numsg := NumberSmallGroups(i);
        toc := Runtime();
        elapsed00 := elapsed00 + (toc-tic);
        
        Print(" there is/are ", numsg, " such group(s)...");
        AppendTo(outfile, " there is/are ", numsg, " such group(s)...");
        
        for j in [1..numsg] do
            
            tic := Runtime();
            G := SmallGroup(i,j);
            
            # First let's just check the non-Solvable groups.
            if IsAbelian(G) or IsSolvableGroup(G) then
                # do nothing
                toc := Runtime();
                elapsed0 := elapsed0 + (toc-tic);
            else 
                toc := Runtime();
                elapsed0 := elapsed0 + (toc-tic);
                
                ms := MaximalSubgroups(G);
                numms := Size(ms);
                
                tic := Runtime();
                elapsed1 := elapsed1 + (tic-toc);
                            
                if numms < 7 then
                    # do nothing
                else
                    # p is the 1st atom
                    for p in [1..(numms-6)] do
                        # q is the 2nd atom
                        for q in [(p+1)..(numms-5)] do
                            H := Intersection(ms[p],ms[q]);
                            
                            # Test whether H is normal in G (in which case we don't care)
                            tic1 := Runtime();
                            if IsNormal(G, H) then
                                # do nothing
                                toc1 := Runtime();
                                elapsed3:= elapsed3 + (toc1-tic1);
                            else
                                toc1 := Runtime();
                                elapsed3:= elapsed3 + (toc1-tic1);
                                
                                # Test whether interval [H, G] has exactly 9 subgroups (including H and G);
                                # but since GAP doesn't count H and G, check whether numintSubs is 7.
                                intSubs := IntermediateSubgroups(G, H);
                                numintSubs := Size(intSubs.subgroups);
                                if numintSubs = 7 then
                                    
                                    # r is the 3rd atom
                                    for r in [(q+1)..(numms-4)] do
                                        if H = Intersection(ms[p],ms[r]) and 
                                           H = Intersection(ms[q],ms[r]) then
                                            meetcnt := Maximum(meetcnt, 3);
                                            
                                            # s is the 4th atom
                                            for s in [(r+1)..(numms-3)] do
                                                if H = Intersection(ms[p],ms[s]) and 
                                                   H = Intersection(ms[q],ms[s]) and
                                                   H = Intersection(ms[r],ms[s]) then
                                                    meetcnt := Maximum(meetcnt, 4);
                                                    
                                                    # t is the 5th atom
                                                    for t in [(s+1)..(numms-2)] do
                                                        if H = Intersection(ms[p],ms[t]) and 
                                                           H = Intersection(ms[q],ms[t]) and
                                                           H = Intersection(ms[r],ms[t]) and 
                                                           H = Intersection(ms[s],ms[t]) then
                                                            meetcnt := Maximum(meetcnt, 5);
                                                            
                                                            # u is the 6th atom
                                                            for u in [(t+1)..(numms-1)] do
                                                                if H = Intersection(ms[p],ms[u]) and 
                                                                   H = Intersection(ms[q],ms[u]) and
                                                                   H = Intersection(ms[r],ms[u]) and 
                                                                   H = Intersection(ms[s],ms[u]) and
                                                                   H = Intersection(ms[t],ms[u]) then
                                                                    meetcnt := Maximum(meetcnt, 6);
                                                                    
                                                                    # v is the 7th atom
                                                                    for v in [(u+1)..numms] do
                                                                        if H = Intersection(ms[p],ms[v]) and 
                                                                           H = Intersection(ms[q],ms[v]) and
                                                                           H = Intersection(ms[r],ms[v]) and 
                                                                           H = Intersection(ms[s],ms[v]) and
                                                                           H = Intersection(ms[t],ms[v]) and
                                                                           H = Intersection(ms[u],ms[v]) 
                                                                           then
                                                                            meetcnt := Maximum(meetcnt, 7);
                                                                            
                                                                            msind := List([p, q, r, s, t, u, v]);
                                                                            numPcounters := numPcounters + 1;
                                                                            Print("\n", numPcounters, " ", numcounters, 
                                                                                  "FOUND A POSSIBLE COUNTER-EXAMPLE: GAPid = [", 
                                                                                  i, ", ", j, "]; [H, G] = [", StructureDescription(H),
                                                                                  ", ", StructureDescription(G), "]\n");
                                                                
                                                                            AppendTo(outfile, i, " ", j, ";   ", msind, ";  [ ", 
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
                                                                                numcounters := numcounters + 1;
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
                            fi;
                        od;   # q
                    od;  # p
                fi;
                
                toc:=Runtime();
                elapsed2 := elapsed2 + (toc-tic);
                
            fi;
        od;
        Print(" ... done (max number of meets = ", meetcnt, ") \n");
        AppendTo(outfile, " ... done.\n");
    od;
    Print("\nelapsed00 = ", StringTime(elapsed00));
    Print("\nelapsed0 = ", StringTime(elapsed0));
    Print("\nelapsed1 = ", StringTime(elapsed1));
    Print("\nelapsed2 = ", StringTime(elapsed2));
    Print("\nelapsed3 = ", StringTime(elapsed3), "\n");
    AppendTo(outfile, "\nelapsed0 = ", StringTime(elapsed0), "\nelapsed1 = ", StringTime(elapsed1), "  elapsed2 = ", StringTime(elapsed2), "\n");
end;;
                                                    
                   