# The following two functions were suggested on the GAP forum
# by Bettina Eick <beick@tu-bs.de >, as a means of 
# collecting the minimal normal subgroups of a group.
AddToSubgroupList := function( nt, U )
local i, N;
    # check if U is minimal in nt
    for N in nt do if IsSubgroup(U, N) then return nt; fi; od;
    
    # check that nt remains minimal
    for i in [1..Length(nt)] do
        if IsSubgroup(nt[i], U) then nt[i] := false; fi;
    od;
    nt := Filtered( nt, x -> not IsBool(x) );

    # add U and return
    Add(nt, U); return nt;
end;

