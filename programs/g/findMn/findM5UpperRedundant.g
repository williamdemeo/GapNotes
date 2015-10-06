findM5UpperRedundant:=function(N1, N2)
    # GAP function for finding groups G with an M_5 upper interval [H, G] in Sub(G).
    # This program was renamed findM5UpperRedundant, since it has been replaced by
    # the new (less redundant) findM5Upper.g program, which ignores examples for 
    # which H is not core-free in G.
    # 
    # INPUT  
    #        (N1, N2) search among all groups G of order |G| between N1 and N2.
    #
    # OUTPUT
    #        findM5UpperRedundantN1-N2.out  a file containing a list of groups with this property.
    #
    # Author: William DeMeo <williamdemeo@gmail.com>
    # Date: 2011.01.18
    # 
    
    local pathname, filename, outfile, i, j, k, p, q, r, s, t, u, v, numsg, G, H, ms, numms, count, intSubs, numintSubs, 
          msind, zeros, threes, mark, coreflag, core, numPcounters, numcounters, flag, meetcnt, maxindx, minindx, indx, e;
    
    numcounters := 0;    # running total of number of groups with an M5
    maxindx := 0;
    minindx := 9999;
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/M5/findM5UpperRedundant", String(N1), "-", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "Small groups of orders ",  String(N1), " up to ", String(N2), " with an upper M5\n\n");
    AppendTo(outfile, "|M_5|  [G:H]  max[G:H]  GAPid       atom indices           [H, G]   \n");
    
    for i in [N1..N2] do
        
        meetcnt := 0;        # the number of maximal subgroups which meet at a single subgrous
        numsg := NumberSmallGroups(i);
        Print(numcounters, " Checking the ", numsg, " group(s) of order |G| = ", i, "...");
        
        for j in [1..numsg] do
            flag :=0; 
            G := SmallGroup(i,j);
            e := Group([Identity(G)]);      # the trivial group with one element (it belongs to every group).
            ms := MaximalSubgroups(G);
            numms := Size(ms);
            if numms < 5 then
                # do nothing
            else
                # p is the 1st atom
                for p in [1..(numms-4)] do
                    if flag=0 then   #  limit to one M5 per group
                        # q is the 2nd atom
                        for q in [(p+1)..(numms-3)] do
                            if flag=0 then   # limit to one M5 per group
                                H := Intersection(ms[p],ms[q]);
                                if IsNormal(G,H) and H<>e then
                                    # do nothing (if H normal, this isn't really a new example)
                                else
                                    # Test whether interval [H, G] has exactly 5 intermediate subgroups
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
                                                        for t in [(s+1)..numms] do
                                                            if H = Intersection(ms[p],ms[t]) and 
                                                               H = Intersection(ms[q],ms[t]) and
                                                               H = Intersection(ms[r],ms[t]) and
                                                               H = Intersection(ms[s],ms[t]) then
                                                                meetcnt := Maximum(meetcnt, 5);
                                                                msind := List([p, q, r, s, t]);
                                                                flag :=1;
                                                                indx := Index(G,H);
                                                                maxindx := Maximum(maxindx, indx);
                                                                minindx := Minimum(minindx, indx);
                                                                Print("\n", numcounters, "  ", indx, "  ", maxindx, " M_5: GAPid = [", i, ", ", j, 
                                                                      "]    [H, G] = [", 
                                                                      StructureDescription(H), ", ", StructureDescription(G), " ]  \n");
                                                                AppendTo(outfile, "\n");
                                                                AppendTo(outfile, numcounters, "  ", indx, "  ", maxindx, "   (", i, ", ", j, ")    ", msind, 
                                                                        "           [ ", StructureDescription(H), " , ", StructureDescription(G), " ]"); 
                                                            fi;
                                                        od; # t
                                                    fi;
                                                od; # s
                                            fi;
                                        od;  # r
                                    fi; # normality check
                                fi;
                            fi; # if flag=0
                        od;   # q
                    fi;   # if flag=0
                od;  # p
            fi;
            numcounters := numcounters + flag;
        od;
        #        Print(" ... done (max number of meets = ", meetcnt, ")");
        Print(" ...done  (max/min index = ", maxindx, "/", minindx,  ") \n");
    od;
end;;

