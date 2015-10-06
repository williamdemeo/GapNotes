# This is GAP code for searching for groups H, K
# that permute but do not normalize eachother.
# Author: William DeMeo
# Date: 20120517

N1:=6;
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
                        normH:=Normalizer(G,H);
                        normK:=Normalizer(G,K);
                        if IsSubgroup(normH,K) or IsSubgroup(normK,H) then
                            # do nothing
                        else
                            # finally we have candidates H, K
                            # check if these are permuting subgroups
                            dcHK:=DoubleCoset(H,One(G),K);
                            dcKH:=DoubleCoset(K,One(G),H);
                            if Elements(dcHK)=Elements(dcKH) then
                                Print("===============>  Candidate: SmallGroup(", i, ", ", j, "), H=cc[", m, "], K=cc[", n, "]    <=============== \n ");
                                Add(candidates, [i,j,m,n]);
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
