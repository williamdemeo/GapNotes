## -- First, a small example -- ##
z3:=CyclicGroup(3);
M:=DirectProduct(z3,z3,z3);
# Construct D (the diagonal subgroup)
emb1:=Embedding(M,1);; 
emb2:=Embedding(M,2);; 
emb3:=Embedding(M,3);;
diag:=List(GeneratorsOfGroup(z3), i->Image(emb1,i)*Image(emb2,i)*Image(emb3,i));
e := Group([Identity(M)]);
D:=Group(diag);;
IsSubgroup(M,D);          # returns true

# The filter above hatT is:
DtoM := IntermediateSubgroups(M,D);  
Size(DtoM.subgroups);   # returns 4
DtoM.subgroups[1];      # C3 x C3, and similarly for DtoM.subgroups[2,3,4]

# We can view them inside the Hasse diagram of Sub[M] as follows:
L := GraphicSubgroupLattice(M);
InsertVertex(L, D);
InsertVertex(L, DtoM.subgroups[1]);
InsertVertex(L, DtoM.subgroups[2]);
InsertVertex(L, DtoM.subgroups[3]);
InsertVertex(L, DtoM.subgroups[4]);

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
