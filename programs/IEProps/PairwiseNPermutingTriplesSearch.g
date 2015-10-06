# This is GAP code for searching for groups G
# that have triples [Kp, Kq, Kr] of intermediate
# subgroups that pairwise N-permute.
#
# Author: William DeMeo
# Date: 20130528

Read("PermutingSubgroups.g");
Read("findMnInGroup.g");

findPalfySaxlExamples:=function(n,N,N1,N2)
    local triples, t, candidates, G, H, K, ng, intsubs, i, j, k, p, q, nsubs;
    
    candidates:=[];
    for p in [N1..N2] do
        ng:=NrSmallGroups(p);
        Print("Checking the ", ng, " group(s) of order ", p, "\n");
        for q in [1..ng] do
            G:=SmallGroup(p,q);
            triples:=findMnInGroup(G,n);
            for t in triples do
                Ans:=getMnInGroup(G,t);
                H:=Ans[1]; K:=Ans[2];
                intsubs:=IntermediateSubgroups(K,H);
                nsubs:=Length(intsubs.subgroups);  # this should be n
                for i in [1..nsubs-2] do
                    Ki:=intsubs.subgroups[i];
                    for j in [1..nsubs-1] do
                        Kj:=intsubs.subgroups[j];
                        for k in [1..nsubs] do
                            Kk:=intsubs.subgroups[k];
                            if AreNPermuting(Ki, Kj, N) and AreNPermuting(Ki, Kk, N) and AreNPermuting(Kj,Kk,N) then
                                Add(candidates, [p,q,t[1],t[2],t[3],i,j,k]);
                            fi;
                        od;    
                    od;
                od;
            od;
        od;
    od;
    Print("The candidates are: \n");
    Print(candidates, "\n");
end;
    

PairwiseNPermutingTriplesSearch:=function(N,N1,N2)
    local m, n, r, s, t, p, q, Q, candidates, i, j, ng, G, ccsg, nccsg, h, H, conjH, k, K, conjK, normH, normK, HKH, KHK, g, conjQ;
    
    candidates:=[];
    for i in [N1..N2] do
        ng:=NrSmallGroups(i);
        Print("Checking the ", ng, " group(s) of order ", i, "\n");
        for j in [1..ng] do
            G:=SmallGroup(i,j);
            if IsAbelian(G) then
                # do nothing
            else
                ccsg:=ConjugacyClassesSubgroups(G);
                nccsg:=Length(ccsg);
                for m in [2..nccsg-3] do
                    h:=Representative(ccsg[m]);
                    conjH:=ConjugateSubgroups(G,h);
                    for r in [1..Length(conjH)] do
                        H := conjH[r];
                        for n in [m+1..nccsg-2] do 
                            k:=Representative(ccsg[n]);
                            conjK:=ConjugateSubgroups(G,k);
                            for s in [1..Length(conjK)] do
                                K:=conjK[s];
                                for p in [n+2..nccsg-1] do 
                                    q:=Representative(ccsg[p]);
                                    conjQ:=ConjugateSubgroups(G,q);
                                    for t in [1..Length(conjQ)] do
                                        Q:=conjQ[t];
                                        if IsSubgroup(K,H) or IsSubgroup(H,K) or IsSubgroup(K,Q) or IsSubgroup(Q,K) or IsSubgroup(H,Q) or IsSubgroup(Q,H) then 
                                            # do nothing
                                        elif AreNPermuting(H, K, N) and AreNPermuting(H, Q, N) and AreNPermuting(K,Q,N) then
                                            Print("===============>  Example: SmallGroup(", i, ", ", j, "), H=cc[", m, "]^", r, ", K=cc[", n, "]^", s, ",  Q=cc[", p, "]^", t, "    <=============== \n ");
                                            Add(candidates, [i,j,m,r,n,s,p,t]);
                                        fi;
                                    od;    
                                od;
                            od;
                        od;
                    od;
                od;
            fi;
        od;
    od;
    Print("The candidates are: \n");
    Print(candidates, "\n");
end;
  
GetExample:=function(args)
    local g, i, j, m, n, p, x, G, H, K, A, B, cc, J, intsubs;
    i:=args[1]; j:=args[2]; m:=args[3]; n:=args[4]; p:=args[5]; x:=args[6];
    G:=SmallGroup(i,j);
    cc:=ConjugacyClassesSubgroups(G);
    H:=Representative(cc[m]);
    K:=Representative(cc[n]);
    g:=ClosureGroup(H,K);
    if x=0 then
        A:=H; B:=K;
    else
        A:=K; B:=H;
    fi;
    intsubs:=IntermediateSubgroups(g,A);
    J:=intsubs.subgroups[p];
    #BcapJ:=Intersection(J,B);
    return [A, B, J];
end;

DisplayExample:=function(H,K,J)
    local JcapK, intsubs, g, HcapK, i;
    g:=ClosureGroup(H,K);
    HcapK:=Intersection(H,K);
    JcapK:=Intersection(J,K);
    Print("\n<H,K>: ", g, " == ", StructureDescription(g),"\n");
    Print("    J: ", J, " == ", StructureDescription(J),"\n");
    Print("    H: ", H, " == ", StructureDescription(H),"\n");
    Print("    K: ", K, " == ", StructureDescription(K),"\n");
    Print("JcapK: ", JcapK, " == ", StructureDescription(JcapK),"\n");
    Print("HcapK: ", HcapK, " == ", StructureDescription(HcapK),"\n\n");
    intsubs:=IntermediateSubgroups(g,H);
    Print("[H, <H,K>]: \n");
    Print(intsubs, "\n");
    Print("             == ");
    for i in [1..Length(intsubs.subgroups)] do
        Print(StructureDescription(intsubs.subgroups[i]), ", ");
    od;
    intsubs:=IntermediateSubgroups(K,HcapK);
    Print("\n[HcapK, K]: \n");
    Print(intsubs, "\n");
    Print("             == ");
    for i in [1..Length(intsubs.subgroups)] do
        Print(StructureDescription(intsubs.subgroups[i]), ", ");
    od;
    Print("\n\n");
end;

GetAndDisplayExample:=function(args)
    local Ans;
    Ans:=GetExample(args);
    DisplayExample(Ans[1],Ans[2],Ans[3]);
end;
  