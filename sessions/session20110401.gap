## Example: interval above HxK
G := Group([(1,2,3,4),(1,2)]);;  # S_4
H1 := Subgroup(G, [(1,2)]);       # a subgroup of index 12
H2 := Subgroup(G, [(2,4)]);       # a subgroup conjugate to H1
K1 := Subgroup(G, [(1,2,3,4)]);   # a subgroup of index 6
K2 := Subgroup(G, [ (1,2)(3,4), (1,3,2,4) ]);

# Example: group action on right cosets.

GHGH:=Concatenation(RightCosets(G,H1), RightCosets(G,H2));;
GKGK:= Concatenation(RightCosets(G,K1), RightCosets(G,K2));;
Action(G, GHGH, OnRight);

# Group([ (1,11,4,8)(2,10,5,7)(3,12,6,9)(13,22,16,19)(14,24,17,21)(15,23,18,20), 
#   (2,3)(4,7)(5,9)(6,8)(11,12)(13,23)(14,22)(15,24)(16,17)(19,20) ])
g{1} = '(1,11,4,8)(2,10,5,7)(3,12,6,9)(13,22,16,19)(14,24,17,21)(15,23,18,20)';
g{2} = '(2,3)(4,7)(5,9)(6,8)(11,12)(13,23)(14,22)(15,24)(16,17)(19,20)';
GAPperms2uacalc(g, 24, 'intransS4HH');

act:=Action(G, GKGK, OnRight);

g{1} = '(2,5,4,3)(7,11,8,12)';
g{2} = '(1,4)(2,6)(3,5)(7,8)(9,12)(10,11)';
GAPperms2uacalc(g, 12, 'intransS4KK');

List(GKGK, x->Stabilizer(act,x));


# To describe the action of S2 on G1xG2, we need the generators of S2
s2:=SymmetricGroup(2);;
s2gens:=GeneratorsOfGroup(s2);;
# Actions of S2 on G1xG2:
actions:=List(s2gens, i->ConjugatorAutomorphism(G1xG2,i));
alpha:=GroupHomomorphismByImages(S3, Group(actions), s3gens, actions);        

# Now we can form a corresponding semidirect product
G:=SemidirectProduct(S3,alpha,M);


# Let's try to construct SDP of M with (1,2)
S2:=SymmetricGroup(2);
s2gens:=GeneratorsOfGroup(S2);
  
# Actions of S2 on M:
actions:=List(s2gens, i->ConjugatorAutomorphism(M,i));
alpha:=GroupHomomorphismByImages(S2, Group(actions), s2gens, actions);        

# Now we can form a corresponding semidirect product
G:=SemidirectProduct(S2,alpha,M);  # <<=== this produces out-of-memory error



