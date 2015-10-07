G := Group([(2,3)(4,7)(5,9)(6,8), (1,3)(4,9)(5,8)(6,7), (1,4,7)(2,5,8)(3,6,9)]);
StructureDescription(G);   # returns "(C3 x C3) : C2"
G1 := Stabilizer(G, 1);    # returns Group([ (2,3)(4,7)(5,9)(6,8) ])
G2 := Stabilizer(G, 2);    # returns Group([ (2,3)(4,7)(5,9)(6,8) ])
G4 := Stabilizer(G, 4);    # returns Group([ (2,3)(4,7)(5,9)(6,8) ])
L := GraphicSubgroupLattice(G);
InsertVertex(L, G1);
filterG1 := IntermediateSubgroups(G,G1);;  
for k in [1..Size(filterG1.subgroups)] do
    InsertVertex(L, filterG1.subgroups[k]); 
od;

InsertVertex(L, G2);
filterG2 := IntermediateSubgroups(G,G2);;  
for k in [1..Size(filterG2.subgroups)] do
    InsertVertex(L, filterG2.subgroups[k]); 
od;

InsertVertex(L, G4);
filterG4 := IntermediateSubgroups(G,G4);;  
for k in [1..Size(filterG4.subgroups)] do
    InsertVertex(L, filterG4.subgroups[k]); 
od;

Elements(filterG1.subgroups[1]); 
Elements(filterG2.subgroups[1]); 
Elements(filterG4.subgroups[1]); 



