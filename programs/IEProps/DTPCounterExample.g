# This is GAP code for searching for groups H, K such that 
# $\<H,K\> = HKH = KHK$ but there is a group J in $[K, HKH]$ 
# such that $H \cap J$ does not 3 permute with K OR 
# there is a group J in $[H, HKH]$ such that $K \cap J$ does 
# not 3 permute with H.
#
# This would provide a counter-example to an extension to
# 3-permutable of the DTP lemma.
# 
# Author: William DeMeo
# Date: 20130521

Read("PermutingSubgroups.g");

DTPCounterExample:=function(N,N1,N2)
    # N1:=56;
    # N2:=95;
    local candidates, i, j, m, n, r, s, p, q, ng, G, ccsg, nccsg, J, h,
          H, conjH, k, K, conjK, normH, normK, HKH, KHK, g, intsubs, HcapJ, KcapJ;
    
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
                        H:= conjH[r];
                        for n in [m+1..nccsg-1] do 
                            k:=Representative(ccsg[n]);
                            conjK:=ConjugateSubgroups(G,k);
                            for s in [1..Length(conjK)] do
                                K:=conjK[s];
                                if IsSubgroup(K,H) or IsSubgroup(H,K) then #or IsNormal(G,K) then
                                    # do nothing
                                else
                                    g:=ClosureGroup(H,K);
                                    if AreNPermuting(H,K,N) then
                                        intsubs:=IntermediateSubgroups(g,K);
                                        for p in [1..Size(intsubs.subgroups)] do
                                            J:=intsubs.subgroups[p];
                                            HcapJ:=Intersection(H,J);
                                            if not AreNPermuting(K,HcapJ,N) then
                                                Print("===============>  Couterexample: SmallGroup(", i, ", ", j, "), H=cc[", m, "]^", r, ", K=cc[", n, "]^", s, "    <=============== \n ");
                                                Print("                                 J in [K, HKH] is intermediate subgroup number ", p, "\n");
                                                Add(candidates, [i,j,m,n,r,s,p,1]);
                                            fi;
                                        od;
                                        intsubs:=IntermediateSubgroups(g,H);
                                        for p in [1..Size(intsubs.subgroups)] do
                                            J:=intsubs.subgroups[p];
                                            KcapJ:=Intersection(K,J);
                                            if not AreNPermuting(H,KcapJ,N) then
                                                Print("===============>  Couterexample: SmallGroup(", i, ", ", j, "), H=cc[", m, "]^", r, ", K=cc[", n, "]^", s, "    <=============== \n ");
                                                Print("                                 J in [H, HKH] is intermediate subgroup number ", p, "\n");
                                                Add(candidates, [i,j,m,n,r,s,p,0]);
                                            fi;
                                        od;
                                    fi;
                                fi;
                            od;
                        od;
                    od;
                od;
            fi;
        od;
    od;

    Print("Counterexample indices:\n");
    Print(candidates, "\n");
    Print("where [i,j,m,n,r,s,p,x] corresponds to SmallGroup(i,j), H=cc[m]^r  K=cc[n]^s with \n",
          "J in [H, HKH] if x=0, and J is intermediate subgroup number p\n ");
    return candidates;
    
end;



### This is the quick, but not thorough version.
### Here we don't check conjugates of conjugacy class reps.
DTPCounterExampleQuick:=function(N,N1,N2)
    # N1:=56;
    # N2:=95;
    local candidates, i, j, m, n, r, s, p, q, ng, G, ccsg, nccsg, J, h,
          H, conjH, k, K, conjK, normH, normK, HKH, KHK, g, intsubs, HcapJ, KcapJ;
    
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
                    H:=Representative(ccsg[m]);
                    # conjH:=ConjugateSubgroups(G,h);
                    # for r in [1..Length(conjH)] do
                    #     H:= conjH[r];
                        for n in [m+1..nccsg-1] do 
                            K:=Representative(ccsg[n]);
                            # conjK:=ConjugateSubgroups(G,k);
                            # for s in [1..Length(conjK)] do
                            #     K:=conjK[s];
                                if IsSubgroup(K,H) or IsSubgroup(H,K) then #or IsNormal(G,K) then
                                    # do nothing
                                else
                                    g:=ClosureGroup(H,K);
                                    if AreNPermuting(H,K,N) then
                                        intsubs:=IntermediateSubgroups(g,K);
                                        for p in [1..Size(intsubs.subgroups)] do
                                            J:=intsubs.subgroups[p];
                                            HcapJ:=Intersection(H,J);
                                            if not AreNPermuting(K,HcapJ,N) then
                                                Print("===============>  Couterexample: [",i,",",j,",",m,",",n,",",p,",1] SmallGroup(", i, ", ", j, "), H=cc[", m, "], K=cc[", n, "]    <=============== \n ");
                                                Print("                                 J in [K, HKH] is intermediate subgroup number ", p, "\n");
                                                Add(candidates, [i,j,m,n,p,1]);
                                            fi;
                                        od;
                                        intsubs:=IntermediateSubgroups(g,H);
                                        for p in [1..Size(intsubs.subgroups)] do
                                            J:=intsubs.subgroups[p];
                                            KcapJ:=Intersection(K,J);
                                            if not AreNPermuting(H,KcapJ,N) then
                                                Print("===============>  Couterexample: [",i,",",j,",",m,",",n,",",p,",0]  SmallGroup(", i, ", ", j, "), H=cc[", m, "], K=cc[", n, "]    <=============== \n ");
                                                Print("                                 J in [H, HKH] is intermediate subgroup number ", p, "\n");
                                                Add(candidates, [i,j,m,n,p,0]);
                                            fi;
                                        od;
                                    fi;
                                fi;
                            #od;
                        od;
                    #od;
                od;
            fi;
        od;
    od;

    Print("Counterexample indices:\n");
    Print(candidates, "\n");
    Print("where [i,j,m,n,r,s,p,x] corresponds to SmallGroup(i,j), H=cc[m]^r  K=cc[n]^s with \n",
          "J in [H, HKH] if x=0, and J is intermediate subgroup number p\n\n");
    Print("---- Commands for getting the examples ---- \n");
    Print("G:=SmallGroup(i,j);;  cc:=ConjugacyClassesSubgroups(G);;\n");
    Print("H:=Representative(cc[m]);; K:=Representative(cc[n]);;\n");
    Print("g:=ClosureGroup(H,K);;\n");
    Print("intsubs:=IntermediateSubgroups(g,H);;  (assuming x=0; otherwise use K)\n");
    Print("J:=intsubs.subgroups[p];;\n");
    return candidates;
end;


GetExample:=function(args)
    local g, intsubs, i, j, m, n, p, x, G, H, K, A, B, cc, J;
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
