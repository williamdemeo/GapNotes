## -- First, a small example -- ##
T:=AlternatingGroup(5);;
M:=DirectProduct(T,T);
# Construct hatT (the diagonal subgroup)
emb1:=Embedding(M,1);; 
emb2:=Embedding(M,2);; 
diag:=List(GeneratorsOfGroup(T), i->Image(emb1,i)*Image(emb2,i));
hatT:=Group(diag,());;
IsSubgroup(M,hatT);          # returns true
