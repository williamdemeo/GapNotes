# Test the IsSubdirectlyIrreducible.g program.
# NB you must first issue the command
#    gap> Read("IsSubdirectlyIrreducible.g");
# before using this file.
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

PrintSubdirectlyIrreducibles:=function(n1, n2)
    local i, j, G, numsmall, minn, asq;
    Print("GrpID   |A|    |A|^2   |G:A|    Group Description    IsSimple\n");
    for i in [n1..n2] do
        numsmall:=NumberSmallGroups(i);
        for j in [1..numsmall] do
            G:=SmallGroup(i,j);
            if IsSolvable(G) then
                # do nothing
            else
                if IsSubdirectlyIrreducible(G) then
                    minn:=MinimalAbelianIndex(G);
                    asq:=(i/minn)^2;
                    if i < asq then
                        #do nothing
                    else
                        Print("(",i,",",j,")   ", i/minn, "    ", asq, "    ", minn, "    ", StructureDescription(G), "    ", IsSimple(G), "\n");
                    fi;
                fi;
            fi;
        od;
    od;
end;
    

