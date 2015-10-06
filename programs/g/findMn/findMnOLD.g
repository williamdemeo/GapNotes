findMn:=function(n, N1, N2, insoluble)
    # GAP function for finding groups G with an M_n upper interval [H, G] in Sub(G)
    # and such that H is core free in G.  (The reason for the core-free restriction is that
    # if [H, G] is M_n with core(H) non-trivial, then [H/core(H), G/core(H)] is M_n and this 
    # M_n interval will have been found at an earlier iteration in the search loop.
    # Also, the indices [G:H] and [G/core(H):H/core(H)] are the same, so the "new" interval
    # [H,G] is redundant and should not count as a new example.)
    # 
    # INPUT  n    number of atoms in the searched for M_n
    #        (N1, N2) search among all groups G of order |G| between N1 and N2 (inclusive).
    #        insoluble   0 => search all groups; 1 => search only insoluble groups
    #
    # OUTPUT
    #        findMn-N1-N2.out  a file containing a list of groups with this property.
    #        The first few lines of the output file will look something like this:
    #
    #        |M_4|  [G:H]  max[G:H]  NotSolv  TotNotSolv   GAPid       atom indices           [H, G]   
    #
    #        0  6  6  0  0     (6, 1)    [ 1, 2, 3, 4 ]         [ 1 , S3 ]
    #        1  9  9  0  0     (9, 2)    [ 1, 2, 3, 4 ]         [ 1 , C3 x C3 ]
    #        2  9  9  0  0     (18, 4)    [ 2, 5, 8, 11 ]         [ C2 , (C3 x C3) : C2 ]
    #
    #        Interpretation of each column (using the last row above as an example): 
    #          - 2  (one less than) how many M4's have been found so far
    #          - 9  the index [G:H]
    #          - 9  the maximum index [G:H] that has been found so far
    #          - 0  the group in this row is solvable (1 => insoluble)
    #          - 0  the number of insoluble examples found so far
    #          - (18,4)  the GAP identifier for this group (get this group with G:=SmallGroup(18,4);)
    #          - [ 2, 5, 8, 11 ] the indices of the atoms (as maximal subgroups of G)  
    #              Get these subgroups with ms:= MaximalSubgroups(G); K1:=ms[2]; K2:=m2[5], etc.
    #
    # NOTES
    #
    #        Here's how to verify that the non-core-free redundancy is really a redundancy:
    #
    # Author: William DeMeo <williamdemeo@gmail.com>
    # Date: 2011.01.20
    # 
    
    local pathname, filename, outfile, i, j, k, p, q, r, s, t, u, v, numsg, G, H, ms, numms, count, intSubs, nsolv,
          msind, zeros, threes, mark, coreflag, core, numcounters, flag, meetcnt, maxindx, minindx, indx, e, totnsolv;

    numcounters := 0;    # running total of number of groups with an Mn
    totnsolv := 0;       # running total of number of groups with Mn that are not solvable
    nsolv := 0;          # nsolv=1 indicates that the current group is not solvable
    maxindx := 0;
    minindx := 9999;
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/findMnUpper", String(N1), "-", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "Small groups of orders ",  String(N1), " up to ", String(N2), " with an upper M4\n\n");
    AppendTo(outfile, "|M_4|  [G:H]  max[G:H]  NotSolv  TotNotSolv   GAPid       atom indices           [H, G]   \n");
    
    for i in [N1..N2] do
        
        meetcnt := 0;        # the number of maximal subgroups which meet at a single subgrous
        numsg := NumberSmallGroups(i);
        Print(numcounters, " Checking the ", numsg, " group(s) of order |G| = ", i, "...");
        
        for j in [1..numsg] do
            flag :=0; 
            G := SmallGroup(i,j);
            e := Group([Identity(G)]);
            atoms := findMnInGroup(G, n, atoms);
            ms := MaximalSubgroups(G);
            numms := Size(ms);
            atoms := List([ ]);
            
            if numms < 4 then
                # do nothing
            else
                
                # p is the 1st atom
                for p in [1..(numms-3)] do
                    if flag=0 then   # let's just limit ourselves to one M4 per group
                        
                        # q is the 2nd atom
                        for q in [(p+1)..(numms-2)] do
                            if flag=0 then   # limit to one M4 per group
                                
                                H := Intersection(ms[p],ms[q]);
                                
                                # check that H is core-free
                                if Core(G,H)=e then
                                
                                    # check that [H, G] has exactly 4 intermediate subgroups
                                    intSubs := IntermediateSubgroups(G, H);
                                    if Size(intSubs.subgroups)=4 then
                                        
                                        # r is the 3rd atom
                                        for r in [(q+1)..(numms-1)] do
                                            if H = Intersection(ms[p],ms[r]) and 
                                               H = Intersection(ms[q],ms[r]) then
                                                meetcnt := Maximum(meetcnt, 3);
                                                
                                                # s is the 4th atom
                                                for s in [(r+1)..numms] do
                                                    if H = Intersection(ms[p],ms[s]) and 
                                                       H = Intersection(ms[q],ms[s]) and
                                                       H = Intersection(ms[r],ms[s]) then
                                                        meetcnt := Maximum(meetcnt, 4);
                                                        
                                                        if not IsSolvable(G) then
                                                            nsolv:=1;
                                                            totnsolv := totnsolv + nsolv;
                                                        else
                                                            nsolv := 0;
                                                        fi;
                                                        
                                                        msind := List([p, q, r, s]);
                                                        
                                                        flag :=1;  # we have found at least one M4 in this group;
                                                                   # with this flag set, we'll move on to the next group
                                                        
                                                        indx := Index(G,H);
                                                        minindx := Minimum(minindx, indx);
                                                        maxindx := Maximum(maxindx, indx);
                                                        
                                                        Print("\n", numcounters, "  ", indx, "  ", maxindx, "  ", nsolv, 
                                                              "  ", totnsolv, "   M_4: GAPid = [", i, ", ", j, "]    [H, G] = [", 
                                                              StructureDescription(H), ", ", StructureDescription(G), " ]  \n");
                                                        AppendTo(outfile, numcounters, "  ", indx, "  ", maxindx, "  ", nsolv, 
                                                                "  ", totnsolv, "     (", i, ", ", j, ")    ", msind, "         [ ", 
                                                                StructureDescription(H), " , ", StructureDescription(G), " ]\n"); 
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
        #        Print(" ... done (max number of meets = ", meetcnt, ")");
        Print(" ...done  (max/min index = ", maxindx, "/", minindx, ";   ", totnsolv, " insoluble examples) \n");
    od;
end;;

