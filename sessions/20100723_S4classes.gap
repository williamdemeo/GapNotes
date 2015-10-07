# Define s4 = S_4.
gap> s4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )

# Draw Sub[S_4].
gap> GraphicSubgroupLattice(s4);
<graphic subgroup lattice "GraphicSubgroupLattice">

# Compute conjugacy classes of S_4.
gap> ccls := ConjugacyClasses(s4);
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> ccls[1];
()^G
gap> ccls[2];
(1,2)^G
gap> Elements(ccls[2]);
[ (3,4), (2,3), (2,4), (1,2), (1,3), (1,4) ]
gap> Elements(ccls[3]);
[ (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]
gap> Elements(ccls[4]);
[ (2,3,4), (2,4,3), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,4,2), (1,4,3) ]
gap> Elements(ccls[5]);
[ (1,2,3,4), (1,2,4,3), (1,3,4,2), (1,3,2,4), (1,4,3,2), (1,4,2,3) ]

# Compute conjugacy classes of subgroups of S_4.
gap> cclss := ConjugacyClassesSubgroups(s4);
[ Group( () )^G, Group( [ (1,3)(2,4) ] )^G, Group( [ (3,4) ] )^G, Group( [ (2,4,3) ] )^G,
  Group( [ (1,4)(2,3), (1,3)(2,4) ] )^G, Group( [ (1,2)(3,4), (3,4) ] )^G, 
  Group( [ (1,2)(3,4), (1,3,2,4) ] )^G, Group( [ (3,4), (2,4,3) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (1,2) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (2,4,3) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (2,4,3), (1,2) ] )^G ]

# Look at a few of these classes.
gap> cclss[5];
Group( [ (1,4)(2,3), (1,3)(2,4) ] )^G
gap> Order(Representative(cclss[5]));
4
gap> Order(Representative(cclss[6]));
4
gap> Order(Representative(cclss[7]));
4
gap> Order(Representative(cclss[9]));
8
gap> Order(Representative(cclss[10]));
12
# ...so Representative(cclss[10]) must be A_4. 

# Let's check it...
gap> Representative(cclss[10]);
Group([ (1,3)(2,4), (1,4)(2,3), (2,4,3) ])
gap> a4:=Representative(cclss[10]);
Group([ (1,3)(2,4), (1,4)(2,3), (2,4,3) ])
gap> IsAlternatingGroup(a4);
true

gap> Order(Representative(cclss[11]));
24
# ...Representative(cclss[11]) is S_4.

