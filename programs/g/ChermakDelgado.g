# Given a group G, when can we expect to find an
# abelian subgroup A of relatively small index?
#
# This program takes a finite group G as input and computes 
# the smallest n such that there is an abelian subgroup A in G
# with [G : A] = n.
MinimalAbelianIndex:=function(G)
    local A, ccsg, cc, n, minn;
    minn:=Order(G);
    ccsg:=ConjugacyClassesSubgroups(G);
    for cc in ccsg do
        A:=Representative(cc);
        if IsAbelian(A) then
            if IsNormal(G,A) then
                # do nothing
            else
                n:=Index(G,A);
                if n < minn then
                    minn:=n;
                fi;
            fi;
        fi;
    od;
    return minn;
end;

PrintMinimalAbelianIndex:=function(n1, n2)
    local i, j, G, numsmall, minn, asq;
    Print("|G|   |A|    |A|^2   |G:A|    Group Description\n");
    for i in [n1..n2] do
        numsmall:=NumberSmallGroups(i);
        for j in [1..numsmall] do
            G:=SmallGroup(i,j);
            if IsSolvable(G) then
                # do nothing
            else
                minn:=MinimalAbelianIndex(G);
                asq:=(i/minn)^2;
#                if i < asq then
                    # do nothing
#                else
                    Print(i, "   ", i/minn, "    ", asq, "    ", minn, "    ", StructureDescription(G), "\n");
#                fi;
            fi;
        od;
    od;
end;
    

