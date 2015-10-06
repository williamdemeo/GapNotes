findHexagon:=function(N1, N2)
    # GAP function for finding groups G with an upper interval [H, G] in Sub(G)
    # that is a hexagon and such that H is core free in G. 
    # 
    # INPUT  
    #        (N1, N2) search among all groups G of order |G| between N1 and N2.
    #
    # OUTPUT
    #        findHexagonN1-N2.out  a file containing a list of groups with this property.
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
    # Author: William DeMeo <williamdemeo@gmail.com>
    # Date: 2011.01.20
    # 
    
    local pathname, filename, outfile, i, j, k, p, q, K1, K2, numsg, G, H, ms, numms, count, intSubs, intSubs1, intSubs2, 
          msind, core, numcounters, flag, meetcnt, maxindx, minindx, indx, e, nsolv, totnsolv;

    numcounters := 0;    # running total of number of groups with an M4
    totnsolv := 0;       # running total of number of groups with M4 that are not solvable
    nsolv := 0;          # nsolv=1 indicates that the current group is not solvable
    maxindx := 0;
    minindx := 9999;
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/findHexagon", String(N1), "-", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "Small groups of orders ",  String(N1), " up to ", String(N2), " with an upper M4\n\n");
    AppendTo(outfile, "|Hex|  [G:H]  max[G:H]  NotSolv  TotNotSolv   GAPid       atom indices           [H, G]   \n");
    
    for i in [N1..N2] do
        
        numsg := NumberSmallGroups(i);
        Print(numcounters, " Checking the ", numsg, " group(s) of order |G| = ", i, "...");
        
        for j in [1..numsg] do
            flag :=0; 
            G := SmallGroup(i,j);
            
            # check nonabelian
            if IsAbelian(G) then
                
                # do nothing
                
            else
            e := Group([Identity(G)]);
            ms := MaximalSubgroups(G);
            numms := Size(ms);
            if numms < 2 then
                # do nothing
            else
                
                # p is the 1st atom
                for p in [1..(numms-1)] do
                    
                    if flag=0 then   # let's just limit ourselves to one hexagon per group
                        
                        # q is the 2nd atom
                        for q in [(p+1)..(numms)] do
                            
                            if flag=0 then   # limit to one hexagon per group
                                
                                K1 := ms[p];  K2 := ms[q];
                                 
                                H := Intersection(K1, K2);
                                
                                # checking normality is faster than computing the entire core
                                # so inserting the following line speeds things up a bit
                                if IsNormal(G,H) and H<>e then
                                    
                                    # do nothing
                                    
                                # check that H is core-free
                                elif Core(G,H)=e then   
                                    
                                # check only one group between H and K1
                                intSubs1 := IntermediateSubgroups(K1,H);
                                if Size(intSubs1.subgroups)=1 then
                                            
                                    # check only one group between H and K2
                                    intSubs2 := IntermediateSubgroups(K2,H);
                                    if Size(intSubs2.subgroups)=1 then                                            
                                
                                
                                    # check that [H, G] has exactly 4 intermediate subgroups
                                    intSubs := IntermediateSubgroups(G, H);
                                    if Size(intSubs.subgroups)=4 then
                                        
                                                        
                                                if not IsSolvable(G) then
                                                    nsolv:=1;
                                                    totnsolv := totnsolv + nsolv;
                                                else
                                                    nsolv := 0;
                                                fi;
                                                
                                                msind := List([p, q]);
                                                flag :=1;  # we have found at least one hexagon in this group;
                                                           # with this flag set, we'll move on to the next group
                                                indx := Index(G,H);
                                                minindx := Minimum(minindx, indx);
                                                maxindx := Maximum(maxindx, indx);
                                                        
                                                Print("\n", numcounters, "  ", indx, "  ", maxindx, "  ", nsolv, 
                                                      "  ", totnsolv, "   hex: GAPid = [", i, ", ", j, "]    [H, G] = [", 
                                                      StructureDescription(H), ", ", StructureDescription(G), " ]  \n");
                                                AppendTo(outfile, numcounters, "  ", indx, "  ", maxindx, "  ", nsolv, 
                                                        "  ", totnsolv, "     (", i, ", ", j, ")    ", msind, "         [ ", 
                                                        StructureDescription(H), " , ", StructureDescription(G), " ]\n"); 
                                            fi;
                                        fi;
                                    fi;
                                fi;
                            fi; # if flag=0
                        od;   # q
                    fi;   # if flag=0
                od;  # p
            fi;
            fi;
        
            numcounters := numcounters + flag;
        od;
        Print(" ...done  (max/min index = ", maxindx, "/", minindx, ";   ", totnsolv, " insoluble examples) \n");
    od;
end;;

