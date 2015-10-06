a5:=AlternatingGroup(5);;
c2 := CyclicGroup(2);;
G := WreathProduct(a5, c2);   # returns: <group of size 7200 with 3 generators>
T1 := Image(Embedding(G,1));  # group of order 60 
T2 := Image(Embedding(G,2));

# T1 and T2 must be isomorphic to A5; this can be proved by: 
IsSimple(T1); IsSimple(T2);   # returns: true  true

# It could also be checked with:
IdGroup(T1); IdGroup(a5);     # both return: [ 60, 5 ]

H := Image(Embedding(G,3));   # (c2)

M := Group(Union(T1,T2));     # returns: <group with 119 generators>
Size(M);                      # returns: 3600  (can't id this group; it's too big)

Size(a5a5);                   # returns: 3600 (we should have M \cong a5a5)

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


