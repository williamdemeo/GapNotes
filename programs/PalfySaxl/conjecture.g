test_conjecture:=function(N1,N2)
    # Author: William DeMeo <williamdemeo@gmail.com>
    # Last update: 2013.05.29
    # 
    
    local i, j, k, conjK, conjH, ccsg, nccsg, h, m,n,r, s, t, G, H,K,HKH, HcapK,tuple, output, numsg;
    output:=[];
    for i in [N1..N2] do
        numsg:=NumberSmallGroups(i);
        Print("Checking the ", numsg, " group(s) of order |G| = ", i, "...\n");
        for j in [1..numsg] do
            G := SmallGroup(i,j);
            ccsg:=ConjugacyClassesSubgroups(G);
            nccsg:=Length(ccsg);
            for m in [2..nccsg-2] do
                h:=Representative(ccsg[m]);
                conjH:=ConjugateSubgroups(G,h);
                for r in [1..Length(conjH)] do
                    H := conjH[r];
                    for n in [m+1..nccsg-1] do 
                        k:=Representative(ccsg[n]);
                        conjK:=ConjugateSubgroups(G,k);
                        for s in [1..Length(conjK)] do
                            K:=conjK[s];
                            if IsSubgroup(K,H) or IsSubgroup(H,K) then #or IsNormal(G,K) then
                            # do nothing
                            else 
                                HKH:=Compose(H,K,3);
                                # KHK:=Compose(K,H,3);
                                HcapK:=Intersection(H,K);
                                if Order(H)*Order(K)*Order(H) <> Order(HcapK)*Order(HcapK)*Size(HKH) then
                                    tuple:=[i,j,m,r,n,s];
                                    Print("Counterexample: ", tuple, "\n");
                                    Print("|HKH|: ", Size(HKH), "  |H|: ", Order(H), "  |K|: ", Order(K), "  |HcapK|: ", Order(HcapK),"\n");
                                Add(output, tuple);
                                fi;
                            fi;
                        od;
                    od;
                od;
            od;
        od;
    od;
    Print(output, "\n");
end;;

