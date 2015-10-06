
S3:=SymmetricGroup(3);
G:=DirectProduct(S3,S3,S3);

# Construct U (the diagonal subgroup)
emb1:=Embedding(G,1);; emb2:=Embedding(G,2);; emb3:=Embedding(G,3);;
diag:=List(GeneratorsOfGroup(S3), i->Image(emb1,i)*Image(emb2,i)*Image(emb3,i));
U:=Group(diag,());;
IsSubgroup(G,U);          # returns true
H:=Group(Concatenation(diag, [(1,2,3)]),());
K:=Group(Concatenation(diag, [(4,5,6)]),());
IsSubgroup(G,H);          # returns true
IsSubgroup(G,K);          # returns true

StructureDescription(H);               # (C3 x C3) : C2
StructureDescription(Normalizer(G,H)); # S3 x S3
                                       # (H is not self-normalizing)

StructureDescription(K);               # (C3 x C3) : C2
StructureDescription(Normalizer(G,K)); # S3 x S3
                                       # (K is not self-normalizing)

HcapK := Intersection(H,K);; 
StructureDescription(HcapK);              # S3
StructureDescription(Normalizer(G,HcapK));# S3
                                          # (HcapK is self-normalizing)
# The filter above HcapK is:
filterHcapK := IntermediateSubgroups(G,HcapK);;  
for k in [1..Size(filterHcapK.subgroups)] do
    StructureDescription(filterHcapK.subgroups[k]); 
od;

# There are 11:
# filterHcapK.subgroups := [ 
#  (C3 x C3) : C2,   (C3 x C3) : C2,   (C3 x C3) : C2,   (C3 x C3) : C2, 
#   S3 x S3,   S3 x S3,   S3 x S3, 
#  (C3 x C3 x C3) : C2,  S3 x ((C3 x C3) : C2),   
#  ((C3 x C3) : C2) x S3,   ((C3 x C3) : C2) x S3 ]
#
# filterHcapK.inclusions := [ 
#  [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], 
#  [ 1, 5 ], [ 1, 8 ], [ 2, 6 ], [ 2, 8 ], [ 3, 7 ], [ 3, 8 ], 
#  [ 4, 8 ], [ 5, 9 ], [ 6, 10 ], [ 7, 11 ], 
#  [ 8, 9 ], [ 8, 10 ], [ 8, 11 ], [ 9, 12 ], [ 10, 12 ], [ 11, 12 ] ] )

H= filterHcapK.subgroups[3];  # true
K= filterHcapK.subgroups[2];  # true

# Using XGAP, we can view this interval in the Hasse diagram of Sub[G] as follows:
L := GraphicSubgroupLattice(G);
InsertVertex(L, HcapK);
InsertVertex(L, H);
InsertVertex(L, K);
InsertVertex(L, filterHcapK.subgroups[1]); 
InsertVertex(L, filterHcapK.subgroups[4]); 
# To keep track of the vertices as they get added, insert them in subsets
for k in [1..4] do
    InsertVertex(L, filterHcapK.subgroups[k]); 
od;
for k in [5..7] do
    InsertVertex(L, filterHcapK.subgroups[k]); 
od;

InsertVertex(L, filterHcapK.subgroups[8]); 

