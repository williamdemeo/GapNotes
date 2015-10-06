findUpperMnInGroup:=function(args)
    local trips, ms, sms, i, j, k, A, intsubs, G, n, m;
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
    return [sms[triple[3]] g];
end;