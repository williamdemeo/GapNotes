# The following GAP commands show that the lattice PJ44 is a filter+ideal
# in the subgroup lattice of the group S3 x S3 : C2
#
# <williamdemeo@gmail.com> 2011.05.08

G:=SmallGroup(72,40);  # this is the group S3 x S3 : C2

# First we want to get ahold of the subgroup H = C2 x C2
ccsg:=ConjugacyClassesSubgroups(G);;
List(ccsg, x->Order(Representative(x)));
# returns [ 1, 2, 2, 2, 3, 3, 4, 4, 4, 6, 6, 6, 6, 6, 6, 8, 9, 12, 12, 18, 18, 18, 36, 36, 36, 72 ]
H:=Representative(ccsg[8]);;
StructureDescription(H);  # returns "C2 x C2"   (lucky guess)

intHG:=IntermediateSubgroups(G,H);
# returns 
# rec( subgroups := [ Group([ f1, f2, f3 ]), Group([ f2, f3, f4*f5 ]), Group([ f2, f3, f4^2*f5 ]), Group([ f2, f3, f4, f5 ]) ], 
#   inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 5 ], [ 2, 4 ], [ 3, 4 ], [ 4, 5 ] ] )

S3xS3:=intHG.subgroups[4];
StructureDescription(s3s3);  # returns "S3 x S3", as expected
K1:=intHG.subgroups[2];; K2:=intHG.subgroups[3];;
IsSubgroup(S3xS3,K1);  # returns true
IsSubgroup(S3xS3,K2);  # returns true

# We now want to find a subgroup of S3xS3 that is not a subgroup of K1 nor K2
ccsg:=ConjugacyClassesSubgroups(S3xS3);;
List(ccsg, x->IsSubgroup(K1,Representative(x)));
# returns [ true, true, true, true, false, false, true, true, false, false, true, false, true, true, false, false, false, true, false, false, false, false ]
List(ccsg, x->IsSubgroup(K2,Representative(x)));
# returns [ true, true, true, true, false, true, false, true, true, true, false, true, false, false, false, false, true, false, false, false, false, false ]

# So we try
A:=Representative(ccsg[5]);   # returns Group([ f5 ]) (it's one generated, so it's an atom)
StructureDescription(A);      # returns "C3"
IsSubgroup(S3xS3,A);          # returns true
IsSubgroup(K1,A);             # returns false
IsSubgroup(K2,A);             # returns false

# Now we draw PJ44 using XGAP
L:=GraphicSubgroupLattice(G);
v:=InsertVertex(L,H);  
Relabel(L,v[1],"H");
intHG:=IntermediateSubgroups(G,H);
for j in [1..Size(intHG.subgroups)] do
    v:=InsertVertex(L,intHG.subgroups[j]);
    Relabel(L,v[1],String(j));
od;
v:=InsertVertex(L,A);  
Relabel(L,v[1],"A");
