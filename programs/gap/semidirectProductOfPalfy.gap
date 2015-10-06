# The following GAP commands show that the lattice PJ44 is a filter+ideal
# in the subgroup lattice of the group S3 x S3 : C2
#
G:=SmallGroup(72,40);  # this is the group S3 x S3 : C2
ccsg:=ConjugacyClassesSubgroups(G);;
# First we want to get ahold of the subgroup H = C2 x C2
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
K1:=intHG.subgroups[2];;
K2:=intHG.subgroups[3];;
IsSubgroup(S3xS3,K1);  # returns true
IsSubgroup(S3xS3,K2);  # returns true
# We now want to find a subgroup of S3xS3 that is not a subgroup of K1 nor K2
ccsg:=ConjugacyClassesSubgroups(S3xS3);;
List(ccsg, x->IsSubgroup(K1,Representative(x)));
# returns [ true, true, true, true, false, false, true, true, false, false, true, false, true, true, false, false, false, true, false, false, false, false ]
List(ccsg, x->IsSubgroup(K2,Representative(x)));
# returns [ true, true, true, true, false, true, false, true, true, true, false, true, false, false, false, false, true, false, false, false, false, false ]
# so let's try
A:=Representative(ccsg[5]);   # returns Group([ f5 ]) (it's one generated, so it's an atom)
StructureDescription(A);      # returns "C3"
IsSubgroup(S3xS3,A);   # returns true
IsSubgroup(K1,A);   # returns false
IsSubgroup(K2,A);   # returns false


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



# I couldn't get the following to work, so I used GAP's version of this semidirect product
# in the small groups library.

## 
S3:=SymmetricGroup(3);
C:=Group([(1,2)]);
IsSubgroups(S3,c2);

S3xS3:=DirectProduct(S3,S3);
emb1:=Embedding(S3xS3,1);; 
emb2:=Embedding(S3xS3,2);; 
S31:=List(GeneratorsOfGroup(S3), i->Image(emb1,i));
S32:=List(GeneratorsOfGroup(S3), i->Image(emb2,i));
c1:=Image(emb1,[(1,2)]);
c2:=Image(emb2,[(1,2)]);
C2xC2:=Group(Concatenation(c1,c2),());;

L:=GraphicSubgroupLattice(S3xS3);
v:=InsertVertex(L,C2xC2);  
Relabel(L,v[1],"C");

intsubs:=IntermediateSubgroups(S3xS3,C2xC2);
for j in [1..Size(intsubs.subgroups)] do
    v:=InsertVertex(L,intsubs.subgroups[j]);
    Relabel(L,v[1],String(j));
od;
ccsg:=ConjugacyClassesSubgroups(S3xS3);
List(ccsg, x->IsSubgroup(K1, Representative(x)));
# returns 
# [ true, true, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false ]
List(ccsg, x->IsSubgroup(K2, Representative(x)));
# returns
# [ true, false, true, false, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false ]
# From this we see that the fourth ccsg rep is not below K1 nor K2:
A:=Representative(ccsg[4]);  
# returns Group([ (2,3)(5,6) ]), which is cyclic order 2, so it's an atom not below K1 nor K2.

# To describe the action of C2 on S3xS3, we need the generators of C2:
C2:=Group([(1,2)]);
gens:=GeneratorsOfGroup(C2);
actions:=List(gens, i->ConjugatorAutomorphism(S3xS3,i));
alpha:=GroupHomomorphismByImages(C2, Group(actions), gens, actions);        

# Now we can form the semidirect product of C2 acting on S3xS3 via alpha:
G:=SemidirectProduct(C2,alpha,S3xS3);
embG1:=Embedding(G,1);
# returns [ (1,2) ] -> [ (7,31)(8,32)(9,33)(10,34)(11,35)(12,36)(19,25)(20,26)(21,27)(22,28)(23,29)(24,30) ]
embG2:=Embedding(G,2); 
# returns [ (1,2,3), (1,2), (4,5,6), (4,5) ] -> [ (1,19,25)(2,20,26)(3,21,27)(4,22,28)(5,23,29)(6,24,30)(7,13,31)(8,14,32)(9,15,33)(10,16,34)(11,17,35)(12,18,36), (1,13)(2,14)(3,15)(4,16)(5,17)(6,18)(7,19)(8,20)(9,21)(10,22)(11,23)(12,24)(25,31)(26,32)(27,33)(28,34)(29,35)(30,36), (1,4,5)(2,3,6)(7,10,11)(8,9,12)(13,16,17)(14,15,18)(19,22,23)(20,21,24)(25,28,29)(26,27,30)(31,34,35)(32,33,36), (1,3)(2,4)(5,6)(7,9)(8,10)(11,12)(13,15)(14,16)(17,18)(19,21)(20,22)(23,24)(25,27)(26,28)(29,30)(31,33)(32,34)(35,36) ]

s3s3:=List(GeneratorsOfGroup(S3xS3), i->Image(embG2,i));
S3xS3inG:=Group(s3s3, ());
c2xc2:=List(GeneratorsOfGroup(C2xC2), i->Image(embG2,i));
C2xC2inG:=Group(c2xc2, ());

c1:=Image(emb1,[(1,2)]);
c2:=Image(emb2,[(1,2)]);
C2xC2:=Group(Concatenation(c1,c2),());;





# Let's try to construct SDP of M with (1,2)
S2:=SymmetricGroup(2);
s2gens:=GeneratorsOfGroup(S2);
  
# Actions of S2 on M:
actions:=List(s2gens, i->ConjugatorAutomorphism(M,i));
alpha:=GroupHomomorphismByImages(S2, Group(actions), s2gens, actions);        

# Now we can form a corresponding semidirect product
G:=SemidirectProduct(S2,alpha,M);  # <<=== this produces out-of-memory error
embG1:=Embedding(G,1);
embG2:=Embedding(G,2); 
S31:=List(GeneratorsOfGroup(S3xS3), i->Image(emb1,i));
S32:=List(GeneratorsOfGroup(S3), i->Image(emb2,i));
c1:=Image(emb1,[(1,2)]);
c2:=Image(emb2,[(1,2)]);
C2xC2:=Group(Concatenation(c1,c2),());;






diag:=List(GeneratorsOfGroup(T), i->Image(emb1,i)*Image(emb2,i)*Image(emb3,i));
hatT:=Group(diag,());;
IsSubgroup(M,hatT);          # returns true

# The filter above hatT is:
fhatT := IntermediateSubgroups(M,hatT);;  
Size(fhatT.subgroups);   # returns 3
fhatT.subgroups[1];      # A5 x A5, and similarly for fhatT.subgroups[2] and 3

# We can view them inside the Hasse diagram of Sub[M] as follows:
L := GraphicSubgroupLattice(M);
InsertVertex(L, hatT);
InsertVertex(L, fhatT.subgroups[1]);
InsertVertex(L, fhatT.subgroups[2]);
InsertVertex(L, fhatT.subgroups[3]);

# The same could have been achieved more efficiently with:
for k in [1..Size(filterHcapK.subgroups)] do
    InsertVertex(L, filterHcapK.subgroups[k]); 
od;

# To describe the action of S3 on M, we need the generators of S3
s3gens:=GeneratorsOfGroup(S3);
  
# Actions of S3 on M:
actions:=List(s3gens, i->ConjugatorAutomorphism(M,i));
alpha:=GroupHomomorphismByImages(S3, Group(actions), s3gens, actions);        

# Now we can form a corresponding semidirect product
G:=SemidirectProduct(S3,alpha,M);



T:=AlternatingGroup(5);;
S4:=SymmetricGroup(4);
M:=DirectProduct(T,T,T,T);
# Construct hatT (the diagonal subgroup)
emb1:=Embedding(M,1);;
emb2:=Embedding(M,2);;
emb3:=Embedding(M,3);;
emb4:=Embedding(M,4);;
diag:=List(GeneratorsOfGroup(T), i->Image(emb1,i)*Image(emb2,i)*Image(emb3,i)*Image(emb4,i));
hatT:=Group(diag,());;
IsSubgroup(M,hatT);
# The filter above hatT is:
#fhatT := IntermediateSubgroups(M,hatT);;  # <<=== This takes too long.  
#Size(fhatT.subgroups);   # There should be 13



# Let's try to construct SDP of M with (1,2)
S2:=SymmetricGroup(2);
s2gens:=GeneratorsOfGroup(S2);
  
# Actions of S2 on M:
actions:=List(s2gens, i->ConjugatorAutomorphism(M,i));
alpha:=GroupHomomorphismByImages(S2, Group(actions), s2gens, actions);        

# Now we can form a corresponding semidirect product
G:=SemidirectProduct(S2,alpha,M);  # <<=== this produces out-of-memory error


# Instead, construct it within the wreath product.
T:=AlternatingGroup(5);;
S4:=SymmetricGroup(4);
G:=WreathProduct(T,S4,IndentityMapping(S4));
emb1:=Embedding(G,1);;
emb2:=Embedding(G,2);;
emb3:=Embedding(G,3);;
emb4:=Embedding(G,4);;
emb5:=Embedding(G,5);;


# The subgroup M = T^4
T1:=List(GeneratorsOfGroup(T), i->Image(emb1,i));
T2:=List(GeneratorsOfGroup(T), i->Image(emb2,i));
T3:=List(GeneratorsOfGroup(T), i->Image(emb3,i));
T4:=List(GeneratorsOfGroup(T), i->Image(emb4,i));
M:=Group(Concatenation(T1,T2,T3,T4),());
IsSubgroup(G,M);

# This is the diagonal subgroup {(x,x,x,x): x \in T}
diag:=List(GeneratorsOfGroup(T), i->Image(emb1,i)*Image(emb2,i)*Image(emb3,i)*Image(emb4,i));
hatT:=Group(diag,());;  
IsSubgroup(G,hatT);

# The action subgroup.
H:=List(GeneratorsOfGroup(S4), i->Image(emb5,i));
H:=Group(H,());; 
IsSubgroup(G,H);



L:=GraphicSubgroupLattice(G);
InsertVertex(L, hatT);
InsertVertex(L, H);
InsertVertex(L, M);
