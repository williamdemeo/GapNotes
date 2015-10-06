G := SmallGroup(960,11357);;
L := GraphicSubgroupLattice(G);
ms := MaximalSubgroups(G);
msA4 := [ms[1], ms[17], ms[48], ms[57], ms[65]];
for k in [1..5] do InsertVertex(L, msA4[k]); od;
H := Intersection(ms[1], ms[17]);
InsertVertex(L, H);
V := msA4[5];
vv := IntermediateSubgroups(V, H);
for k in [1..3] do InsertVertex(L, vv.subgroups[k]); od;
minNormal := MinimalNormalSubgroups(G);
InsertVertex(L, minNormal[1]);


