# Let's find the smallest groups of each ONanScottType and analyze them.
# This should help us understand what types of groups occur in these 
# and thus help us better understand the classification theorem.
#
# Recall, in GAP, the O'Nan-Scott types are
# 1 Affine.
# 2 Almost simple.
# 3a Diagonal, Socle consists of two normal subgroups.
# 3b Diagonal, Socle is minimal normal.
# 4a Product action with the first factor primitive of type 3a.
# 4b Product action with the first factor primitive of type 3b.
# 4c Product action with the first factor primitive of type 2.
# 5 Twisted wreath product.

# Note, that for groups of degree up to 2499, O'Nan-Scott types 4a, 4b and 5 cannot occur.
# So we start by looking for type 2, 3a, 3b, and 4c.
for i in [1..2499] do
    numprim:=NrPrimitiveGroups(i);
    for j in [1..numprim] do
        OSTYPE:="NA";
        G:=PrimitiveGroup(i,j);
        OSTYPE:=ONanScottType(G);
        if OSTYPE="4b" or OSTYPE="5" then
            #Print("\n (", i, ",", j, ") & ", StructureDescription(G), " & ", Order(G), " \\\\");
                        Print("\n (", i, ",", j, ") & ", Order(G), " \\\\");
        fi;
    od;
od;


