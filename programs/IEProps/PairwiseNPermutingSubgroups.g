#
# For a given group G, let K[1], ..., K[r] be the set
# of intermediate subgroups of G.  That is,
#  1 < K[i] < G for i=1,...,r.
# 
# For a given group G and positive integer n>1, 
# this program finds all triples [i, j, k] such that 
# [K[i], K[j], K[k]] is a set of pairwise n-permuting
# subgroups of G.
#
PairwiseNPermutingSubgroups:=function(G,n)
    local intsubs, nonpermcnt, nperm, i, j, k, Ki, Kj, Kk, N;
    intsubs:=IntermediateSubgroups(G,Group(One(G)));
    nonpermcnt:=0;
    nperm:=[];
    N:=Length(intsubs.subgroups);
    for i in [1..N-2] do
        Ki:=intsubs.subgroups[i];
        for j in [i+1..N-1] do
            Kj:=intsubs.subgroups[j];
            for k in [j+1..N] do
                Kk:=intsubs.subgroups[k];
                if AreNPermuting(Ki,Kj,n) and AreNPermuting(Ki,Kk,n) and AreNPermuting(Kj,Kk,n) then
                    Add(nperm,[i,j,k]);  
                else
                    nonpermcnt:=nonpermcnt+1;
                fi;
            od;
        od;
    od;
    Print("Pairwise n-permuting triples: ", nperm ,"\n");
end;

                

    
    