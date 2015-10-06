findM6Upper:=function(N1, N2)
    # GAP function for finding groups G with an M_6 upper interval [H, G] in Sub(G).
    # and such that H is core free in G.  (The reason for the core-free restriction is that
    # if [H, G] is M_6 with core(H) non-trivial, then [H/core(H), G/core(H)] is M_6 and this 
    # M_6 interval will have been found at an earlier iteration in the search loop.
    # Also, the indices [G:H] and [G/core(H):H/core(H)] are the same, so the "new" interval
    # [H,G] is redundant and should not count as a new example.)
    # 
    # INPUT  
    #        (N1, N2) search among all groups G of order |G| between N1 and N2.
    #
    # OUTPUT
    #        findM6UpperN1-N2.out  a file containing a list of groups with this property.
    #
    # Author: William DeMeo <williamdemeo@gmail.com>
    # Date: 2011.01.18
    # 
    
    local pathname, filename, outfile, i, j, k, p, q, r, s, t, u, numsg, G, H, ms, numms, count, intSubs,
          msind, core, numcounters, flag, maxindx, minindx, indx, e;

    numcounters := 0;    # running total of number of groups with an M6
    maxindx := 0;
    minindx := 9999;
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/M6/findM6Upper", String(N1), "-", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "Small groups of orders ",  String(N1), " up to ", String(N2), " with an upper M6\n\n");
    AppendTo(outfile, "|M_6|  [G:H]  max[G:H]  GAPid       atom indices           [H, G]   \n");
    
    for i in [N1..N2] do
        
        numsg := NumberSmallGroups(i);
        Print(numcounters, " Checking the ", numsg, " group(s) of order |G| = ", i, "...");
        
        for j in [1..numsg] do
            flag :=0; 
            G := SmallGroup(i,j);
            e := Group([Identity(G)]);
            ms := MaximalSubgroups(G);
            numms := Size(ms);
            if numms < 6 then
                # do nothing
            else
                
                # p is the 1st atom
                for p in [1..(numms-5)] do
                    if flag=0 then   #  limit to one M6 per group
                        
                        # q is the 2nd atom
                        for q in [(p+1)..(numms-4)] do
                            if flag=0 then   # limit to one M6 per group
                                
                                H := Intersection(ms[p],ms[q]);
                                
                                # checking normality is faster than computing the entire core
                                # so inserting the following line speeds things up a bit
                                if IsNormal(G,H) and H<>e then
                                    
                                    # do nothing
                                    
                                    # check that H is core-free
                                    elif Core(G,H)=e then   
                                    
                                    # check that [H, G] has exactly 6 intermediate subgroups
                                    intSubs := IntermediateSubgroups(G, H);
                                    if Size(intSubs.subgroups)=6 then
                                        
                                        # r is the 3rd atom
                                        for r in [(q+1)..(numms-3)] do
                                            if H = Intersection(ms[p],ms[r]) and 
                                               H = Intersection(ms[q],ms[r]) then
                                                
                                                # s is the 4th atom
                                                for s in [(r+1)..(numms-2)] do
                                                    if H = Intersection(ms[p],ms[s]) and 
                                                       H = Intersection(ms[q],ms[s]) and
                                                       H = Intersection(ms[r],ms[s]) then
                                                        
                                                        # t is the 5th atom
                                                        for t in [(s+1)..numms-1] do
                                                            if H = Intersection(ms[p],ms[t]) and 
                                                               H = Intersection(ms[q],ms[t]) and
                                                               H = Intersection(ms[r],ms[t]) and
                                                               H = Intersection(ms[s],ms[t]) then
                                                                
                                                                # u is the 6th atom
                                                                for u in [(t+1)..numms] do
                                                                    if H = Intersection(ms[p],ms[u]) and 
                                                                       H = Intersection(ms[q],ms[u]) and
                                                                       H = Intersection(ms[r],ms[u]) and
                                                                       H = Intersection(ms[s],ms[u]) and
                                                                       H = Intersection(ms[t],ms[u]) then
                                                                        
                                                                        msind := List([p, q, r, s, t, u]);
                                                                        
                                                                        flag :=1;  # we have found at least one M6 in this group;
                                                                        # with this flag set, we'll move on to the next group
                                                                        
                                                                        indx := Index(G,H);
                                                                        minindx := Minimum(minindx, indx);
                                                                        maxindx := Maximum(maxindx, indx);
                                                                        
                                                                        Print("\n", numcounters, "  ", indx, "  ", maxindx, " M_6: GAPid = [", 
                                                                              i, ", ", j, "]    [H, G] = [", 
                                                                              StructureDescription(H), ", ", StructureDescription(G), " ]  \n");
                                                                        AppendTo(outfile, "\n");
                                                                        AppendTo(outfile, numcounters, "  ", indx, "  ", maxindx, 
                                                                                "   (", i, ", ", j, ")    ", msind, "           [ ", 
                                                                                StructureDescription(H), " , ", StructureDescription(G), " ]"); 
                                                                    fi;
                                                                od; # u
                                                            fi;
                                                        od; # t
                                                    fi;
                                                od; # s
                                            fi;
                                        od;  # r
                                    fi; # core-free check
                                fi;
                            fi; # if flag=0
                        od;   # q
                    fi;   # if flag=0
                od;  # p
            fi;
            numcounters := numcounters + flag;
        od;
        Print(" ...done  (max/min index = ", maxindx, "/", minindx,  ") \n");
    od;
end;;

