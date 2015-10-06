## Example: interval above HxK
G := Group([(1,2,3,4),(1,2)]);;  # S_4

H := Subgroup(G, [(1,2)]);       # a subgroup of index 12
K := Subgroup(G, [(1,2,3,4)]);   # a subgroup of index 6

omega:=Concatenation(RightCosets(G,H), RightCosets(G,K));;
Action(G, omega, OnRight);
# returns, alternately,
# Group([ (1,10,5,9)(2,12,4,8)(3,11,6,7)(14,17,16,15), (2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17) ]);
# Group([ (1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15), (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17) ]);

# Now, in Matlab, execute:
g0{1}='(1,10,5,9)(2,12,4,8)(3,11,6,7)(14,17,16,15)';
g0{2}='(2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17)';
GAPperms2uacalc(g0, 18, 'intransS40');
# This produces a file called intransS40.ua which can be read into uacalc,
# producing an algebra called intransS40 with two unary operations g1 and g2.

# Using the other return value of Action above we get the same lattice, with different labels.
g1{1}='(1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15)';
g1{2}='(2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17)';
GAPperms2uacalc(g1, 18, 'intransS41');
# (I can't explain the difference.)

# What happens when we use K^g instead of K? (answer: nothing changes)
ccsg:=ConjugacyClassesSubgroups(G);
List([1..Size(ccsg)], x->(K in Elements(ccsg[x])));
# returns [ false, false, false, false, false, false, true, false, false, false, false ]
# This tells us K is in the 7th subgroups cojugacy class, which has elements
Elements(ccsg[7]);
# [ Group([ (1,2)(3,4), (1,3,2,4) ]), Group([ (1,3)(2,4), (1,4,3,2) ]), Group([ (1,4)(2,3), (1,2,4,3) ]) ]
# Which one of these is equal to K = Group([(1,2,3,4)])?
List([1..3], x->(K=ccsg[7][x]));    # returns [ false, true, false ]
# So K = Group([ (1,3)(2,4), (1,4,3,2) ]).
K0:=ccsg[7][1];
x:=Concatenation(RightCosets(G,H), RightCosets(G,K0));;
Action(G, x, OnRight);
# returns 
# Group([ (1,11,4,8)(2,10,5,7)(3,12,6,9)(13,17,14,18), (2,3)(4,7)(5,9)(6,8)(11,12)(13,14)(15,18)(16,17) ])

# Now, in Matlab, execute:
g{1}='(1,11,4,8)(2,10,5,7)(3,12,6,9)(13,17,14,18)';
g{2}='(2,3)(4,7)(5,9)(6,8)(11,12)(13,14)(15,18)(16,17)';
GAPperms2uacalc(g, 18, 'intransS4HK0');

K2:=ccsg[7][3];
x:=Concatenation(RightCosets(G,H), RightCosets(G,K2));;
Action(G, x, OnRight);
# returns 
# Group([ (1,11,4,8)(2,10,5,7)(3,12,6,9)(13,18,15,16), (2,3)(4,7)(5,9)(6,8)(11,12)(13,17)(14,15)(16,18) ])

# Now, in Matlab, execute:
g{1}='(1,11,4,8)(2,10,5,7)(3,12,6,9)(13,18,15,16)';
g{2}='(2,3)(4,7)(5,9)(6,8)(11,12)(13,17)(14,15)(16,18)';
GAPperms2uacalc(g, 18, 'intransS4HK2');

# Combining maps from the K0 and K cases, gives an algebra with just a 
# DWP x 2 congruence lattice.
g{1}='(1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15)';
g{2}='(2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17)';
g{3}='(1,11,4,8)(2,10,5,7)(3,12,6,9)(13,17,14,18)';
g{4}='(2,3)(4,7)(5,9)(6,8)(11,12)(13,14)(15,18)(16,17)';
GAPperms2uacalc(g, 18, 'intransS4HKK0');

# The same result obtains when we add perms form all three cases:
g{1}='(1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15)';
g{2}='(2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17)';
g{3}='(1,11,4,8)(2,10,5,7)(3,12,6,9)(13,17,14,18)';
g{4}='(2,3)(4,7)(5,9)(6,8)(11,12)(13,14)(15,18)(16,17)';
g{5}='(1,11,4,8)(2,10,5,7)(3,12,6,9)(13,18,15,16)';
g{6}='(2,3)(4,7)(5,9)(6,8)(11,12)(13,17)(14,15)(16,18)';
GAPperms2uacalc(g, 18, 'intransS4HKKK');

# The last two combinations of maps was purely experimental.  
# The "right" way to combine is
x:=Concatenation(RightCosets(G,H), RightCosets(G,K0), RightCosets(G,K));;
Size(x);   # returns 24
Action(G, x, OnRight);
# returns 
# Group([ (1,11,4,8)(2,10,5,7)(3,12,6,9)(13,17,14,18)(20,23,22,21), 
#         (2,3)(4,7)(5,9)(6,8)(11,12)(13,14)(15,18)(16,17)(19,22)(20,24)(21,23) ])

g{1}='(1,11,4,8)(2,10,5,7)(3,12,6,9)(13,17,14,18)(20,23,22,21)';
g{2}='(2,3)(4,7)(5,9)(6,8)(11,12)(13,14)(15,18)(16,17)(19,22)(20,24)(21,23)';
GAPperms2uacalc(g, 24, 'intransS4HK0K');
  

# S4 subgroup lattice
l:=GraphicSubgroupLattice(G);
v:=InsertVertex(l,H);  
Relabel(l,v[1],"H");
v:=InsertVertex(l,K);  
Relabel(l,v[1],"K");

  
  
# Construct G1 x G2 and subgroup H x K
G1xG2 := DirectProduct(G, G);  # a group of order 576

emb1 := Embedding(G1xG2, 1);; 
emb2 := Embedding(G1xG2, 2);; 

G1 := List(GeneratorsOfGroup(G), i->Image(emb1,i)); 
G2 := List(GeneratorsOfGroup(G), i->Image(emb2,i)); 
h1 := List(GeneratorsOfGroup(H), i->Image(emb1,i)); 
k2 := List(GeneratorsOfGroup(K), i->Image(emb2,i)); 

HxK := Group(Concatenation(h1,k2),());;
HxG2 := Group(Concatenation(h1,G2),());;
G1xK := Group(Concatenation(G1,k2),());;

L:=GraphicSubgroupLattice(G1xG2);
v:=InsertVertex(L,HxK);  
Relabel(L,v[1],"HxK");

intsubs:=IntermediateSubgroups(G1xG2,HxK);
for j in [1..Size(intsubs.subgroups)] do
    v:=InsertVertex(L,intsubs.subgroups[j]);
    Relabel(L,v[1],String(j));
od;

v:=InsertVertex(L,HxG2); 
Relabel(L,v[1],"HxG2");
v:=InsertVertex(L,G1xK); 
Relabel(L,v[1],"G1xK");


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



