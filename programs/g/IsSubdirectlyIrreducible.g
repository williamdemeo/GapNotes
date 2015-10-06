# Checks whether the finite group G has
# a unique minimal normal subgroup N > 1.
#
# Note: a simple group G is, of course, subdirectly irreducible.
#       (The unique minimal normal subgroup is G itself.)
#
IsSubdirectlyIrreducible:=function(G)
    local minnsg;
    minnsg:=MinimalNormalSubgroups(G);
    if Length(minnsg)=1 then
        return true;
    else
        return false;
    fi;
end;
    

