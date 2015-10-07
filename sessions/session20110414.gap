## Example: interval above HxK
G := Group([(1,2,3,4),(1,2)]);;  # S_4
H := Subgroup(G, [(1,2)]);       # a subgroup of index 12

L:=GraphicSubgroupLattice(G);
v:=InsertVertex(L,H);  
Relabel(L,v[1],"H");

intHG:=IntermediateSubgroups(G,H);

for j in [1..Size(intHG.subgroups)] do
    v:=InsertVertex(L,intHG.subgroups[j]);
    Relabel(L,v[1],String(j));
od;

omega:=RightCosets(G,H);
act:=Action(G, omega, OnRight);
actgen:=GeneratorsOfGroup(act);
s12:=SymmetricGroup(12);
for f in s12 do
    if f in act then
        # do nothing 
    else
        Gf:=Group(Concatenation(actgen,[f]));
        blks:=AllBlocks(Gf);
        if Size(blks)>1 then
           Print("f = ", f, " blocks: ", blks, "\n");
       fi;
   fi;
od;

        



# returns, alternately,
# Group([ (1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15), (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17) ])
g{1} = '(1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15)';
g{2} = '(2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17)';
GAPperms2uacalc(g, 18, 'intransS4HK');
# This produces a file called intransS4HK.ua which can be read into uacalc,
# producing an algebra called intransS4HK with two unary operations g1 and g2.




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



