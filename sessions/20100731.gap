gap> G := SmallGroup(960,11357);
Group([ (1,4,2)(3,10,6)(5,13,9)(8,14,12)(11,16,15), (1,12,7,3)(2,8,4,5)(6,10,13,11)(9,16,15,14) ])
gap> ms := MaximalSubgroups(G);
[ Group([ (1,2,12)(3,13,16)(4,11,6)(5,8,9)(7,14,10), (2,3)(4,6)(5,12)(7,11)(8,13)(15,16) ]), 
  Group([ (1,2,12)(3,5,10)(4,14,8)(6,9,13)(7,11,16), (2,4)(3,10)(5,9)(8,15)(11,12)(14,16) ]), 
  Group([ (1,2,12)(3,11,8)(4,13,10)(5,6,7)(9,14,16), (2,7)(3,14)(5,10)(6,15)(9,16)(12,13) ]), 
  Group([ (1,2,12)(3,14,6)(4,5,16)(7,13,8)(9,11,10), (2,9)(4,13)(6,11)(7,8)(10,15)(12,14) ]), 
  Group([ (1,3,5)(2,12,10)(4,9,8)(6,14,13)(7,15,11), (2,10)(3,6)(5,7)(9,12)(13,16)(14,15) ]), 
  Group([ (1,3,5)(2,14,4)(6,12,15)(7,10,9)(8,13,11), (3,9)(4,7)(5,14)(6,8)(10,16)(11,13) ]), 
  Group([ (1,3,5)(2,7,13)(4,11,12)(6,8,10)(9,14,15), (2,14)(3,11)(4,16)(5,8)(9,15)(10,12) ]), 
  Group([ (1,4,11)(2,13,3)(5,16,14)(6,7,9)(10,12,15), (3,9)(4,7)(5,14)(6,8)(10,16)(11,13) ]), 
  Group([ (1,4,11)(2,12,6)(3,7,16)(5,9,15)(10,13,14), (2,6)(4,10)(7,12)(8,14)(9,11)(13,15) ]), 
  Group([ (1,6,7)(2,11,15)(3,5,4)(8,14,10)(9,16,12), (3,4)(5,11)(6,10)(7,9)(8,16)(13,14) ]), 
  Group([ (1,15,6)(2,3,13)(4,9,16)(5,10,11)(7,12,14), (1,6)(3,10)(5,8)(7,13)(9,15)(11,12) ]), 
  Group([ (1,7,5)(2,3,13)(4,14,15)(6,10,16)(9,11,12), (1,11)(3,14)(4,8)(6,15)(9,12)(13,16) ]), 
  Group([ (1,15,10)(2,4,14)(3,7,8)(5,11,6)(9,12,13), (1,10)(4,6)(5,12)(7,15)(9,14)(11,16) ]), 
  Group([ (1,3,12)(2,5,10)(4,14,13)(6,9,8)(11,15,16), (1,13)(3,12)(5,9)(6,7)(8,15)(10,11) ]), 
  Group([ (1,10,11)(2,16,13)(3,4,9)(5,15,6)(8,14,12), (1,10)(4,6)(5,12)(7,15)(9,14)(11,16) ]), 
  Group([ (1,8,5)(2,6,14)(3,4,9)(10,13,12)(11,15,16), (2,6)(4,10)(7,12)(8,14)(9,11)(13,15) ]), 
  Group([ (1,2,10)(3,6,4)(5,9,15)(7,14,12)(11,13,16), (2,3)(4,6)(5,12)(7,11)(8,13)(15,16) ]), 
  Group([ (1,2,8)(3,11,12)(4,15,13)(5,6,14)(7,16,9), (2,7)(3,14)(5,10)(6,15)(9,16)(12,13) ]), 
  Group([ (1,3,15)(2,16,14)(5,6,12)(7,10,8)(9,13,11), (3,9)(4,7)(5,14)(6,8)(10,16)(11,13) ]), 
  Group([ (1,4,14)(2,9,11)(3,13,12)(5,15,7)(8,16,10), (2,13)(3,8)(4,5)(6,12)(7,15)(11,16) ]), 
  Group([ (1,5,8)(2,14,6)(3,9,4)(10,12,13)(11,16,15), (2,7)(3,14)(5,10)(6,15)(9,16)(12,13) ]), 
  Group([ (1,6,16)(3,13,8)(4,15,9)(5,7,10)(11,14,12), (2,9)(4,13)(6,11)(7,8)(10,15)(12,14) ]), 
  Group([ (1,8,11)(2,3,12)(5,14,9)(6,16,7)(10,15,13), (3,9)(4,7)(5,14)(6,8)(10,16)(11,13) ]), 
  Group([ (1,16,5)(2,4,12)(6,15,14)(7,11,13)(8,9,10), (3,9)(4,7)(5,14)(6,8)(10,16)(11,13) ]), 
  Group([ (1,10,9)(2,5,15)(3,4,11)(6,16,13)(7,8,12), (3,7)(4,9)(5,13)(6,16)(8,10)(11,14) ]), 
  Group([ (2,8,10)(3,16,5)(4,9,12)(6,7,13)(11,14,15), (1,4)(3,6)(8,11)(9,13)(12,16)(14,15) ]), 
  Group([ (2,5,11)(3,4,15)(6,7,13)(8,12,16)(9,10,14), (1,11)(2,7)(4,8)(5,10)(9,13)(12,16) ]), 
  Group([ (1,12,15)(3,5,6)(4,14,16)(7,11,8)(9,13,10), (1,4)(2,10)(5,7)(8,11)(9,16)(12,13) ]), 
  Group([ (1,8,15)(2,11,9)(3,7,10)(4,5,12)(13,16,14), (1,6)(2,4)(5,15)(7,13)(8,9)(14,16) ]), 
  Group([ (1,2,12)(3,14,6)(4,5,16)(7,13,8)(9,11,10), (1,13)(3,12)(5,9)(6,7)(8,15)(10,11) ]), 
  Group([ (1,15,16)(2,7,5)(3,12,11)(4,6,9)(8,14,13), (1,12)(2,15)(5,11)(6,8)(10,16)(13,14) ]), 
  Group([ (1,5,16)(2,8,13)(4,11,14)(6,7,10)(9,12,15), (1,2)(3,4)(5,14)(7,9)(11,13)(12,15) ]), 
  Group([ (1,2,12)(3,14,6)(4,5,16)(7,13,8)(9,11,10), (2,3)(4,6)(5,12)(7,11)(8,13)(15,16) ]), 
  Group([ (1,2,12)(3,11,8)(4,13,10)(5,6,7)(9,14,16), (2,4)(3,10)(5,9)(8,15)(11,12)(14,16) ]), 
  Group([ (1,2,12)(3,5,10)(4,14,8)(6,9,13)(7,11,16), (2,7)(3,14)(5,10)(6,15)(9,16)(12,13) ]), 
  Group([ (1,2,12)(3,13,16)(4,11,6)(5,8,9)(7,14,10), (2,9)(4,13)(6,11)(7,8)(10,15)(12,14) ]), 
  Group([ (1,3,5)(2,7,13)(4,11,12)(6,8,10)(9,14,15), (2,10)(3,6)(5,7)(9,12)(13,16)(14,15) ]), 
  Group([ (1,3,5)(2,8,15)(4,6,7)(9,12,13)(10,11,14), (3,9)(4,7)(5,14)(6,8)(10,16)(11,13) ]), 
  Group([ (1,3,5)(2,12,10)(4,9,8)(6,14,13)(7,15,11), (2,14)(3,11)(4,16)(5,8)(9,15)(10,12) ]), 
  Group([ (1,4,11)(2,16,15)(3,10,9)(5,13,6)(7,12,14), (3,9)(4,7)(5,14)(6,8)(10,16)(11,13) ]), 
  Group([ (1,4,11)(2,9,14)(3,5,12)(6,10,16)(7,13,15), (2,6)(4,10)(7,12)(8,14)(9,11)(13,15) ]), 
  Group([ (1,6,7)(2,12,5)(3,9,14)(4,10,15)(8,16,11), (3,4)(5,11)(6,10)(7,9)(8,16)(13,14) ]), 
  Group([ (1,16,12)(2,3,13)(4,10,7)(5,9,15)(6,14,11), (3,9)(4,7)(5,14)(6,8)(10,16)(11,13) ]), 
  Group([ (1,15,6)(2,3,13)(4,9,16)(5,10,11)(7,12,14), (1,11)(3,14)(4,8)(6,15)(9,12)(13,16) ]), 
  Group([ (1,8,12)(2,4,14)(3,6,9)(5,10,13)(7,15,11), (3,9)(4,7)(5,14)(6,8)(10,16)(11,13) ]), 
  Group([ (1,14,16)(2,5,10)(3,9,4)(6,12,11)(8,15,13), (1,13)(3,12)(5,9)(6,7)(8,15)(10,11) ]), 
  Group([ (1,13,5)(2,4,9)(3,6,14)(7,11,16)(8,12,10), (2,9)(4,13)(6,11)(7,8)(10,15)(12,14) ]), 
  Group([ (1,3,11)(2,7,14)(4,5,12)(8,16,10)(9,13,15), (2,7)(3,14)(5,10)(6,15)(9,16)(12,13) ]), 
  Group([ (2,8,10)(3,16,5)(4,9,12)(6,7,13)(11,14,15), (2,3)(4,6)(5,12)(7,11)(8,13)(15,16) ]), 
  Group([ (1,13,14)(3,4,12)(5,10,7)(6,11,9)(8,16,15), (1,10)(4,6)(5,12)(7,15)(9,14)(11,16) ]), 
  Group([ (1,8,14)(2,6,5)(4,7,9)(10,11,12)(13,15,16), (1,4)(2,10)(5,7)(8,11)(9,16)(12,13) ]), 
  Group([ (1,14,6)(2,5,8)(3,7,9)(10,15,13)(11,16,12), (1,10)(2,3)(7,16)(8,13)(9,14)(11,15) ]), 
  Group([ (1,7,8)(2,9,16)(3,10,15)(4,6,12)(11,13,14), (1,4)(3,6)(8,11)(9,13)(12,16)(14,15) ]), 
  Group([ (1,7,13)(2,12,8)(3,15,14)(4,10,9)(5,16,11), (1,2)(3,4)(5,14)(7,9)(11,13)(12,15) ]), 
  Group([ (1,6,13)(2,15,3)(4,5,11)(8,12,14)(9,10,16), (1,10)(2,13)(3,8)(4,12)(5,6)(9,14) ]), 
  Group([ (1,13,9)(2,5,4)(3,15,11)(6,16,10)(7,12,14), (2,10)(3,6)(5,7)(9,12)(13,16)(14,15) ]), 
  Group([ (1,10,14)(2,7,12)(3,16,6)(4,13,11)(5,8,15), (1,2)(5,13)(6,10)(8,16)(11,14)(12,15) ]), 
  Group([ (1,3,13)(2,7,5)(4,14,12)(6,16,8)(9,11,15), (1,6)(2,4)(5,15)(7,13)(8,9)(14,16) ]), 
  Group([ (1,2,5)(3,12,10)(4,9,13)(6,14,8)(7,16,15), (1,16)(3,5)(4,15)(7,8)(10,13)(12,14) ]), 
  Group([ (1,15,2)(3,11,10)(4,13,8)(5,16,7)(6,9,14), (1,8)(2,7)(3,6)(4,11)(5,10)(14,15) ]), 
  Group([ (1,5,15)(2,3,8)(4,7,14)(6,11,10)(9,12,16), (2,4)(3,10)(5,9)(8,15)(11,12)(14,16) ]), 
  Group([ (1,5,12)(2,16,4)(3,6,15)(7,9,11)(8,10,13), (1,16)(2,9)(3,5)(4,10)(6,11)(13,15) ]), 
  Group([ (1,13,5)(2,4,9)(3,6,14)(7,11,16)(8,12,10), (1,16)(2,11)(3,5)(6,9)(7,12)(8,14) ]), 
  Group([ (1,13,4)(2,5,9)(3,12,14)(6,10,8)(7,15,11), (2,11)(4,15)(6,9)(7,14)(8,12)(10,13) ]), 
  <permutation group of size 96 with 6 generators>, <permutation group of size 96 with 6 generators>, 
  <permutation group of size 96 with 6 generators>, <permutation group of size 96 with 6 generators>, 
  <permutation group of size 96 with 6 generators>, <permutation group of size 96 with 6 generators>, 
  <permutation group of size 96 with 6 generators>, <permutation group of size 96 with 6 generators>, 
  <permutation group of size 96 with 6 generators>, <permutation group of size 96 with 6 generators>, 
  <permutation group of size 160 with 6 generators>, <permutation group of size 160 with 6 generators>,
  <permutation group of size 160 with 6 generators>, <permutation group of size 160 with 6 generators>,
  <permutation group of size 160 with 6 generators>, <permutation group of size 160 with 6 generators>,
  <permutation group of size 192 with 7 generators>, <permutation group of size 192 with 7 generators>,
  <permutation group of size 192 with 7 generators>, <permutation group of size 192 with 7 generators>,
  <permutation group of size 192 with 7 generators> ]
gap> Size(ms);
85
gap> m1 := ms[1];
Group([ (1,2,12)(3,13,16)(4,11,6)(5,8,9)(7,14,10), (2,3)(4,6)(5,12)(7,11)(8,13)(15,16) ])
gap> m2 := ms[17];
Group([ (1,2,10)(3,6,4)(5,9,15)(7,14,12)(11,13,16), (2,3)(4,6)(5,12)(7,11)(8,13)(15,16) ])
gap> m3 := ms[48];
Group([ (1,3,11)(2,7,14)(4,5,12)(8,16,10)(9,13,15), (2,7)(3,14)(5,10)(6,15)(9,16)(12,13) ])
gap> m3 := ms[57];
Group([ (1,10,14)(2,7,12)(3,16,6)(4,13,11)(5,8,15), (1,2)(5,13)(6,10)(8,16)(11,14)(12,15) ])
gap> m3 := ms[65];
<permutation group of size 96 with 6 generators>
gap> m3 := ms[48];
Group([ (1,3,11)(2,7,14)(4,5,12)(8,16,10)(9,13,15), (2,7)(3,14)(5,10)(6,15)(9,16)(12,13) ])
gap> m4 := ms[57];
Group([ (1,10,14)(2,7,12)(3,16,6)(4,13,11)(5,8,15), (1,2)(5,13)(6,10)(8,16)(11,14)(12,15) ])
gap> m5 := ms[65];
<permutation group of size 96 with 6 generators>
gap> maxSubs := List([m1, m2, m3, m4, m5]);
[ Group([ (1,2,12)(3,13,16)(4,11,6)(5,8,9)(7,14,10), (2,3)(4,6)(5,12)(7,11)(8,13)(15,16) ]), 
  Group([ (1,2,10)(3,6,4)(5,9,15)(7,14,12)(11,13,16), (2,3)(4,6)(5,12)(7,11)(8,13)(15,16) ]), 
  Group([ (1,3,11)(2,7,14)(4,5,12)(8,16,10)(9,13,15), (2,7)(3,14)(5,10)(6,15)(9,16)(12,13) ]), 
  Group([ (1,10,14)(2,7,12)(3,16,6)(4,13,11)(5,8,15), (1,2)(5,13)(6,10)(8,16)(11,14)(12,15) ]), 
  <permutation group of size 96 with 6 generators> ]
gap> H := Intersection(m1, m2);
Group([ (2,3)(4,6)(5,12)(7,11)(8,13)(15,16), (1,2)(5,13)(6,10)(8,16)(11,14)(12,15) ])
gap> Core(G, H);
Group(())
gap> List(maxSubs, x -> Core(G,x));
[ Group(()), Group(()), Group(()), Group(()), 
  Group([ (1,2)(3,9)(4,7)(5,11)(6,16)(8,10)(12,15)(13,14), (1,3)(2,9)(4,15)(5,16)(6,11)(7,12)(8,14)(10,
        13), (1,4)(2,7)(3,15)(5,10)(6,14)(8,11)(9,12)(13,16), (1,5)(2,11)(3,16)(4,10)(6,9)(7,8)(12,
        14)(13,15) ]) ]
gap> core5 := Core(G, m5);
Group([ (1,2)(3,9)(4,7)(5,11)(6,16)(8,10)(12,15)(13,14), (1,3)(2,9)(4,15)(5,16)(6,11)(7,12)(8,14)(10,
    13), (1,4)(2,7)(3,15)(5,10)(6,14)(8,11)(9,12)(13,16), (1,5)(2,11)(3,16)(4,10)(6,9)(7,8)(12,14)(13,
    15) ])
gap> IsNormal(G, core5);
true
gap> Order(core5);
16
gap> for i in [1..5] do
> ;
> ;
> od;
user interrupt at
;
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> for i in [1..4] do
> for j in [i+1..5] do
> H=Intersection(maxSubs[i], maxSubs[j]);
Syntax error: := expected
H=Intersection(maxSubs[i], maxSubs[j]);
 ^
> od;
> od;
gap> for i in [1..4] do
> for j in [i+1..5] do
> Intersection(maxSubs[i], maxSubs[j]) = H;
Syntax error: ; expected
Intersection(maxSubs[i], maxSubs[j]) = H;
                                     ^
> quit;
> od;od;
gap> for i in [1..4] do
> for j in [i+1..5] do
> if H = Intersection(maxSubs[i], maxSubs[j]) then
> Print("true ");
> else
> Print("false ");
> fi;
> od; od;
true true true true true true true true true true gap> 
gap> IntermediateSubgroups(m1,H);
rec( subgroups := [  ], inclusions := [  ] )
gap> IntermediateSubgroups(m2,H);
rec( subgroups := [  ], inclusions := [  ] )
gap> IntermediateSubgroups(m3,H);
rec( subgroups := [  ], inclusions := [  ] )
gap> IntermediateSubgroups(m4,H);
rec( subgroups := [  ], inclusions := [  ] )
gap> IntermediateSubgroups(m5,H);
rec( 
  subgroups := [ Group([ (2,3)(4,6)(5,12)(7,11)(8,13)(15,16), (1,2)(5,13)(6,10)(8,16)(11,14)(12,15), 
          (1,14)(2,13)(3,8)(4,6)(5,12)(7,16)(9,10)(11,15) ]), 
      Group([ (2,3)(4,6)(5,12)(7,11)(8,13)(15,16), (1,2)(5,13)(6,10)(8,16)(11,14)(12,15), 
          (1,16)(2,6)(3,5)(4,13)(7,14)(8,12)(9,11)(10,15) ]), 
      Group([ (2,3)(4,6)(5,12)(7,11)(8,13)(15,16), (1,2)(5,13)(6,10)(8,16)(11,14)(12,15), 
          (1,3)(2,9)(4,15)(5,16)(6,11)(7,12)(8,14)(10,13) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 4 ], [ 2, 4 ], [ 3, 4 ] ] )
gap> IsNormal(G,m5);
false
gap> Core(G,m5);
Group([ (1,2)(3,9)(4,7)(5,11)(6,16)(8,10)(12,15)(13,14), (1,3)(2,9)(4,15)(5,16)(6,11)(7,12)(8,14)(10,
    13), (1,4)(2,7)(3,15)(5,10)(6,14)(8,11)(9,12)(13,16), (1,5)(2,11)(3,16)(4,10)(6,9)(7,8)(12,14)(13,
    15) ])
gap> Read("programs/findA4Upper.g");
gap> findA4Upper(981,1000);
gap> findA4Upper(2,20);
gap> findA4Upper(801,820);
gap> findA4Upper(821,850);
gap> findA4Upper(851,870);
gap> findA4Upper(871,890);
gap> findA4Upper(891,900);
gap> findA4Upper(1001,1020);
user interrupt at
siz[c] := siz[c] + siz[d];
 called from
orbish( G, D, pnt, gens, acts, act ) called from
Blocks( g, dom, t ) called from
DoBlocks( subo[1] ) called from
AllBlocks( op ) called from
IntermediateSubgroups( G, H ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk>  quit;
gap> Read("findFrobeniusGroup.g");
Error, file "findFrobeniusGroup.g" must exist and be readable called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Read("programs/findFrobeniusGroup.g");

The Frobenius group of order 72 has GAP ID [72, 41]
gap> F71 := SmallGroup(72,41);
<pc group of size 72 with 5 generators>
gap> GraphicSubgroupLattice(F71);
<graphic subgroup lattice "GraphicSubgroupLattice of [ 72, 41 ]">
gap> MenuSelected( 0, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,2\
9,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63\
,64,65,66,67,G)
gap> MenuSelected( 0, 1, 7 );
gap> PointerButtonDown(0,575,465,1);
gap> PointerButtonDown(0,578,607,1);
gap> PointerButtonDown(0,573,754,1);
gap> PointerButtonDown(0,498,769,1);
gap> PointerButtonDown(0,730,606,1);
gap> PointerButtonDown(0,334,464,1);
gap> PointerButtonDown(0,819,611,1);
gap> PointerButtonDown(0,579,254,1);
gap> PointerButtonDown(0,389,610,1);
gap> PointerButtonDown(0,356,610,1);
gap> PointerButtonDown(0,937,610,1);
gap> PointerButtonDown(0,907,606,1);
gap> PointerButtonDown(0,855,250,1);
gap> PointerButtonDown(0,575,393,1);
gap> PointerButtonDown(0,745,264,1);
gap> PointerButtonDown(0,579,761,1);
gap> PointerButtonDown(0,571,683,1);
gap> PointerButtonDown(0,538,631,1);
gap> PointerButtonDown(0,577,532,1);
gap> PointerButtonDown(0,658,748,1);
gap> PointerButtonDown(0,613,627,1);
gap> PointerButtonDown(0,579,827,1);
gap> PointerButtonDown(0,481,447,1);
gap> PointerButtonDown(0,355,442,1);
gap> PointerButtonDown(0,378,443,1);
gap> PointerButtonDown(0,874,107,1);
gap> PointerButtonDown(0,954,605,1);
gap> PointerButtonDown(0,423,275,1);
gap> PointerButtonDown(0,333,396,1);
gap> PointerButtonDown(0,577,111,1);
gap> PointerButtonDown(0,404,99,1);
gap> PointerButtonDown(0,380,442,1);
gap> PointerButtonDown(0,662,441,1);
gap> PointerButtonDown(0,301,587,1);
gap> StructureDescription(F71);
"(C3 x C3) : Q8"
gap> c3 := CyclicGroup(3);
<pc group of size 3 with 1 generators>
gap> c3c3 := DirectProduct(c3,c3);
<pc group of size 9 with 2 generators>
gap> GraphicSubgroupLattice(c3c3);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 1, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,G)
gap> q8 := SmallGroup(8,4);
<pc group of size 8 with 3 generators>
gap> StructureDescription(q8);
"Q8"
gap> GraphicSubgroupLattice(q8);
<graphic subgroup lattice "GraphicSubgroupLattice of [ 8, 4 ]">
gap> MenuSelected( 2, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,G)
gap> PointerButtonDown(0,538,274,1);
gap> PointerButtonDown(0,696,107,1);
gap> PointerButtonDown(0,466,104,1);
gap> PointerButtonDown(0,285,103,1);
gap> PointerButtonDown(0,665,88,1);
gap> PointerButtonDown(0,860,231,1);
gap> PointerButtonDown(0,872,252,1);
gap> PointerButtonDown(0,864,241,1);
gap> PointerButtonDown(0,281,441,1);
gap> PointerButtonDown(0,386,591,1);
gap> PointerButtonDown(0,726,540,1);
gap> PointerButtonDown(0,453,704,1);
gap> PointerButtonDown(0,881,373,1);
gap> PointerButtonDown(0,899,668,1);
gap> PointerButtonDown(0,537,745,1);
gap> PointerButtonDown(0,523,539,1);
gap> PointerButtonDown(0,888,587,1);
gap> PointerButtonDown(0,695,588,1);
gap> PointerButtonDown(0,772,530,1);
gap> PointerButtonDown(0,589,736,1);
gap> PointerButtonDown(0,663,734,1);
gap> PointerButtonDown(0,876,534,1);
gap> PointerButtonDown(0,447,443,1);
gap> PointerButtonDown(0,981,397,1);
gap> PointerButtonDown(0,798,245,1);
gap> PointerButtonDown(0,947,664,1);
gap> PointerButtonDown(0,925,533,1);
gap> PointerButtonDown(0,676,743,1);
gap> PointerButtonDown(0,730,745,1);
gap> PointerButtonDown(0,544,748,1);
gap> PointerButtonDown(0,627,615,1);
gap> PointerButtonDown(0,420,595,1);
gap> PointerButtonDown(0,942,245,1);
gap> PointerButtonDown(0,673,612,1);
gap> PointerButtonDown(0,985,532,1);
gap> PointerButtonDown(0,901,243,1);
gap> PointerButtonDown(0,680,109,1);
gap> PointerButtonDown(0,571,31,1);
gap> PointerButtonDown(0,478,447,1);
gap> PointerButtonDown(0,588,432,1);
gap> PointerButtonDown(0,702,761,1);
gap> PointerButtonDown(0,556,838,1);
gap> PointerButtonDown(0,567,764,1);
gap> PointerButtonDown(0,860,90,1);
gap> PointerButtonDown(0,473,103,1);
gap> PointerButtonDown(0,722,102,1);
gap> PointerButtonDown(0,475,608,1);
gap> PointerButtonDown(0,235,603,1);
gap> PointerButtonDown(0,490,596,1);
gap> PointerButtonDown(0,699,104,1);
gap> PointerButtonDown(0,741,102,1);
gap> PointerButtonDown(0,648,409,1);
gap> PointerButtonDown(0,518,764,1);
gap> PointerButtonDown(0,1062,395,1);
gap> PointerButtonDown(0,1048,663,1);
gap> PointerButtonDown(0,657,767,1);
gap> PointerButtonDown(0,730,763,1);
gap> PointerButtonDown(0,826,775,1);
gap> PointerButtonDown(0,1102,656,1);
gap> PointerButtonDown(0,1046,521,1);
gap> PointerButtonDown(0,1081,522,1);
gap> PointerButtonDown(0,783,530,1);
gap> PointerButtonDown(0,625,759,1);
gap> PointerButtonDown(0,686,604,1);
gap> PointerButtonDown(0,712,601,1);
gap> PointerButtonDown(0,498,601,1);
gap> PointerButtonDown(0,477,597,1);
gap> PointerButtonDown(0,620,22,1);
gap> PointerButtonDown(0,715,103,1);
gap> MenuSelected( 0, 2, 12 );
#I  Intermediate Subgroups (G,66) --> ()
gap> PointerButtonDown(0,363,151,1);
gap> PointerButtonDown(0,718,107,1);
gap> MenuSelected( 0, 0, 1 );
gap> PointerButtonDown(1,44,65,1);
gap> MenuSelected( 1, 0, 1 );
gap> MenuSelected( 2, 0, 1 );
gap> StructureDescription(F72);
Variable: 'F72' must have a value

gap> StructureDescription(F71);
"(C3 x C3) : Q8"
gap> GraphicSubgroupLattice(F71);
<graphic subgroup lattice "GraphicSubgroupLattice of [ 72, 41 ]">
gap> MenuSelected( 3, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,2\
9,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63\
,64,65,66,67,G)
gap> MenuSelected( 3, 1, 7 );
gap> MenuSelected( 3, 0, 1 );
gap> PointerButtonDown(0,502,452,1);
gap> PointerButtonDown(0,357,453,1);
gap> IsNormal(F71,q8);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `IsNormalOp' on 2 arguments called from
oper( super, sub ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> IsSubgroup(F71,q8);
false
gap> PointerButtonDown(0,1139,414,1);
gap> MenuSelected( 0, 2, 19 );
#I  SelectedGroups to GAP (63)
gap> gg := last;
[ Group([ f4, f5 ]) ]
gap> gg := gg[1];
Group([ f4, f5 ])
gap> StructureDescription(gg);
"C3 x C3"
gap> PointerButtonDown(0,649,839,1);
gap> IsNormal(F71,gg);
true
gap> PointerButtonDown(0,486,588,1);
gap> PointerButtonDown(0,512,592,1);
gap> PointerButtonDown(0,341,455,1);
gap> PointerButtonDown(0,315,450,1);
gap> PointerButtonDown(0,660,440,1);
gap> MenuSelected( 0, 0, 1 );
gap> PointerButtonDown(0,815,751,1);
gap> PointerButtonDown(0,1061,532,1);
gap> PointerButtonDown(0,790,828,1);
gap> PointerButtonDown(0,888,746,1);
gap> PointerButtonDown(0,929,749,1);
gap> PointerButtonDown(0,775,530,1);
gap> PointerButtonDown(0,724,616,1);
gap> PointerButtonDown(0,1072,530,1);
gap> PointerButtonDown(0,1133,661,1);
gap> PointerButtonDown(0,1130,662,1);
gap> PointerButtonDown(0,1137,666,1);
gap> PointerButtonDown(0,746,613,1);
gap> PointerButtonDown(0,500,595,1);
gap> PointerButtonDown(0,763,606,1);
gap> PointerButtonDown(0,518,606,1);
gap> PointerButtonDown(0,280,620,1);
gap> PointerButtonDown(0,275,625,1);
gap> PointerButtonDown(0,526,611,1);
gap> PointerButtonDown(0,559,601,1);
gap> PointerButtonDown(0,723,759,1);
gap> PointerButtonDown(0,1089,528,1);
gap> PointerButtonDown(0,696,756,1);
gap> PointerButtonDown(0,515,456,1);
gap> PointerButtonDown(0,533,457,1);
gap> PointerButtonDown(0,908,826,1);
gap> PointerButtonDown(0,285,629,1);
gap> PointerButtonDown(0,535,607,1);
gap> PointerButtonDown(0,533,454,1);
gap> PointerButtonDown(0,228,298,1);
gap> PointerButtonDown(0,718,98,1);
gap> PointerButtonDown(0,622,31,1);
gap> PointerButtonDown(0,786,102,1);
gap> MenuSelected( 0, 0, 1 );
gap> Read("programs/testConjecture.g");
gap> Read("programs/findSolvableNonNilpotentGroups.g");
gap> G := SmallGroup(108,44);
<pc group of size 108 with 5 generators>
gap> g := SmallGroup(108,44);
<pc group of size 108 with 5 generators>
gap> name := "C2xC3C3C3sdpC2";
"C2xC3C3C3sdpC2"
gap> testConjecture(G, g, name, true);
gap> StructureDescription(G);
"C2 x ((C3 x C3 x C3) : C2)"
gap> zG := Center(G);
Group([ f2 ])
gap> ZG := Center(G);
Group([ f2 ])
gap> GmodZG := FactorGroup(G,ZG);
Group([ f1, <identity> of ..., f2, f3, f4 ])
gap> StructureDescription(GmodZG);
"(C3 x C3 x C3) : C2"
gap> StructureDescription(ZG);
"C2"
gap> zg := Center(g);
Group([ f2 ])
gap> gmodzg := FactorGroup(g,zg);
Group([ f1, <identity> of ..., f2, f3, f4 ])
gap> name="C3C3C3sdpC2";
false
gap> name:="C3C3C3sdpC2";
"C3C3C3sdpC2"
gap> testConjecture(GmodZG, gmodzg, name, true);
gap> s4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> S4 := SymmetricGroup(4);;
gap> name:="S4";
"S4"
gap> testConjecture(S4,s4,name,true);
gap> G := GL(2,3);;
gap> g := GL(2,3);;
gap> name:="GL23";;
gap> testConjecture(G,g,name,true);
gap> G:= SmallGroup(48,28);
<pc group of size 48 with 5 generators>
gap> StructureDescription(G);
"C2 . S4 = SL(2,3) . C2"
gap> g:= SmallGroup(48,28);
<pc group of size 48 with 5 generators>
gap> name := "C2.S4";
"C2.S4"
gap> name := "BO";
"BO"
gap> testConjecture(G,g,name,true);
gap> StructureDescription(F71);
"(C3 x C3) : Q8"
gap> G := SmallGroup(72,41);
<pc group of size 72 with 5 generators>
gap> g := SmallGroup(72,41);
<pc group of size 72 with 5 generators>
gap> StructureDescription(G);
"(C3 x C3) : Q8"
gap> name:="C3C3sdpQ8";;
gap> testConjecture(G,g,name,true);
gap> G := GU(2,3);;
gap> g := GU(2,3);;
gap> name := "GU23";;
gap> testConjecture(G,g,name,true);
gap> G := GL(2,3);
GL(2,3)
gap> g := GL(2,3);;
gap> ZG := Center(G);
<group of 2x2 matrices in characteristic 3>
gap> zg := Center(g);
<group of 2x2 matrices in characteristic 3>
gap> GmodZG := FactorGroup(G,ZG);
Group([ f1, f2^2*f4 ])
gap> StructureDescription(GmodZG);
"S4"
gap> gmodzg := FactorGroup(g,zg);
Group([ f1, f2^2*f4 ])
gap> name:="GL23modZ";
"GL23modZ"
gap> testConjecture(G,g,name,true);
gap> testConjecture(GmodZG,gmodzg,name,true);
gap> G := SL(2,3);;
gap> g := SL(2,3);;
gap> name := "SL23";
"SL23"
gap> testConjecture(G,g,name,true);
gap> quit;
