ArePermuting:=function(H,K)
    # returns true if HK=KH
    # returns false otherwise
    local dcHK,g;
    dcHK:=DoubleCoset(H,One(H),K);
    g:=Group(Concatenation(GeneratorsOfGroup(H),GeneratorsOfGroup(K)));
    if Size(dcHK)=Order(g) then
        return true;
    else
        return false;
    fi;
end;

Normalizes:=function(H,K)
    # returns true if H normalizes K
    # returns false otherwise
    local g,N;
    g:=Group(Concatenation(GeneratorsOfGroup(H),GeneratorsOfGroup(K)));
    N:=Normalizer(g,K);
    return IsSubgroup(N,H);
end;

    
