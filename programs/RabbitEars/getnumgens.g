getnumgens:=function(degree)
    local numgens;
    numgens:=List([1..NrTransitiveGroups(degree)], x->Size(GeneratorsOfGroup(TransitiveGroup(degree,x))));
    return numgens;
end;
