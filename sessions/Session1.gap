gap> Gps16 := AllGroups(Size,16); # all (classes) of groups of order 16
[ <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators>, 
  <pc group of size 16 with 4 generators> ]
gap> G := Gps16[3];  # the third of these (classes of) groups
<pc group of size 16 with 4 generators>
gap> L := List(G, x -> Order(x));  # the order of each element in G
[ 1, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4 ]
gap> Collected(L);  # the frequency with which each order occurs
[ [ 1, 1 ], [ 2, 7 ], [ 4, 8 ] ]
gap> S := Elements(G);
[ <identity> of ..., f1, f2, f3, f4, f1*f2, f1*f3, f1*f4, f2*f3, f2*f4, f3*f4, 
  f1*f2*f3, f1*f2*f4, f1*f3*f4, f2*f3*f4, f1*f2*f3*f4 ]
gap> List([1..16], n -> S[2]^n);
[ f1, f4, f1*f4, <identity> of ..., f1, f4, f1*f4, <identity> of ..., f1, f4, 
  f1*f4, <identity> of ..., f1, f4, f1*f4, <identity> of ... ]
gap> Collected(last); 
[ [ <identity> of ..., 4 ], [ f1, 4 ], [ f4, 4 ], [ f1*f4, 4 ] ]
gap> # from the last computation it's clear the order of f1 is 4
gap> Subgps := Union(ConjugacyClassesSubgroups(G));
[ Group([  ]), Group([ f2 ]), Group([ f3 ]), Group([ f2, f3 ]), 
  Group([ f2*f4, f3 ]), Group([ f4 ]), Group([ f1, f4 ]), Group([ f2, f4 ]), 
  Group([ f3, f4 ]), Group([ f3, f4, f1 ]), Group([ f3, f4, f2 ]), 
  Group([ f3, f4, f1, f2 ]), Group([ f3, f4, f1*f2 ]), Group([ f1*f3, f4 ]), 
  Group([ f2*f3, f4 ]), Group([ f2*f3 ]), Group([ f2*f4 ]), Group([ f3*f4 ]), 
  Group([ f2, f3*f4 ]), Group([ f1*f2, f3*f4 ]), Group([ f2*f3, f3*f4 ]), 
  Group([ f1*f2*f3, f3*f4 ]), Group([ f2*f3*f4 ]) ]
gap> List(Subgps, H -> Elements(H));
[ [ <identity> of ... ], [ <identity> of ..., f2 ], [ <identity> of ..., f3 ], 
  [ <identity> of ..., f2, f3, f2*f3 ], 
  [ <identity> of ..., f3, f2*f4, f2*f3*f4 ], [ <identity> of ..., f4 ], 
  [ <identity> of ..., f1, f4, f1*f4 ], [ <identity> of ..., f2, f4, f2*f4 ], 
  [ <identity> of ..., f3, f4, f3*f4 ], 
  [ <identity> of ..., f1, f3, f4, f1*f3, f1*f4, f3*f4, f1*f3*f4 ], 
  [ <identity> of ..., f2, f3, f4, f2*f3, f2*f4, f3*f4, f2*f3*f4 ], 
  [ <identity> of ..., f1, f2, f3, f4, f1*f2, f1*f3, f1*f4, f2*f3, f2*f4, 
      f3*f4, f1*f2*f3, f1*f2*f4, f1*f3*f4, f2*f3*f4, f1*f2*f3*f4 ], 
  [ <identity> of ..., f3, f4, f1*f2, f3*f4, f1*f2*f3, f1*f2*f4, f1*f2*f3*f4 ], 
  [ <identity> of ..., f4, f1*f3, f1*f3*f4 ], 
  [ <identity> of ..., f4, f2*f3, f2*f3*f4 ], [ <identity> of ..., f2*f3 ], 
  [ <identity> of ..., f2*f4 ], [ <identity> of ..., f3*f4 ], 
  [ <identity> of ..., f2, f3*f4, f2*f3*f4 ], 
  [ <identity> of ..., f1*f2, f3*f4, f1*f2*f3*f4 ], 
  [ <identity> of ..., f2*f3, f2*f4, f3*f4 ], 
  [ <identity> of ..., f3*f4, f1*f2*f3, f1*f2*f4 ], 
  [ <identity> of ..., f2*f3*f4 ] ]
gap> List(Subgps, H -> Size(H));
[ 1, 2, 2, 4, 4, 2, 4, 4, 4, 8, 8, 16, 8, 4, 4, 2, 2, 2, 4, 4, 4, 4, 2 ]
gap> Collected(last);
[ [ 1, 1 ], [ 2, 7 ], [ 4, 11 ], [ 8, 3 ], [ 16, 1 ] ]
gap> LogTo();
