GsetCongruences:=function(act)
    local k, orb, zero, blks, Con;
    blks:=AllBlocks(act);
    Con:=[MovedPoints(act)];
    for k in [1..Size(blks)] do
        Add(Con, Orbit(act,blks[k],OnSets));
    od;
    zero:=[];
    for k in MovedPoints(act) do
        Add(zero, [k]);
    od;
    Add(Con, zero);
    return Con;
end;

