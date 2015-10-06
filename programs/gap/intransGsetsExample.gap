## Example: interval above HxK
G := Group([(1,2,3,4),(1,2)]);;  # S_4
H := Subgroup(G, [(1,2)]);       # a subgroup of index 12
K := Subgroup(G, [(1,2,3,4)]);   # a subgroup of index 6

# Construct G1 x G2 and subgroup H x K
G1xG2 := DirectProduct(G, G);  # a group of order 576

emb1 := Embedding(G1xG2, 1);; emb2 := Embedding(G1xG2, 2);; 
proj1 := Projection(G1xG2,1);;  proj2 := Projection(G1xG2,2);;

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

# Characterize subgroups of [HxK, G1xG2] that are in [H,G] x [K,G].
G1 := Group(G1,());;  G2 := Group(G2,());;
for j in [1..Size(intsubs.subgroups)] do
    S:=intsubs.subgroups[j]; 
    S1:=Intersection(S,G1xK); S2:=Intersection(S,HxG2);
    ScapG1:=Intersection(S,G1); ScapG2:=Intersection(S,G2);
    S1joinS2:= Group(Concatenation(GeneratorsOfGroup(S1),GeneratorsOfGroup(S2)));
    ScapG1joinScapG2:= Group(Concatenation(GeneratorsOfGroup(ScapG1),GeneratorsOfGroup(ScapG2)));
    
    p1S:=Image(proj1,S);  p2S:=Image(proj2,S);    
    # embed 2nd projection, so it corresponds to appropriate subgroup
    p2S:=Group(List(GeneratorsOfGroup(p2S), i->Image(emb2,i))); 
    
    Print("Subgroup ", j, " is S = ", S, " = ", StructureDescription(S),"\n");
    Print("           S1 = S cap G1xK = ", S1, " = ", StructureDescription(S1), "\n");
    Print("           S2 = S cap HxG2 = ", S2, " = ", StructureDescription(S2), "\n");
    Print("           S cap G1 = ", ScapG1, " = ", StructureDescription(ScapG1),"\n");
    Print("           S cap G2 = ", ScapG2, " = ", StructureDescription(ScapG2),"\n");
    Print("           S1 join S2 = ", S1joinS2, " = ", StructureDescription(S1joinS2), "\n");
    Print("           ScapG1 join ScapG2 = ", ScapG1joinScapG2, " = ", StructureDescription(ScapG1joinScapG2), "\n");
    
    if S<>S1joinS2 then
        Print(" >> Subgroup ", j, ", ", StructureDescription(S), 
              ", is not the join of S cap G1xK and S cap HxG2.\n");
        
    fi;
    if S<>ScapG1joinScapG2 then
        Print(" >> Subgroup ", j, ", ", StructureDescription(S), 
              ", is not the join of S intersect G1 and S intersect G2.\n");
    fi;
    if p1S<>ScapG1 then
        Print(" >> Subgroup ", j, ", ", StructureDescription(S), 
              ", does not have first projection equal S intersect G1.\n");
    fi;
    if p2S<>ScapG2 then
        Print(" >> Subgroup ", j, ", ", StructureDescription(S), 
              ", does not have second projection equal S intersect G2.\n");
    fi;
    if not IsSubgroup(S,p1S) then
        Print(" >> Subgroup ", j, ", ", StructureDescription(S), 
              ", does not have first projection as subgroup.\n");
    fi;
    if not IsSubgroup(S,p2S) then
        Print(" >> Subgroup ", j, ", ", StructureDescription(S), 
              ", does not have second projection as subgroup.\n");
    fi;
    Print("\n");
od;

# Example 7
S:=intsubs.subgroups[7];
S1:=Intersection(S,G1xK); S2:=Intersection(S,HxG2);
ScapG1:=Intersection(S,G1); ScapG2:=Intersection(S,G2);
S1joinS2:= Group(Concatenation(GeneratorsOfGroup(S1),GeneratorsOfGroup(S2)));
ScapG1joinScapG2:= Group(Concatenation(GeneratorsOfGroup(ScapG1),GeneratorsOfGroup(ScapG2)));
p1S:=Image(proj1,S);  p2S:=Image(proj2,S);    
p2S:=Group(List(GeneratorsOfGroup(p2S), i->Image(emb2,i))); 
p1Sjoinp2S:= Group(Concatenation(GeneratorsOfGroup(p1S),GeneratorsOfGroup(p2S)));

l:=GraphicSubgroupLattice(G1xG2);
v:=InsertVertex(l,HxK);  Relabel(l,v[1],"HxK");
v:=InsertVertex(l,S);  Relabel(l,v[1],"S");
v:=InsertVertex(l,G1); Relabel(l,v[1],"G1");
v:=InsertVertex(l,G2); Relabel(l,v[1],"G2");
v:=InsertVertex(l,HxG2); Relabel(l,v[1],"HxG2");
v:=InsertVertex(l,G1xK); Relabel(l,v[1],"G1xK");
v:=InsertVertex(l,ScapG1); Relabel(l,v[1],"ScapG1");
v:=InsertVertex(l,ScapG2); Relabel(l,v[1],"ScapG2");
v:=InsertVertex(l,p1S); Relabel(l,v[1],"p1S");
v:=InsertVertex(l,p2S); Relabel(l,v[1],"p2S");
v:=InsertVertex(l,p1Sjoinp2S); Relabel(l,v[1],"p1Vp2");
v:=InsertVertex(l,ScapG1joinScapG2); Relabel(l,v[1],"S1VS2");

# Example 3
S:=intsubs.subgroups[3];
S1:=Intersection(S,G1xK); S2:=Intersection(S,HxG2);
ScapG1:=Intersection(S,G1); ScapG2:=Intersection(S,G2);
S1joinS2:= Group(Concatenation(GeneratorsOfGroup(S1),GeneratorsOfGroup(S2)));
ScapG1joinScapG2:= Group(Concatenation(GeneratorsOfGroup(ScapG1),GeneratorsOfGroup(ScapG2)));
p1S:=Image(proj1,S);  p2S:=Image(proj2,S);    
p2S:=Group(List(GeneratorsOfGroup(p2S), i->Image(emb2,i))); 
p1Sjoinp2S:= Group(Concatenation(GeneratorsOfGroup(p1S),GeneratorsOfGroup(p2S)));

l:=GraphicSubgroupLattice(G1xG2);
v:=InsertVertex(l,HxK);  Relabel(l,v[1],"HxK");
v:=InsertVertex(l,S);  Relabel(l,v[1],"S");
v:=InsertVertex(l,G1); Relabel(l,v[1],"G1");
v:=InsertVertex(l,G2); Relabel(l,v[1],"G2");
v:=InsertVertex(l,HxG2); Relabel(l,v[1],"HxG2");
v:=InsertVertex(l,G1xK); Relabel(l,v[1],"G1xK");
v:=InsertVertex(l,ScapG1); Relabel(l,v[1],"ScapG1");
v:=InsertVertex(l,ScapG2); Relabel(l,v[1],"ScapG2");
v:=InsertVertex(l,p1S); Relabel(l,v[1],"p1S");
v:=InsertVertex(l,p2S); Relabel(l,v[1],"p2S");
v:=InsertVertex(l,p1Sjoinp2S); Relabel(l,v[1],"p1Vp2");
v:=InsertVertex(l,ScapG1joinScapG2); # this is HxK (don't relabel)

# Example: group action on right cosets.

omega:=Concatenation(RightCosets(G,H), RightCosets(G,K));;
Action(G, omega, OnRight);
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



