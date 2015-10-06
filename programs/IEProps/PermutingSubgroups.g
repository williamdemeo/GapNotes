# Author: William DeMeo
# Date: 20130520
# Last Update: 20130528

ComplexProduct:=function(H,K)
    # Given two subgroups H, K of a group G
    # return the set { hk : h in H, k in K }.
    local HK, h, k;
    HK:=[];
    for h in H do
        for k in K do
            if not h*k in HK then
                Add(HK,h*k);
            fi;
        od;
    od;
    return HK;
end;


Compose:=function(H,K,n)
    # For two subgroups H, K of a group G,
    # return the set HKHK...HK (n factors)
    # Examples: Compose(H,K,1) returns H
    #           Compose(H,K,2) returns HK    
    #           Compose(H,K,3) returns HKH
    #           Compose(H,K,4) returns HKHK
    if n<1 then
        Error("last argument must be a positive integer.");
    fi;
    if n=1 then
        return H;
    fi;
    return ComplexProduct(H,Compose(K,H,n-1));
end;

    

AreNPermuting:=function(H,K,n)
    # returns true if Compose(H,K,n)=Compose(K,H,n), false otherwise.
    local HKH, KHK, g;
    HKH:=Compose(H,K,n);
    KHK:=Compose(K,H,n);
    for g in HKH do
        if not g in KHK then
            return false;
        fi;
    od;
    for g in KHK do
        if not g in HKH then
            return false;
        fi;
    od;
    return true;
end;


Normalizes:=function(H,K)
    # returns true if H normalizes K, false otherwise.
    local g,N;
    g:=ClosureGroup(H,K);
    N:=Normalizer(g,K);
    return IsSubgroup(N,H);
end;


PairwiseNPermutingTriples:=function(G,n)
    # For a given group G, let {K[1], ..., K[r]} be the set
    # of nontrivial subgroups of G that are not equal to G.  
    # That is,
    #           1 < K[i] < G for i=1,...,r.
    # 
    # For a given group G and positive integer n>1, 
    # this program finds all triples [i, j, k] such that 
    # [K[i], K[j], K[k]] is a set of pairwise n-permuting
    # subgroups of G.
    #
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
    Print("Pairwise ", n, "-permuting triples: ", nperm ,"\n");
end;

                


    

# Don't use this one.  AreNPermtuing(H,K,2) is better.
ArePermuting:=function(H,K)
    # returns true if HK=KH, false otherwise.
    local dcHK,g;
    dcHK:=DoubleCoset(H,One(H),K);
    g:=ClosureGroup(H,K);
    if Size(dcHK)=Order(g) then
        return true;
    else
        return false;
    fi;
end;



# This version of Compose doesn't work because DoubleCoset expects a group
# as its third argument, whereas here we have given it a double coset.
#
# Compose:=function(G,H,K,n)
#     # For two subgroups H, K of a group G,
#     # return the set HKHK...HK (n factors)
#     # Examples: Compose(G,H,K,1) returns H
#     #           Compose(G,H,K,2) returns HK    
#     #           Compose(G,H,K,3) returns HKH
#     #           Compose(G,H,K,4) returns HKHK
#     if n<1 then
#         Error("last argument must be a positive integer.");
#     fi;
#     if n=1 then
#         return H;
#     fi;
#     return DoubleCoset(H,One(G),Elements(Compose(G,K,H,n-1)));
# end;
