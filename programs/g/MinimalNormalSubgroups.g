MinimalNormalSubgroups := function(G)
    local cl, nt, c, U;
    cl := ConjugacyClasses(G);
    nt := [];
    for c in cl do
        if IsPrime(Order(Representative(c))) then
            U  := Subgroup( G, [Representative(c)] );
            U  := NormalClosure( G, U );
            nt := AddToSubgroupList( nt, U );
        fi;
    od;
    return nt;
end;

