findM5Upper:=function(N1, N2)
    # GAP function for finding groups G with an M_5 upper interval [H, G] in Sub(G).
    # and such that H is core free in G.  (The reason for the core-free restriction is that
    # if [H, G] is M_5 with core(H) non-trivial, then [H/core(H), G/core(H)] is M_5 and this 
    # M_5 interval will have been found at an earlier iteration in the search loop.
    # Also, the indices [G:H] and [G/core(H):H/core(H)] are the same, so the "new" interval
    # [H,G] is redundant and should not count as a new example.)
    # 
    # INPUT  
    #        (N1, N2) search among all groups G of order |G| between N1 and N2.
    #
    # OUTPUT
    #        findM5UpperN1-N2.out  a file containing a list of groups with this property.
    #
    # Author: William DeMeo <williamdemeo@gmail.com>
    # Date: 2011.01.20
    # 
    
    local pathname, filename, outfile, i, j, k, p, q, r, s, t, numsg, G, H, ms, numms, count, intSubs, nsolv,
          msind, core, numcounters, flag, maxindx, minindx, indx, e, totnsolv;
    
    numcounters := 0;    # running total of number of groups with an M5
    totnsolv := 0;       # running total of number of groups with M4 that are not solvable
    nsolv := 0;          # nsolv=1 indicates that the current group is not solvable
    maxindx := 0;
    minindx := 9999;
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/M5/findM5Upper", String(N1), "-", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "Small groups of orders ",  String(N1), " up to ", String(N2), " with an upper M5\n\n");
    AppendTo(outfile, "|M_5|  [G:H]  max[G:H]  GAPid       atom indices           [H, G]   \n");
    
    for i in [N1..N2] do
        
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
                                
                                
                                # checking normality is faster than computing the entire core
                                # so inserting the following line speeds things up a bit
                                if IsNormal(G,H) and H<>e then
                                    
                                    # do nothing
                                    
                                    # check that H is core-free
                                    elif Core(G,H)=e then   
                                    
                                    # Test whether interval [H, G] has exactly 5 intermediate subgroups
                                    intSubs := IntermediateSubgroups(G, H);
                                    if Size(intSubs.subgroups)=5 then
                                        
                                        # r is the 3rd atom
                                        for r in [(q+1)..(numms-2)] do
                                            if H = Intersection(ms[p],ms[r]) and 
                                               H = Intersection(ms[q],ms[r]) then
                                                
                                                # s is the 4th atom
                                                for s in [(r+1)..(numms-1)] do
                                                    if H = Intersection(ms[p],ms[s]) and 
                                                       H = Intersection(ms[q],ms[s]) and
                                                       H = Intersection(ms[r],ms[s]) then
                                                        
                                                        # t is the 5th atom
                                                        for t in [(s+1)..numms] do
                                                            if H = Intersection(ms[p],ms[t]) and 
                                                               H = Intersection(ms[q],ms[t]) and
                                                               H = Intersection(ms[r],ms[t]) and
                                                               H = Intersection(ms[s],ms[t]) then
                                                                
                                                                if not IsSolvable(G) then
                                                                    nsolv:=1;
                                                                    totnsolv := totnsolv + nsolv;
                                                                else
                                                                    nsolv := 0;
                                                                fi;
                                                                
                                                                msind := List([p, q, r, s, t]);
                                                                
                                                                flag :=1;
                                                                
                                                                indx := Index(G,H);
                                                                maxindx := Maximum(maxindx, indx);
                                                                minindx := Minimum(minindx, indx);
                                                                
                                                                Print("\n", numcounters, "  ", indx, "  ", maxindx, "  ", nsolv, 
                                                                      "  ", totnsolv, "   M_5: GAPid = [", i, ", ", j, "]    [H, G] = [", 
                                                                      StructureDescription(H), ", ", StructureDescription(G), " ]  \n");
                                                                AppendTo(outfile, numcounters, "  ", indx, "  ", maxindx, "  ", nsolv, 
                                                                        "  ", totnsolv, "     (", i, ", ", j, ")    ", msind, "         [ ", 
                                                                        StructureDescription(H), " , ", StructureDescription(G), " ]\n"); 
                                                        
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
        Print(" ...done  (max/min index = ", maxindx, "/", minindx, ";   ", totnsolv, " insoluble examples) \n");
    od;
end;;

