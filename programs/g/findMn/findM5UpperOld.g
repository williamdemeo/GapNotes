findM5Upper:=function(N1, N2)
    # GAP function for finding groups G with an M_5 upper interval [H, G] in Sub(G).
    # 
    # INPUT  
    #        (N1, N2) search among all groups G of order |G| between N1 and N2.
    #
    # OUTPUT
    #        findM5UpperN1-N2.out  a file containing a list of groups with this property.
    #
    # Author: William DeMeo <williamdemeo@gmail.com>
    # Date: 2011.01.14
    # 
    
    local pathname, filename, outfile, i, j, k, p, q, r, s, t, u, v, numsg, G, H, ms, numms, count, intSubs, numintSubs, 
          msind, zeros, threes, mark, coreflag, core, numPcounters, numcounters, tic, toc, tic1, toc1, 
          elapsed00, elapsed0, elapsed1, elapsed2, elapsed3, meetcnt;
    
    numPcounters := 0;   # running total of possible counter-examples
    numcounters := 0;    # running total of actual counter-examples
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/findM5Upper", String(N1), "-", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "Small groups of orders ",  String(N1), " up to ", String(N2), " with an upper M5\n\n");
    AppendTo(outfile, "GAPid;        Max Subgroups;             [H, G];                        Non-trivial Cores.\n");
    
    for i in [N1..N2] do
        
        Print(numPcounters, " ", numcounters, " Checking groups of order |G| = ", i, "...");
        AppendTo(outfile, numPcounters, " ", numcounters, " Checking groups of order |G| = ", i, "...");
        
        meetcnt := 0;        # the number of maximal subgroups which meet at a single subgrous
        
        numsg := NumberSmallGroups(i);
        
        Print(" there is/are ", numsg, " such group(s)...");
        AppendTo(outfile, " there is/are ", numsg, " such group(s)...");
        
        for j in [1..numsg] do
            
            G := SmallGroup(i,j);
            ms := MaximalSubgroups(G);
            numms := Size(ms);
            if numms < 5 then
                # do nothing
            else
                # p is the 1st atom
                for p in [1..(numms-4)] do
                    # q is the 2nd atom
                    for q in [(p+1)..(numms-3)] do
                        H := Intersection(ms[p],ms[q]);
                        
                        # Test whether interval [H, G] has exactly 7 subgroups (including H and G);
                        # but since GAP doesn't count H and G, check whether numintSubs is 5.
                        intSubs := IntermediateSubgroups(G, H);
                        numintSubs := Size(intSubs.subgroups);
                        if numintSubs =5 then
                            # r is the 3rd atom
                            for r in [(q+1)..(numms-2)] do
                                if H = Intersection(ms[p],ms[r]) and 
                                   H = Intersection(ms[q],ms[r]) then
                                    meetcnt := Maximum(meetcnt, 3);
                                    
                                    # s is the 4th atom
                                    for s in [(r+1)..(numms-1)] do
                                        if H = Intersection(ms[p],ms[s]) and 
                                           H = Intersection(ms[q],ms[s]) and
                                           H = Intersection(ms[r],ms[s]) then
                                            meetcnt := Maximum(meetcnt, 4);
                                            
                                            # t is the 5th atom
                                            for t in [(s+1)..(numms)] do
                                                if H = Intersection(ms[p],ms[t]) and 
                                                   H = Intersection(ms[q],ms[t]) and
                                                   H = Intersection(ms[r],ms[t]) and 
                                                   H = Intersection(ms[s],ms[t]) then
                                                    meetcnt := Maximum(meetcnt, 5);
                                                    
                                                    msind := List([p, q, r, s, t]);
                                                    numPcounters := numPcounters + 1;
                                                    Print("\n", numPcounters, " ", numcounters, 
                                                          "FOUND AN M_5: GAPid = [", 
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
                                                            Print("  ...it has non-core-free max subgp ",
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
                                            od;   # t
                                        fi;
                                    od; # s
                                fi;
                            od;  # r
                        fi;
                        #fi;  IsNormal
                    od;   # q
                od;  # p
            fi;
            #fi;
        od;
        Print(" ... done (max number of meets = ", meetcnt, ") \n");
        AppendTo(outfile, " ... done.\n");
    od;
end;;

