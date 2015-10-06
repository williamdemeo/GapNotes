# The following is output of findHexagon(1,100):
#
# |Hex|  [G:H]  max[G:H]  NotSolv  TotNotSolv   GAPid       atom indices           [H, G]   
# 0  12  12  0  0     (24, 12)    [ 2, 5 ]         [ C2 , S4 ]

# Let's be sure it's really a hexagon using XGAP:

G := SmallGroup(24,12);
ms := MaximalSubgroups(G);
K1 := ms[2];
K2 := ms[5];
H:=Intersection(K1,K2);
L := GraphicSubgroupLattice(G); 
InsertVertex(L, H); 
filterH := IntermediateSubgroups(G,H);;  

for k in [1..Size(filterH.subgroups)] do InsertVertex(L, filterH.subgroups[k]); od;


