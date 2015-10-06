# This is GAP code for searching for groups H, K
# such that <H,K> = HKHKHK... (n factors) but 
# KHKH... is strictly contained in <H,K>.
#
# It is easy to check that HKH = KHK implies <H,K> = HKH,
# However, we found examples for which 
# <H,K> = HKH, but KHK is strictly contained in HKH.
# (See ThreePermutingExampleSearch.g)
#
# Now we see if the same is true, not only for n=3,
# but also for higher n.
#
# Author: William DeMeo
# Date: 20130520

Read("PermutingSubgroups.g");

NPermutingSearch:=function(N,N1,N2)
    # N:=4;
    # N1:=56;
    # N2:=95;
    local m, n, r, s, candidates, i, j, ng, G, ccsg, nccsg, h, H, conjH, k, K, conjK, normH, normK, HKH, KHK, g;
    
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
            for m in [2..nccsg-2] do
                h:=Representative(ccsg[m]);
                conjH:=ConjugateSubgroups(G,h);
                for r in [1..Length(conjH)] do
                    H = conjH[r];
                # if IsNormal(G,H) then
                #     # do nothing
                # else
                    for n in [m+1..nccsg-1] do 
                        k:=Representative(ccsg[n]);
                        conjK:=ConjugateSubgroups(G,k);
                        for K in conjK do
                        if IsSubgroup(K,H) or IsSubgroup(H,K) then #or IsNormal(G,K) then
                            # do nothing
                        else 
                            # --- This part is not necessary, but I don't think it hurts. ---
                            # normH:=Normalizer(G,H);
                            # normK:=Normalizer(G,K);
                            # if IsSubgroup(normH,K) or IsSubgroup(normK,H) then
                            #     # do nothing
                            # else
                                # --- ---
                                
                                # finally we have candidates H, K
                                # check if these are N-permuting subgroups
                                #if AreNPermuting(H,K,N) then
                                # do nothing
                                #else
                                HKH:=Compose(H,K,N);
                                KHK:=Compose(K,H,N);
                                g:=ClosureGroup(H,K);
                                if Size(HKH) <> Size(KHK) and (Size(HKH)=Order(g) or Size(KHK)=Order(g)) then
#                                    Print("===============>  Candidate: SmallGroup(", i, ", ", j, "), H=cc[", m, "], K=cc[", n, "]    <=============== \n ");
                                                Print("===============>  Couterexample: SmallGroup(", i, ", ", j, "), H=cc[", m, "]^", r, ", K=cc[", n, "]^", s, "    <=============== \n ");
                                                Print("                                 J in [K, HKH] is intermediate subgroup number ", p, "\n");
                                                Add(candidates, [i,j,m,n,r,s]);
                                    # Print(" <H,K>: ", StructureDescription(g)," |<H,K>|=", Order(g), "\n");
                                    # Print("        Elements(<H,K>):  ", Elements(g), "\n ");
                                    # Print(" H: ", StructureDescription(H),"  gens: ", GeneratorsOfGroup(H), " |HKHK...|=", Size(HKH), "\n");
                                    # Print("  HKHK...: ", HKH, "\n");
                                    # Print(" K: ", StructureDescription(K),"  gens: ", GeneratorsOfGroup(K), " |KHKH...|=", Size(KHK), "\n");
                                    # Print("  KHKH...: ", KHK, "\n");
                                    Add(candidates, [i,j,m,n,r,s]);
                                fi;
                                #fi;
                            #fi;
                        fi;
                        od;
                    od;
                #fi;
                od;
            od;
        fi;
        od;
    od;

    Print("The candidates are: \n");
    Print(candidates, "\n");
end;

# For N=5.  Examples:
# ===============>  Candidate: SmallGroup(96, 70), H=cc[3], K=cc[18]    <=============== 
#   <H,K>: ((C2 x C2 x C2 x C2) : C3) : C2 |<H,K>|=96
#   H: C2  gens: [ f4 ] |HKHK...|=78 
#   K: C6  gens: [ f1, f2 ] |KHKH...|=96
# ===============>  Candidate: SmallGroup(108, 37), H=cc[4], K=cc[8]    <=============== 
#   <H,K>: (C3 x C3 x C3) : C4 |<H,K>|=108
#   H: C3  gens: [ f4*f5 ] |HKHK...|=102 
#   K: C4  gens: [ f1, f2 ] |KHKH...|=108
  
GetExample:=function(args)
    local i, j, m, n, p, x, G, H, K, A, B, cc, J;
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
    Ans:=GetExample(args);
    DisplayExample(Ans[1],Ans[2],Ans[3]);
end;
  