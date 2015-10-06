DisplayCCReps:=function(G)
    local cc, N, k, K;
    cc:=ConjugacyClassesSubgroups(G);;
    for k in [1..Size(cc)] do 
        K:=Representative(cc[k]); 
        Print(k, "  ", Index(G,K), "  ", StructureDescription(K), "\n"); 
    od;
end;

