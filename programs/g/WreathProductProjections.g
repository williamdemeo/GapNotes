# Complements of the normal subgroup of a wreath product 
# group W = N wr S, and projections of the centralizers 
# in N of these complements.
#
# Author: williamdemeo@gmail.com
# Date: 2013.07.08

Print("\nConstructing wreath product group W of A5 with S3\n");
a5:=AlternatingGroup(5);  
s3:=SymmetricGroup(3);
W:=WreathProduct(a5,s3);

N:=Kernel(Projection(W));
Print("\nThe minimal normal subgroup N is ", StructureDescription(N), "\n");

K:=ComplementClassesRepresentatives(W,N);
Print("\nThe complements of N in W:\n");
for i in [1..Length(K)] do
    Print("    K", i, " is isomorphic to ", 
          StructureDescription(K[i]), 
          "   (so |K", i, "| = ", Order(K[i]), ")\n");
od;
    
Print("\nThe normalizers of the complements:\n");
for i in [1..Length(K)] do
    Print("    N_W(K", i,") is isomorphic to ", 
          StructureDescription(Normalizer(W,K[i])), " \n");
od;
Print("\nThe normalizers have orders\n");
for i in [1..Length(K)] do
    Print("    |N_W(K", i,")| = ", Order(Normalizer(W,K[i])), "\n");
od;

centralizers:=List([1..Length(K)], i->Centralizer(N,K[i]));

Print("\nThe centralizers in N of the complements:\n");
for i in [1..Length(centralizers)] do
    Print("    C_N(K", i,") is isomorphic to ", 
          StructureDescription(centralizers[i]), " \n");
od;

agens:=GeneratorsOfGroup(a5); # [ (1,2,3,4,5), (3,4,5) ]
egens:=List([1..3],i->List(agens,j->Image(Embedding(W,i),j)));
# [ [ (1,2,3,4,5), (3,4,5) ], [ (6,7,8,9,10), (8,9,10) ], [ (11,12,13,14,15), (13,14,15) ] ]

proj1:=GroupHomomorphismByImages(N,a5,
               Concatenation(egens),
               Concatenation(agens, List([1..2],i->One(a5)), List([1..2],i->One(a5)))
               );
proj2:=GroupHomomorphismByImages(N,a5,
               Concatenation(egens),
               Concatenation(List([1..2],i->One(a5)), agens, List([1..2],i->One(a5)))
               );
proj3:=GroupHomomorphismByImages(N,a5,
               Concatenation(egens),
               Concatenation(List([1..2],i->One(a5)), List([1..2],i->One(a5)), agens)
               );
projections = [proj1, proj2, proj3];

Print("\nThe projections of the centralizers in N onto components of N are:\n");
for i in [1..Length(centralizers)] do
    for j in [1..Length(projections)] do
        Print("    Proj_", j, "( C_N(K", i,") ) = ", 
              Image(projections[j],centralizers[i]), 
              " (isomorphic to ", 
              StructureDescription(Image(projections[j],centralizers[i])), 
              ")\n");
    od;
od;

