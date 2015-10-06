# Print out all non-cyclic simple groups of order n1 \leq |G| \leq n2.

IsSimpleTEST:=function(n1, n2)
    local i, j, G, numsmall, minn, asq;
    Print("Group ID    Group Description \n");
    for i in [n1..n2] do
        Print("Testing groups of order ", i, "\n");
        numsmall:=NumberSmallGroups(i);
        for j in [1..numsmall] do
            G:=SmallGroup(i,j);
            if IsSimple(G) and not IsCyclic(G) then
                Print("(",i,",",j,")   ",  StructureDescription(G), "\n");
            fi;
        od;
    od;
end;
    

