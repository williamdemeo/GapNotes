findUpperMnInGroup:=function(args)
    local trips, ms, sms, i, j, k, A, intsubs, G, n, m, incl;
    if Length(args) < 3 then 
        i:=0; 
    else 
        i:=args[3];
    fi;
    if Length(args) < 2 then 
        Print("Error: need at least two arguments"); 
    else 
        n:=args[2]; 
    fi;
    G:=args[1];
    
    # Make the list of inclusions that we're looking for; e.g., for n=4, 
    # incl:= [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ]
    incl:=[];
    for m in [1..n] do  Add(incl, [0,m]);  od;
    for m in [1..n] do  Add(incl, [m,n+1]);  od;
    trips:=[];
    ms:=MaximalSubgroupClassReps(G);
    if Length(ms)=0 or Order(ms[1])=1 then 
        return trips;
    else
        for j in [1..Length(ms)] do
            A:=ms[j];
            sms:=MaximalSubgroupClassReps(A);
            if Order(sms[1])=1 then
                intsubs:=IntermediateSubgroups(G,Group(One(G)));
                if incl=intsubs.inclusions then
                    Add(trips,[i,j,1]);
                fi;
            else
                for k in [1..Length(sms)] do
                    intsubs:=IntermediateSubgroups(G,sms[k]);
                    if incl=intsubs.inclusions then
                        Add(trips,[i,j,k]);
                    fi;
                od;
            fi;
        od;
    fi;
    return trips;
end;

findMnInGroup:=function(G,n)
    # Given a group G and a positive integer n, find 
    # triples [i, j, k] so that [H,K] is M_n, where
    # K is a representative of the i-th conjugacy class of subgroups of G
    # H is the k-th maximal subgroup class rep of the j-th maximal subgroup class rep of H.
    # To recover [H K] given the triple [i,j,k], use the function getMnInGroup(G,[i,j,k]) 
    # defined below.
    local i, cc, triples, rettrip;
    #G:=args[1]; n:=args[2];
    #triples:=findUpperMnInGroup([G,n,0]); (don't need: G is the last conj class)
    triples:=[];
    cc:=ConjugacyClassesSubgroups(G);
    for i in [2..Length(cc)] do
        rettrip:=findUpperMnInGroup([Representative(cc[i]),n,i]);
        if Length(rettrip)>0 then
            Append(triples, rettrip);
        fi;
    od;
    return triples;
end;
    

getMnInGroup:=function(G,triple)
    # Given a group G and a triple [i, j, k] return 
    # the array [H K] where H and K are subgroups of G
    # K is a representative of the i-th conjugacy class of subgroups of G
    # H is the k-th maximal subgroup class rep of the j-th maximal subgroup class rep of H.
    local cc,ms,g,sms;
    if triple[1]=0 then
        g:=G;
    else
        cc:=ConjugacyClassesSubgroups(G);
        g:=Representative(cc[triple[1]]);
    fi;
    ms:=MaximalSubgroupClassReps(g);
    sms:=MaximalSubgroupClassReps(ms[triple[2]]);
    return [sms[triple[3]], g];
end;


findMn:=function(args)
    # findMn:=function(n, N1, N2, primitive, insoluble)
    # GAP function for finding groups G with an M_n upper interval [H, G] in Sub(G)
    # and such that H is core free in G.  (The reason for the core-free restriction is that
    # if [H, G] is M_n with core(H) non-trivial, then [H/core(H), G/core(H)] is M_n and this 
    # M_n interval will have been found at an earlier iteration in the search loop.
    # Also, the indices [G:H] and [G/core(H):H/core(H)] are the same, so the "new" interval
    # [H,G] is redundant and should not count as a new example.)
    # 
    # INPUT  n    number of atoms in the searched for M_n
    #        (N1, N2) search among all groups G of order |G| between N1 and N2 (inclusive).
    #        primitive (optional, default=0)   0 => search all groups; 1 => search only primitive groups
    #        insoluble (optional, default=0)   0 => search all groups; 1 => search only insoluble groups
    #
    # OUTPUT
    #
    # Author: William DeMeo <williamdemeo@gmail.com>
    # Date: 2013.05.28
    # Last update: 2013.05.29
    # 
    
    local i, j, t, G, triples, output, numsg, n, N1, N2, primitive, insoluble, nargs;
    nargs:=Length(args);
    if nargs<5 then insoluble:=0; else insoluble:=args[5]; fi;
    if nargs<4 then primitive:=0; else primitive:=args[4]; fi;
    if nargs<3 then 
        Print("Error: need at least 3 arguments."); 
        return; 
    fi;
    n:=args[1]; N1:=args[2]; N2:=args[3];

    output:=[];
    for i in [N1..N2] do
        if primitive=1 then
            numsg:=NrPrimitiveGroups(i);
            Print("\nChecking the ", numsg, " primitive group(s) of degree ", i, "...\n|G|: ");
        else
            numsg:=NumberSmallGroups(i);
            Print("Checking the ", numsg, " group(s) of order |G| = ", i, "...\n");
        fi;
        for j in [1..numsg] do
            if primitive=1 then
                G := PrimitiveGroup(i,j);
                Print(Order(G),", ");
            else
                G := SmallGroup(i,j);
            fi;
            if insoluble=0 or (insoluble=1 and not IsSolvable(G)) then
                
                triples := findUpperMnInGroup([G, n]);
                if Length(triples)<>0 then Print("\n"); fi;
                for t in triples do
                    Add(output,[i,j,t[2],t[3]]);
                    Print("[",i,",",j,",",t[2],",",t[3],"]  ");
                od;
            fi;
        od;
    od;
    Print(output, "\n");
end;;

