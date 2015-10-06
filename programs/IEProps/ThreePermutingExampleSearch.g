# This is GAP code for searching for groups H, K
# such that <H,K> = HKH but HKH is not equal to KHK.
#
# It is easy to check that HKH = KHK implies <H,K> = HKH,
# However, it seems there may be examples for which 
# <H,K> = HKH, but KHK is strictly contained in HKH.
#
# The code below finds a small example (in A4) of this.
# Namely, let
#              G = SmallGroup(12,3)
#              cc = ConjugacyClassesSubgroups(G);
#              H = Representative(cc[3]);
#              K = Representative(cc[2]);
#              
# Then |G|=12=|HKH|, but |KHK|=10.
#
# Author: William DeMeo
# Date: 20130518

Read("PermutingSubgroups.g");

N1:=2;
N2:=24;
candidates:=[];
for i in [N1..N2] do
    ng:=NrSmallGroups(i);
    Print("Checking the ", ng, " group(s) of order ", i, "\n");
    for j in [1..ng] do
        G:=SmallGroup(i,j);
        ccsg:=ConjugacyClassesSubgroups(G);
        nccsg:=Length(ccsg);
        for m in [2..nccsg-2] do
            H:=Representative(ccsg[m]);
            if IsNormal(G,H) then
                # do nothing
            else
                for n in [m+1..nccsg-1] do 
                    K:=Representative(ccsg[n]);
                    if IsSubgroup(K,H) or IsSubgroup(H,K) or IsNormal(G,K) then
                        # do nothing
                    else 
                        # --- This part is not necessary, but I don't think it hurts. ---
                        normH:=Normalizer(G,H);
                        normK:=Normalizer(G,K);
                        if IsSubgroup(normH,K) or IsSubgroup(normK,H) then
                            # do nothing
                        else
                            # --- ---
                            
                            # finally we have candidates H, K
                            # check if these are three permuting subgroups
                            if AreNPermuting(H,K,3) then
                                # do nothing
                            else
                                HKH:=Compose(H,K,3);
                                KHK:=Compose(K,H,3);
                                g:=ClosureGroup(H,K);
                                if Size(HKH)=Order(g) or Size(KHK)=Order(g) then
                                    Print("===============>  Candidate: SmallGroup(", i, ", ", j, "), H=cc[", m, "], K=cc[", n, "]    <=============== \n ");
                                    Print(" <H,K>: ", StructureDescription(g)," |<H,K>|=", Order(g), "\n");
                                    Print("        Elements(<H,K>):  ", Elements(g), "\n ");
                                    Print(" H: ", StructureDescription(H),"  gens: ", GeneratorsOfGroup(H), "\n");
                                    Print(" |HKH|=", Size(HKH), "  HKH: ", HKH, "\n");
                                    Print(" K: ", StructureDescription(K),"  gens: ", GeneratorsOfGroup(K), "\n");
                                    Print(" |KHK|=", Size(KHK), "  KHK: ", KHK, "\n");
                                    Add(candidates, [i,j,m,n]);
                                fi;
                            fi;
                        fi;
                    fi;
                od;
            fi;
        od;
    od;
od;

Print("The candidates are: \n");
Print(candidates, "\n");

