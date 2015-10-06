for n in [19..32] do Print(n, "\n"); for k in [1..NrPrimitiveGroups(n)] do Print(k, " ", StructureDescription(PrimitiveGroup(n,k)), "\n"); od; od;
