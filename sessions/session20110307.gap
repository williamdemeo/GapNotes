gap> List([1..20], x->NrTransitiveGroups(x));
[ 1, 1, 2, 5, 5, 16, 7, 50, 34, 45, 8, 301, 9, 63, 104, 1954, 10, 983, 8, 1117 ]
gap> g:=TransitiveGroup(12,30);
1/2[1/4.4^3]S(3)
gap> MaximalSubgroupClassReps(g);
[ Group([ (1,7)(2,8)(3,9)(4,10)(5,11)(6,12), (1,5,9)(2,6,10)(3,7,11)(4,8,12), (1,7)(2,8)(4,10)(5,11), 
      (1,7)(3,9)(4,10)(6,12) ]), Group([ (1,8,7,2)(3,6,9,12)(4,11,10,5), (1,7)(2,8)(3,9)(4,10)(5,11)(6,12), 
      (1,7)(2,8)(4,10)(5,11), (1,7)(3,9)(4,10)(6,12) ]), 
  Group([ (1,8,7,2)(3,6,9,12)(4,11,10,5), (1,7)(2,8)(3,9)(4,10)(5,11)(6,12), (1,5,9)(2,6,10)(3,7,11)(4,8,12) 
     ]) ]
gap> GraphicSubgroupLattice(g);
<graphic subgroup lattice "GraphicSubgroupLattice of 1/2[1/4.4^3]S(3)">
gap> MenuSelected( 0, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,\
32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,G)
gap> h:=Stabilizer(g,1);
Group([ (3,9)(6,12), (2,8)(5,11) ])
gap> StructureDescription(g);
"A4 : C4"
gap> StructureDescription(h);
"C2 x C2"
gap> InsertVertex(h);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `InsertVertex' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> InsertVertex(h);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `InsertVertex' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> L:=GraphicSubgroupLattice(g);
<graphic subgroup lattice "GraphicSubgroupLattice of 1/2[1/4.4^3]S(3)">
gap> InsertVertex(L,h);
[ <vertex of graphic graph, label: "2", Serial:55>, true ]
gap> PointerButtonDown(1,464,222,1);
gap> PointerButtonDown(1,399,389,1);
gap> MenuSelected( 1, 1, 12 );
gap> MenuSelected( 1, 2, 1 );
#I  All Subgroups (H) --> (1,3,4,5,H)
gap> PointerButtonDown(1,409,393,1);
gap> PointerButtonDown(1,400,26,1);
gap> PointerButtonDown(1,403,398,1);
gap> MenuSelected( 1, 2, 12 );
#I  Intermediate Subgroups (G,H) --> (6,7,8,9,10)
gap> PointerButtonDown(1,401,92,1);
gap> intHG:=IntermediateSubgroups(g,h);
rec( subgroups := [ Group([ (3,9)(6,12), (2,8)(5,11), (1,7)(2,8)(4,10)(5,11) ]), 
      Group([ (3,9)(6,12), (2,8)(5,11), (1,7)(2,8)(4,10)(5,11), (1,8,7,2)(3,12,9,6)(4,11,10,5) ]), 
      Group([ (3,9)(6,12), (2,8)(5,11), (1,7)(2,8)(4,10)(5,11), (1,6)(2,5,8,11)(3,10)(4,9)(7,12) ]), 
      Group([ (3,9)(6,12), (2,8)(5,11), (1,7)(2,8)(4,10)(5,11), (1,4,7,10)(2,3)(5,6)(8,9)(11,12) ]), 
      Group([ (3,9)(6,12), (2,8)(5,11), (1,7)(2,8)(4,10)(5,11), (1,9,5)(2,10,6)(3,11,7)(4,12,8) ]) ], 
  inclusions := [ [ 0, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 2, 6 ], [ 3, 6 ], [ 4, 6 ], [ 5, 6 ] ] )
gap> k:=intHG.subgroups[1];
Group([ (3,9)(6,12), (2,8)(5,11), (1,7)(2,8)(4,10)(5,11) ])
gap> IsTransitive(k);
false
gap> Size(intHG.subgroups);
5
gap> List([1..5], x->IsTransitive(intHG.subgroups[x]));
[ false, false, false, false, false ]
gap> Read("../ConjectureTransGroups.gap");
Syntax error: end expected in ../ConjectureTransGroups.gap line 25
^
gap> Read("../ConjectureTransGroups.gap");
gap> transitiveConjecture(6);
gap> transitiveConjecture(7);
gap> transitiveConjecture(8);
gap> transitiveConjecture(9);
gap> transitiveConjecture(10);
gap> transitiveConjecture(11);
gap> transitiveConjecture(12);
gap> Read("../ConjectureTransGroups.gap");
gap> transitiveConjecture(6);
Checking 1/16...  (0 counterexamples so far) 
Checking 2/16...  (0 counterexamples so far) 
Checking 3/16...  (0 counterexamples so far) 
Checking 4/16...  (0 counterexamples so far) 
Checking 5/16...  (0 counterexamples so far) 
Checking 6/16...  (0 counterexamples so far) 
Checking 7/16...  (0 counterexamples so far) 
Checking 8/16...  (0 counterexamples so far) 
Checking 9/16...  (0 counterexamples so far) 
Checking 10/16...  (0 counterexamples so far) 
Checking 11/16...  (0 counterexamples so far) 
Checking 12/16...  (0 counterexamples so far) 
Checking 13/16...  (0 counterexamples so far) 
Checking 14/16...  (0 counterexamples so far) 
Checking 15/16...  (0 counterexamples so far) 
Checking 16/16...  (0 counterexamples so far) 
gap> transitiveConjecture(7);
Checking 1/7...  (0 counterexamples so far) 
Checking 2/7...  (0 counterexamples so far) 
Checking 3/7...  (0 counterexamples so far) 
Checking 4/7...  (0 counterexamples so far) 
Checking 5/7...  (0 counterexamples so far) 
Checking 6/7...  (0 counterexamples so far) 
Checking 7/7...  (0 counterexamples so far) 
gap> transitiveConjecture(8);
Checking 1/50...  (0 counterexamples so far) 
Checking 2/50...  (0 counterexamples so far) 
Checking 3/50...  (0 counterexamples so far) 
Checking 4/50...  (0 counterexamples so far) 
Checking 5/50...  (0 counterexamples so far) 
Checking 6/50...  (0 counterexamples so far) 
Checking 7/50...  (0 counterexamples so far) 
Checking 8/50...  (0 counterexamples so far) 
Checking 9/50...  (0 counterexamples so far) 
Checking 10/50...  (0 counterexamples so far) 
Checking 11/50...  (0 counterexamples so far) 
Checking 12/50...  (0 counterexamples so far) 
Checking 13/50...  (0 counterexamples so far) 
Checking 14/50...  (0 counterexamples so far) 
Checking 15/50...  (0 counterexamples so far) 
Checking 16/50...  (0 counterexamples so far) 
Checking 17/50...  (0 counterexamples so far) 
Checking 18/50...  (0 counterexamples so far) 
Checking 19/50...  (0 counterexamples so far) 
Checking 20/50...  (0 counterexamples so far) 
Checking 21/50...  (0 counterexamples so far) 
Checking 22/50...  (0 counterexamples so far) 
Checking 23/50...  (0 counterexamples so far) 
Checking 24/50...  (0 counterexamples so far) 
Checking 25/50...  (0 counterexamples so far) 
Checking 26/50...  (0 counterexamples so far) 
Checking 27/50...  (0 counterexamples so far) 
Checking 28/50...  (0 counterexamples so far) 
Checking 29/50...  (0 counterexamples so far) 
Checking 30/50...  (0 counterexamples so far) 
Checking 31/50...  (0 counterexamples so far) 
Checking 32/50...  (0 counterexamples so far) 
Checking 33/50...  (0 counterexamples so far) 
Checking 34/50...  (0 counterexamples so far) 
Checking 35/50...  (0 counterexamples so far) 
Checking 36/50...  (0 counterexamples so far) 
Checking 37/50...  (0 counterexamples so far) 
Checking 38/50...  (0 counterexamples so far) 
Checking 39/50...  (0 counterexamples so far) 
Checking 40/50...  (0 counterexamples so far) 
Checking 41/50...  (0 counterexamples so far) 
Checking 42/50...  (0 counterexamples so far) 
Checking 43/50...  (0 counterexamples so far) 
Checking 44/50...  (0 counterexamples so far) 
Checking 45/50...  (0 counterexamples so far) 
Checking 46/50...  (0 counterexamples so far) 
Checking 47/50...  (0 counterexamples so far) 
Checking 48/50...  (0 counterexamples so far) 
Checking 49/50...  (0 counterexamples so far) 
Checking 50/50...  (0 counterexamples so far) 
gap> transitiveConjecture(9);
Checking 1/34...  (0 counterexamples so far) 
Checking 2/34...  (0 counterexamples so far) 
Checking 3/34...  (0 counterexamples so far) 
Checking 4/34...  (0 counterexamples so far) 
Checking 5/34...  (0 counterexamples so far) 
Checking 6/34...  (0 counterexamples so far) 
Checking 7/34...  (0 counterexamples so far) 
Checking 8/34...  (0 counterexamples so far) 
Checking 9/34...  (0 counterexamples so far) 
Checking 10/34...  (0 counterexamples so far) 
Checking 11/34...  (0 counterexamples so far) 
Checking 12/34...  (0 counterexamples so far) 
Checking 13/34...  (0 counterexamples so far) 
Checking 14/34...  (0 counterexamples so far) 
Checking 15/34...  (0 counterexamples so far) 
Checking 16/34...  (0 counterexamples so far) 
Checking 17/34...  (0 counterexamples so far) 
Checking 18/34...  (0 counterexamples so far) 
Checking 19/34...  (0 counterexamples so far) 
Checking 20/34...  (0 counterexamples so far) 
Checking 21/34...  (0 counterexamples so far) 
Checking 22/34...  (0 counterexamples so far) 
Checking 23/34...  (0 counterexamples so far) 
Checking 24/34...  (0 counterexamples so far) 
Checking 25/34...  (0 counterexamples so far) 
Checking 26/34...  (0 counterexamples so far) 
Checking 27/34...  (0 counterexamples so far) 
Checking 28/34...  (0 counterexamples so far) 
Checking 29/34...  (0 counterexamples so far) 
Checking 30/34...  (0 counterexamples so far) 
Checking 31/34...  (0 counterexamples so far) 
Checking 32/34...  (0 counterexamples so far) 
Checking 33/34...  (0 counterexamples so far) 
Checking 34/34...  (0 counterexamples so far) 
gap> transitiveConjecture(10);
Checking 1/45...  (0 counterexamples so far) 
Checking 2/45...  (0 counterexamples so far) 
Checking 3/45...  (0 counterexamples so far) 
Checking 4/45...  (0 counterexamples so far) 
Checking 5/45...  (0 counterexamples so far) 
Checking 6/45...  (0 counterexamples so far) 
Checking 7/45...  (0 counterexamples so far) 
Checking 8/45...  (0 counterexamples so far) 
Checking 9/45...  (0 counterexamples so far) 
Checking 10/45...  (0 counterexamples so far) 
Checking 11/45...  (0 counterexamples so far) 
Checking 12/45...  (0 counterexamples so far) 
Checking 13/45...  (0 counterexamples so far) 
Checking 14/45...  (0 counterexamples so far) 
Checking 15/45...  (0 counterexamples so far) 
Checking 16/45...  (0 counterexamples so far) 
Checking 17/45...  (0 counterexamples so far) 
Checking 18/45...  (0 counterexamples so far) 
Checking 19/45...  (0 counterexamples so far) 
Checking 20/45...  (0 counterexamples so far) 
Checking 21/45...  (0 counterexamples so far) 
Checking 22/45...  (0 counterexamples so far) 
Checking 23/45...  (0 counterexamples so far) 
Checking 24/45...  (0 counterexamples so far) 
Checking 25/45...  (0 counterexamples so far) 
Checking 26/45...  (0 counterexamples so far) 
Checking 27/45...  (0 counterexamples so far) 
Checking 28/45...  (0 counterexamples so far) 
Checking 29/45...  (0 counterexamples so far) 
Checking 30/45...  (0 counterexamples so far) 
Checking 31/45...  (0 counterexamples so far) 
Checking 32/45...  (0 counterexamples so far) 
Checking 33/45...  (0 counterexamples so far) 
Checking 34/45...  (0 counterexamples so far) 
Checking 35/45...  (0 counterexamples so far) 
Checking 36/45...  (0 counterexamples so far) 
Checking 37/45...  (0 counterexamples so far) 
Checking 38/45...  (0 counterexamples so far) 
Checking 39/45...  (0 counterexamples so far) 
Checking 40/45...  (0 counterexamples so far) 
Checking 41/45...  (0 counterexamples so far) 
Checking 42/45...  (0 counterexamples so far) 
Checking 43/45...  (0 counterexamples so far) 
Checking 44/45...  (0 counterexamples so far) 
Checking 45/45...  (0 counterexamples so far) 
gap> transitiveConjecture(11);
Checking 1/8...  (0 counterexamples so far) 
Checking 2/8...  (0 counterexamples so far) 
Checking 3/8...  (0 counterexamples so far) 
Checking 4/8...  (0 counterexamples so far) 
Checking 5/8...  (0 counterexamples so far) 
Checking 6/8...  (0 counterexamples so far) 
Checking 7/8...  (0 counterexamples so far) 
Checking 8/8...  (0 counterexamples so far) 
gap> transitiveConjecture(12);
Checking 1/301...  (0 counterexamples so far) 
Checking 2/301...  (0 counterexamples so far) 
Checking 3/301...  (0 counterexamples so far) 
Checking 4/301...  (0 counterexamples so far) 
Checking 5/301...  (0 counterexamples so far) 
Checking 6/301...  (0 counterexamples so far) 
Checking 7/301...  (0 counterexamples so far) 
Checking 8/301...  (0 counterexamples so far) 
Checking 9/301...  (0 counterexamples so far) 
Checking 10/301...  (0 counterexamples so far) 
Checking 11/301...  (0 counterexamples so far) 
Checking 12/301...  (0 counterexamples so far) 
Checking 13/301...  (0 counterexamples so far) 
Checking 14/301...  (0 counterexamples so far) 
Checking 15/301...  (0 counterexamples so far) 
Checking 16/301...  (0 counterexamples so far) 
Checking 17/301...  (0 counterexamples so far) 
Checking 18/301...  (0 counterexamples so far) 
Checking 19/301...  (0 counterexamples so far) 
Checking 20/301...  (0 counterexamples so far) 
Checking 21/301...  (0 counterexamples so far) 
Checking 22/301...  (0 counterexamples so far) 
Checking 23/301...  (0 counterexamples so far) 
Checking 24/301...  (0 counterexamples so far) 
Checking 25/301...  (0 counterexamples so far) 
Checking 26/301...  (0 counterexamples so far) 
Checking 27/301...  (0 counterexamples so far) 
Checking 28/301...  (0 counterexamples so far) 
Checking 29/301...  (0 counterexamples so far) 
Checking 30/301...  (0 counterexamples so far) 
Checking 31/301...  (0 counterexamples so far) 
Checking 32/301...  (0 counterexamples so far) 
Checking 33/301...  (0 counterexamples so far) 
Checking 34/301...  (0 counterexamples so far) 
Checking 35/301...  (0 counterexamples so far) 
Checking 36/301...  (0 counterexamples so far) 
Checking 37/301...  (0 counterexamples so far) 
Checking 38/301...  (0 counterexamples so far) 
Checking 39/301...  (0 counterexamples so far) 
Checking 40/301...  (0 counterexamples so far) 
Checking 41/301...  (0 counterexamples so far) 
Checking 42/301...  (0 counterexamples so far) 
Checking 43/301...  (0 counterexamples so far) 
Checking 44/301...  (0 counterexamples so far) 
Checking 45/301...  (0 counterexamples so far) 
Checking 46/301...  (0 counterexamples so far) 
Checking 47/301...  (0 counterexamples so far) 
Checking 48/301...  (0 counterexamples so far) 
Checking 49/301...  (0 counterexamples so far) 
Checking 50/301...  (0 counterexamples so far) 
Checking 51/301...  (0 counterexamples so far) 
Checking 52/301...  (0 counterexamples so far) 
Checking 53/301...  (0 counterexamples so far) 
Checking 54/301...  (0 counterexamples so far) 
Checking 55/301...  (0 counterexamples so far) 
Checking 56/301...  (0 counterexamples so far) 
Checking 57/301...  (0 counterexamples so far) 
Checking 58/301...  (0 counterexamples so far) 
Checking 59/301...  (0 counterexamples so far) 
Checking 60/301...  (0 counterexamples so far) 
Checking 61/301...  (0 counterexamples so far) 
Checking 62/301...  (0 counterexamples so far) 
Checking 63/301...  (0 counterexamples so far) 
Checking 64/301...  (0 counterexamples so far) 
Checking 65/301...  (0 counterexamples so far) 
Checking 66/301...  (0 counterexamples so far) 
Checking 67/301...  (0 counterexamples so far) 
Checking 68/301...  (0 counterexamples so far) 
Checking 69/301...  (0 counterexamples so far) 
Checking 70/301...  (0 counterexamples so far) 
Checking 71/301...  (0 counterexamples so far) 
Checking 72/301...  (0 counterexamples so far) 
Checking 73/301...  (0 counterexamples so far) 
Checking 74/301...  (0 counterexamples so far) 
Checking 75/301...  (0 counterexamples so far) 
Checking 76/301...  (0 counterexamples so far) 
Checking 77/301...  (0 counterexamples so far) 
Checking 78/301...  (0 counterexamples so far) 
Checking 79/301...  (0 counterexamples so far) 
Checking 80/301...  (0 counterexamples so far) 
Checking 81/301...  (0 counterexamples so far) 
Checking 82/301...  (0 counterexamples so far) 
Checking 83/301...  (0 counterexamples so far) 
Checking 84/301...  (0 counterexamples so far) 
Checking 85/301...  (0 counterexamples so far) 
Checking 86/301...  (0 counterexamples so far) 
Checking 87/301...  (0 counterexamples so far) 
Checking 88/301...  (0 counterexamples so far) 
Checking 89/301...  (0 counterexamples so far) 
Checking 90/301...  (0 counterexamples so far) 
Checking 91/301...  (0 counterexamples so far) 
Checking 92/301...  (0 counterexamples so far) 
Checking 93/301...  (0 counterexamples so far) 
Checking 94/301...  (0 counterexamples so far) 
Checking 95/301...  (0 counterexamples so far) 
Checking 96/301...  (0 counterexamples so far) 
Checking 97/301...  (0 counterexamples so far) 
Checking 98/301...  (0 counterexamples so far) 
Checking 99/301...  (0 counterexamples so far) 
Checking 100/301...  (0 counterexamples so far) 
Checking 101/301...  (0 counterexamples so far) 
Checking 102/301...  (0 counterexamples so far) 
Checking 103/301...  (0 counterexamples so far) 
Checking 104/301...  (0 counterexamples so far) 
Checking 105/301...  (0 counterexamples so far) 
Checking 106/301...  (0 counterexamples so far) 
Checking 107/301...  (0 counterexamples so far) 
Checking 108/301...  (0 counterexamples so far) 
Checking 109/301...  (0 counterexamples so far) 
Checking 110/301...  (0 counterexamples so far) 
Checking 111/301...  (0 counterexamples so far) 
Checking 112/301...  (0 counterexamples so far) 
Checking 113/301...  (0 counterexamples so far) 
Checking 114/301...  (0 counterexamples so far) 
Checking 115/301...  (0 counterexamples so far) 
Checking 116/301...  (0 counterexamples so far) 
Checking 117/301...  (0 counterexamples so far) 
Checking 118/301...  (0 counterexamples so far) 
Checking 119/301...  (0 counterexamples so far) 
Checking 120/301...  (0 counterexamples so far) 
Checking 121/301...  (0 counterexamples so far) 
Checking 122/301...  (0 counterexamples so far) 
Checking 123/301...  (0 counterexamples so far) 
Checking 124/301...  (0 counterexamples so far) 
Checking 125/301...  (0 counterexamples so far) 
Checking 126/301...  (0 counterexamples so far) 
Checking 127/301...  (0 counterexamples so far) 
Checking 128/301...  (0 counterexamples so far) 
Checking 129/301...  (0 counterexamples so far) 
Checking 130/301...  (0 counterexamples so far) 
Checking 131/301...  (0 counterexamples so far) 
Checking 132/301...  (0 counterexamples so far) 
Checking 133/301...  (0 counterexamples so far) 
Checking 134/301...  (0 counterexamples so far) 
Checking 135/301...  (0 counterexamples so far) 
Checking 136/301...  (0 counterexamples so far) 
Checking 137/301...  (0 counterexamples so far) 
Checking 138/301...  (0 counterexamples so far) 
Checking 139/301...  (0 counterexamples so far) 
Checking 140/301...  (0 counterexamples so far) 
Checking 141/301...  (0 counterexamples so far) 
Checking 142/301...  (0 counterexamples so far) 
Checking 143/301...  (0 counterexamples so far) 
Checking 144/301...  (0 counterexamples so far) 
Checking 145/301...  (0 counterexamples so far) 
Checking 146/301...  (0 counterexamples so far) 
Checking 147/301...  (0 counterexamples so far) 
Checking 148/301...  (0 counterexamples so far) 
Checking 149/301...  (0 counterexamples so far) 
Checking 150/301...  (0 counterexamples so far) 
Checking 151/301...  (0 counterexamples so far) 
Checking 152/301...  (0 counterexamples so far) 
Checking 153/301...  (0 counterexamples so far) 
Checking 154/301...  (0 counterexamples so far) 
Checking 155/301...  (0 counterexamples so far) 
Checking 156/301...  (0 counterexamples so far) 
Checking 157/301...  (0 counterexamples so far) 
Checking 158/301...  (0 counterexamples so far) 
Checking 159/301...  (0 counterexamples so far) 
Checking 160/301...  (0 counterexamples so far) 
Checking 161/301...  (0 counterexamples so far) 
Checking 162/301...  (0 counterexamples so far) 
Checking 163/301...  (0 counterexamples so far) 
Checking 164/301...  (0 counterexamples so far) 
Checking 165/301...  (0 counterexamples so far) 
Checking 166/301...  (0 counterexamples so far) 
Checking 167/301...  (0 counterexamples so far) 
Checking 168/301...  (0 counterexamples so far) 
Checking 169/301...  (0 counterexamples so far) 
Checking 170/301...  (0 counterexamples so far) 
Checking 171/301...  (0 counterexamples so far) 
Checking 172/301...  (0 counterexamples so far) 
Checking 173/301...  (0 counterexamples so far) 
Checking 174/301...  (0 counterexamples so far) 
Checking 175/301...  (0 counterexamples so far) 
Checking 176/301...  (0 counterexamples so far) 
Checking 177/301...  (0 counterexamples so far) 
Checking 178/301...  (0 counterexamples so far) 
Checking 179/301...  (0 counterexamples so far) 
Checking 180/301...  (0 counterexamples so far) 
Checking 181/301...  (0 counterexamples so far) 
Checking 182/301...  (0 counterexamples so far) 
Checking 183/301...  (0 counterexamples so far) 
Checking 184/301...  (0 counterexamples so far) 
Checking 185/301...  (0 counterexamples so far) 
Checking 186/301...  (0 counterexamples so far) 
Checking 187/301...  (0 counterexamples so far) 
Checking 188/301...  (0 counterexamples so far) 
Checking 189/301...  (0 counterexamples so far) 
Checking 190/301...  (0 counterexamples so far) 
Checking 191/301...  (0 counterexamples so far) 
Checking 192/301...  (0 counterexamples so far) 
Checking 193/301...  (0 counterexamples so far) 
Checking 194/301...  (0 counterexamples so far) 
Checking 195/301...  (0 counterexamples so far) 
Checking 196/301...  (0 counterexamples so far) 
Checking 197/301...  (0 counterexamples so far) 
Checking 198/301...  (0 counterexamples so far) 
Checking 199/301...  (0 counterexamples so far) 
Checking 200/301...  (0 counterexamples so far) 
Checking 201/301...  (0 counterexamples so far) 
Checking 202/301...  (0 counterexamples so far) 
Checking 203/301...  (0 counterexamples so far) 
Checking 204/301...  (0 counterexamples so far) 
Checking 205/301...  (0 counterexamples so far) 
Checking 206/301...  (0 counterexamples so far) 
Checking 207/301...  (0 counterexamples so far) 
Checking 208/301...  (0 counterexamples so far) 
Checking 209/301...  (0 counterexamples so far) 
Checking 210/301...  (0 counterexamples so far) 
Checking 211/301...  (0 counterexamples so far) 
Checking 212/301...  (0 counterexamples so far) 
Checking 213/301...  (0 counterexamples so far) 
Checking 214/301...  (0 counterexamples so far) 
Checking 215/301...  (0 counterexamples so far) 
Checking 216/301...  (0 counterexamples so far) 
Checking 217/301...  (0 counterexamples so far) 
Checking 218/301...  (0 counterexamples so far) 
Checking 219/301...  (0 counterexamples so far) 
Checking 220/301...  (0 counterexamples so far) 
Checking 221/301...  (0 counterexamples so far) 
Checking 222/301...  (0 counterexamples so far) 
Checking 223/301...  (0 counterexamples so far) 
Checking 224/301...  (0 counterexamples so far) 
Checking 225/301...  (0 counterexamples so far) 
Checking 226/301...  (0 counterexamples so far) 
Checking 227/301...  (0 counterexamples so far) 
Checking 228/301...  (0 counterexamples so far) 
Checking 229/301...  (0 counterexamples so far) 
Checking 230/301...  (0 counterexamples so far) 
Checking 231/301...  (0 counterexamples so far) 
Checking 232/301...  (0 counterexamples so far) 
Checking 233/301...  (0 counterexamples so far) 
Checking 234/301...  (0 counterexamples so far) 
Checking 235/301...  (0 counterexamples so far) 
Checking 236/301...  (0 counterexamples so far) 
Checking 237/301...  (0 counterexamples so far) 
Checking 238/301...  (0 counterexamples so far) 
Checking 239/301...  (0 counterexamples so far) 
Checking 240/301...  (0 counterexamples so far) 
Checking 241/301...  (0 counterexamples so far) 
Checking 242/301...  (0 counterexamples so far) 
Checking 243/301...  (0 counterexamples so far) 
Checking 244/301...  (0 counterexamples so far) 
Checking 245/301...  (0 counterexamples so far) 
Checking 246/301...  (0 counterexamples so far) 
Checking 247/301...  (0 counterexamples so far) 
Checking 248/301...  (0 counterexamples so far) 
Checking 249/301...  (0 counterexamples so far) 
Checking 250/301...  (0 counterexamples so far) 
Checking 251/301...  (0 counterexamples so far) 
Checking 252/301...  (0 counterexamples so far) 
Checking 253/301...  (0 counterexamples so far) 
Checking 254/301...  (0 counterexamples so far) 
Checking 255/301...  (0 counterexamples so far) 
Checking 256/301...  (0 counterexamples so far) 
Checking 257/301...  (0 counterexamples so far) 
Checking 258/301...  (0 counterexamples so far) 
Checking 259/301...  (0 counterexamples so far) 
Checking 260/301...  (0 counterexamples so far) 
Checking 261/301...  (0 counterexamples so far) 
Checking 262/301...  (0 counterexamples so far) 
Checking 263/301...  (0 counterexamples so far) 
Checking 264/301...  (0 counterexamples so far) 
Checking 265/301...  (0 counterexamples so far) 
Checking 266/301...  (0 counterexamples so far) 
Checking 267/301...  (0 counterexamples so far) 
Checking 268/301...  (0 counterexamples so far) 
Checking 269/301...  (0 counterexamples so far) 
Checking 270/301...  (0 counterexamples so far) 
Checking 271/301...  (0 counterexamples so far) 
Checking 272/301...  (0 counterexamples so far) 
Checking 273/301...  (0 counterexamples so far) 
Checking 274/301...  (0 counterexamples so far) 
Checking 275/301...  (0 counterexamples so far) 
Checking 276/301...  (0 counterexamples so far) 
Checking 277/301...  (0 counterexamples so far) 
Checking 278/301...  (0 counterexamples so far) 
Checking 279/301...  (0 counterexamples so far) 
Checking 280/301...  (0 counterexamples so far) 
Checking 281/301...  (0 counterexamples so far) 
Checking 282/301...  (0 counterexamples so far) 
Checking 283/301...  (0 counterexamples so far) 
Checking 284/301...  (0 counterexamples so far) 
Checking 285/301...  (0 counterexamples so far) 
Checking 286/301...  (0 counterexamples so far) 
Checking 287/301...  (0 counterexamples so far) 
Checking 288/301...  (0 counterexamples so far) 
Checking 289/301...  (0 counterexamples so far) 
Checking 290/301...  (0 counterexamples so far) 
Checking 291/301...  (0 counterexamples so far) 
Checking 292/301...  (0 counterexamples so far) 
Checking 293/301...  (0 counterexamples so far) 
Checking 294/301...  (0 counterexamples so far) 
Checking 295/301...  (0 counterexamples so far) 
Checking 296/301...  (0 counterexamples so far) 
Checking 297/301...  (0 counterexamples so far) 
Checking 298/301...  (0 counterexamples so far) 
Checking 299/301...  (0 counterexamples so far) 
Checking 300/301...  (0 counterexamples so far) 
Checking 301/301...  (0 counterexamples so far) 
gap> Read("../ConjectureTransGroups.gap");
Syntax error: fi expected in ../ConjectureTransGroups.gap line 28
            od;
             ^
gap> Read("../ConjectureTransGroups.gap");
gap> transitiveConjecture(7);
Checking 1/7...  (0 transitives;  0 primitives) 
Checking 2/7...  (0 transitives;  0 primitives) 
Checking 3/7...  (0 transitives;  0 primitives) 
Checking 4/7...  (0 transitives;  0 primitives) 
Checking 5/7...  (0 transitives;  0 primitives) 
Checking 6/7...  (0 transitives;  0 primitives) 
Checking 7/7...  (0 transitives;  0 primitives) 
gap> transitiveConjecture(6);
Checking 1/16...  (0 transitives;  0 primitives) 
Checking 2/16...  (0 transitives;  0 primitives) 
Checking 3/16...  (0 transitives;  0 primitives) 
Checking 4/16...  (0 transitives;  0 primitives) 
Checking 5/16...  (0 transitives;  0 primitives) 
Checking 6/16...  (0 transitives;  0 primitives) 
Checking 7/16...  (0 transitives;  0 primitives) 
Checking 8/16...  (0 transitives;  0 primitives) 
Checking 9/16...  (0 transitives;  0 primitives) 
Checking 10/16...  (0 transitives;  0 primitives) 
Checking 11/16...  (0 transitives;  0 primitives) 
Checking 12/16...  (0 transitives;  0 primitives) 
Checking 13/16...  (0 transitives;  0 primitives) 
Checking 14/16...  (0 transitives;  0 primitives) 
Checking 15/16...  (0 transitives;  0 primitives) 
Checking 16/16...  (0 transitives;  0 primitives) 
gap> transitiveConjecture(8);
Checking 1/50...  (0 transitives;  0 primitives) 
Checking 2/50...  (0 transitives;  0 primitives) 
Checking 3/50...  (0 transitives;  0 primitives) 
Checking 4/50...  (0 transitives;  0 primitives) 
Checking 5/50...  (0 transitives;  0 primitives) 
Checking 6/50...  (0 transitives;  0 primitives) 
Checking 7/50...  (0 transitives;  0 primitives) 
Checking 8/50...  (0 transitives;  0 primitives) 
Checking 9/50...  (0 transitives;  0 primitives) 
Checking 10/50...  (0 transitives;  0 primitives) 
Checking 11/50...  (0 transitives;  0 primitives) 
Checking 12/50...  (0 transitives;  0 primitives) 
Checking 13/50...  (0 transitives;  0 primitives) 
Checking 14/50...  (0 transitives;  0 primitives) 
Checking 15/50...  (0 transitives;  0 primitives) 
Checking 16/50...  (0 transitives;  0 primitives) 
Checking 17/50...  (0 transitives;  0 primitives) 
Checking 18/50...  (0 transitives;  0 primitives) 
Checking 19/50...  (0 transitives;  0 primitives) 
Checking 20/50...  (0 transitives;  0 primitives) 
Checking 21/50...  (0 transitives;  0 primitives) 
Checking 22/50...  (0 transitives;  0 primitives) 
Checking 23/50...  (0 transitives;  0 primitives) 
Checking 24/50...  (0 transitives;  0 primitives) 
Checking 25/50...  (0 transitives;  0 primitives) 
Checking 26/50...  (0 transitives;  0 primitives) 
Checking 27/50...  (0 transitives;  0 primitives) 
Checking 28/50...  (0 transitives;  0 primitives) 
Checking 29/50...  (0 transitives;  0 primitives) 
Checking 30/50...  (0 transitives;  0 primitives) 
Checking 31/50...  (0 transitives;  0 primitives) 
Checking 32/50...  (0 transitives;  0 primitives) 
Checking 33/50...  (0 transitives;  0 primitives) 
Checking 34/50...  (0 transitives;  0 primitives) 
Checking 35/50...  (0 transitives;  0 primitives) 
Checking 36/50...  (0 transitives;  0 primitives) 
Checking 37/50...  (0 transitives;  0 primitives) 
Checking 38/50...  (0 transitives;  0 primitives) 
Checking 39/50...  (0 transitives;  0 primitives) 
Checking 40/50...  (0 transitives;  0 primitives) 
Checking 41/50...  (0 transitives;  0 primitives) 
Checking 42/50...  (0 transitives;  0 primitives) 
Checking 43/50...  (0 transitives;  0 primitives) 
Checking 44/50...  (0 transitives;  0 primitives) 
Checking 45/50...  (0 transitives;  0 primitives) 
Checking 46/50...  (0 transitives;  0 primitives) 
Checking 47/50...  (0 transitives;  0 primitives) 
Checking 48/50...  (0 transitives;  0 primitives) 
Checking 49/50...  (0 transitives;  0 primitives) 
Checking 50/50...  (0 transitives;  0 primitives) 
gap> transitiveConjecture(9);
Checking 1/34...  (0 transitives;  0 primitives) 
Checking 2/34...  (0 transitives;  0 primitives) 
Checking 3/34...  (0 transitives;  0 primitives) 
Checking 4/34...  (0 transitives;  0 primitives) 
Checking 5/34...  (0 transitives;  0 primitives) 
Checking 6/34...  (0 transitives;  0 primitives) 
Checking 7/34...  (0 transitives;  0 primitives) 
Checking 8/34...  (0 transitives;  0 primitives) 
Checking 9/34...  (0 transitives;  0 primitives) 
Checking 10/34...  (0 transitives;  0 primitives) 
Checking 11/34...  (0 transitives;  0 primitives) 
Checking 12/34...  (0 transitives;  0 primitives) 
Checking 13/34...  (0 transitives;  0 primitives) 
Checking 14/34...  (0 transitives;  0 primitives) 
Checking 15/34...  (0 transitives;  0 primitives) 
Checking 16/34...  (0 transitives;  0 primitives) 
Checking 17/34...  (0 transitives;  0 primitives) 
Checking 18/34...  (0 transitives;  0 primitives) 
Checking 19/34...  (0 transitives;  0 primitives) 
Checking 20/34...  (0 transitives;  0 primitives) 
Checking 21/34...  (0 transitives;  0 primitives) 
Checking 22/34...  (0 transitives;  0 primitives) 
Checking 23/34...  (0 transitives;  0 primitives) 
Checking 24/34...  (0 transitives;  0 primitives) 
Checking 25/34...  (0 transitives;  0 primitives) 
Checking 26/34...  (0 transitives;  0 primitives) 
Checking 27/34...  (0 transitives;  0 primitives) 
Checking 28/34...  (0 transitives;  0 primitives) 
Checking 29/34...  (0 transitives;  0 primitives) 
Checking 30/34...  (0 transitives;  0 primitives) 
Checking 31/34...  (0 transitives;  0 primitives) 
Checking 32/34...  (0 transitives;  0 primitives) 
Checking 33/34...  (0 transitives;  0 primitives) 
Checking 34/34...  (0 transitives;  0 primitives) 
gap> transitiveConjecture(10);
Checking 1/45...  (0 transitives;  0 primitives) 
Checking 2/45...  (0 transitives;  0 primitives) 
Checking 3/45...  (0 transitives;  0 primitives) 
Checking 4/45...  (0 transitives;  0 primitives) 
Checking 5/45...  (0 transitives;  0 primitives) 
Checking 6/45...  (0 transitives;  0 primitives) 
Checking 7/45...  (0 transitives;  0 primitives) 
Checking 8/45...  (0 transitives;  0 primitives) 
Checking 9/45...  (0 transitives;  0 primitives) 
Checking 10/45...  (0 transitives;  0 primitives) 
Checking 11/45...  (0 transitives;  0 primitives) 
Checking 12/45...  (0 transitives;  0 primitives) 
Checking 13/45...  (0 transitives;  0 primitives) 
Checking 14/45...  (0 transitives;  0 primitives) 
Checking 15/45...  (0 transitives;  0 primitives) 
Checking 16/45...  (0 transitives;  0 primitives) 
Checking 17/45...  (0 transitives;  0 primitives) 
Checking 18/45...  (0 transitives;  0 primitives) 
Checking 19/45...  (0 transitives;  0 primitives) 
Checking 20/45...  (0 transitives;  0 primitives) 
Checking 21/45...  (0 transitives;  0 primitives) 
Checking 22/45...  (0 transitives;  0 primitives) 
Checking 23/45...  (0 transitives;  0 primitives) 
Checking 24/45...  (0 transitives;  0 primitives) 
Checking 25/45...  (0 transitives;  0 primitives) 
Checking 26/45...  (0 transitives;  0 primitives) 
Checking 27/45...  (0 transitives;  0 primitives) 
Checking 28/45...  (0 transitives;  0 primitives) 
Checking 29/45...  (0 transitives;  0 primitives) 
Checking 30/45...  (0 transitives;  0 primitives) 
Checking 31/45...  (0 transitives;  0 primitives) 
Checking 32/45...  (0 transitives;  0 primitives) 
Checking 33/45...  (0 transitives;  0 primitives) 
Checking 34/45...  (0 transitives;  0 primitives) 
Checking 35/45...  (0 transitives;  0 primitives) 
Checking 36/45...  (0 transitives;  0 primitives) 
Checking 37/45...  (0 transitives;  0 primitives) 
Checking 38/45...  (0 transitives;  0 primitives) 
Checking 39/45...  (0 transitives;  0 primitives) 
Checking 40/45...  (0 transitives;  0 primitives) 
Checking 41/45...  (0 transitives;  0 primitives) 
Checking 42/45...  (0 transitives;  0 primitives) 
Checking 43/45...  (0 transitives;  0 primitives) 
Checking 44/45...  (0 transitives;  0 primitives) 
Checking 45/45...  (0 transitives;  0 primitives) 
gap> transitiveConjecture(11);
Checking 1/8...  (0 transitives;  0 primitives) 
Checking 2/8...  (0 transitives;  0 primitives) 
Checking 3/8...  (0 transitives;  0 primitives) 
Checking 4/8...  (0 transitives;  0 primitives) 
Checking 5/8...  (0 transitives;  0 primitives) 
Checking 6/8...  (0 transitives;  0 primitives) 
Checking 7/8...  (0 transitives;  0 primitives) 
Checking 8/8...  (0 transitives;  0 primitives) 
gap> transitiveConjecture(12);
Checking 1/301...  (0 transitives;  0 primitives) 
Checking 2/301...  (0 transitives;  0 primitives) 
Checking 3/301...  (0 transitives;  0 primitives) 
Checking 4/301...  (0 transitives;  0 primitives) 
Checking 5/301...  (0 transitives;  0 primitives) 
Checking 6/301...  (0 transitives;  0 primitives) 
Checking 7/301...  (0 transitives;  0 primitives) 
Checking 8/301...  (0 transitives;  0 primitives) 
Checking 9/301...  (0 transitives;  0 primitives) 
Checking 10/301...  (0 transitives;  0 primitives) 
Checking 11/301...  (0 transitives;  0 primitives) 
Checking 12/301...  (0 transitives;  0 primitives) 
Checking 13/301...  (0 transitives;  0 primitives) 
Checking 14/301...  (0 transitives;  0 primitives) 
Checking 15/301...  (0 transitives;  0 primitives) 
Checking 16/301...  (0 transitives;  0 primitives) 
Checking 17/301...  (0 transitives;  0 primitives) 
Checking 18/301...  (0 transitives;  0 primitives) 
Checking 19/301...  (0 transitives;  0 primitives) 
Checking 20/301...  (0 transitives;  0 primitives) 
Checking 21/301...  (0 transitives;  0 primitives) 
Checking 22/301...  (0 transitives;  0 primitives) 
Checking 23/301...  (0 transitives;  0 primitives) 
Checking 24/301...  (0 transitives;  0 primitives) 
Checking 25/301...  (0 transitives;  0 primitives) 
Checking 26/301...  (0 transitives;  0 primitives) 
Checking 27/301...  (0 transitives;  0 primitives) 
Checking 28/301...  (0 transitives;  0 primitives) 
Checking 29/301...  (0 transitives;  0 primitives) 
Checking 30/301...  (0 transitives;  0 primitives) 
Checking 31/301...  (0 transitives;  0 primitives) 
Checking 32/301...  (0 transitives;  0 primitives) 
Checking 33/301...  (0 transitives;  0 primitives) 
Checking 34/301...  (0 transitives;  0 primitives) 
Checking 35/301...  (0 transitives;  0 primitives) 
Checking 36/301...  (0 transitives;  0 primitives) 
Checking 37/301...  (0 transitives;  0 primitives) 
Checking 38/301...  (0 transitives;  0 primitives) 
Checking 39/301...  (0 transitives;  0 primitives) 
Checking 40/301...  (0 transitives;  0 primitives) 
Checking 41/301...  (0 transitives;  0 primitives) 
Checking 42/301...  (0 transitives;  0 primitives) 
Checking 43/301...  (0 transitives;  0 primitives) 
Checking 44/301...  (0 transitives;  0 primitives) 
Checking 45/301...  (0 transitives;  0 primitives) 
Checking 46/301...  (0 transitives;  0 primitives) 
Checking 47/301...  (0 transitives;  0 primitives) 
Checking 48/301...  (0 transitives;  0 primitives) 
Checking 49/301...  (0 transitives;  0 primitives) 
Checking 50/301...  (0 transitives;  0 primitives) 
Checking 51/301...  (0 transitives;  0 primitives) 
Checking 52/301...  (0 transitives;  0 primitives) 
Checking 53/301...  (0 transitives;  0 primitives) 
Checking 54/301...  (0 transitives;  0 primitives) 
Checking 55/301...  (0 transitives;  0 primitives) 
Checking 56/301...  (0 transitives;  0 primitives) 
Checking 57/301...  (0 transitives;  0 primitives) 
Checking 58/301...  (0 transitives;  0 primitives) 
Checking 59/301...  (0 transitives;  0 primitives) 
Checking 60/301...  (0 transitives;  0 primitives) 
Checking 61/301...  (0 transitives;  0 primitives) 
Checking 62/301...  (0 transitives;  0 primitives) 
Checking 63/301...  (0 transitives;  0 primitives) 
Checking 64/301...  (0 transitives;  0 primitives) 
Checking 65/301...  (0 transitives;  0 primitives) 
Checking 66/301...  (0 transitives;  0 primitives) 
Checking 67/301...  (0 transitives;  0 primitives) 
Checking 68/301...  (0 transitives;  0 primitives) 
Checking 69/301...  (0 transitives;  0 primitives) 
Checking 70/301...  (0 transitives;  0 primitives) 
Checking 71/301...  (0 transitives;  0 primitives) 
Checking 72/301...  (0 transitives;  0 primitives) 
Checking 73/301...  (0 transitives;  0 primitives) 
Checking 74/301...  (0 transitives;  0 primitives) 
Checking 75/301...  (0 transitives;  0 primitives) 
Checking 76/301...  (0 transitives;  0 primitives) 
Checking 77/301...  (0 transitives;  0 primitives) 
Checking 78/301...  (0 transitives;  0 primitives) 
Checking 79/301...  (0 transitives;  0 primitives) 
Checking 80/301...  (0 transitives;  0 primitives) 
Checking 81/301...  (0 transitives;  0 primitives) 
Checking 82/301...  (0 transitives;  0 primitives) 
Checking 83/301...  (0 transitives;  0 primitives) 
Checking 84/301...  (0 transitives;  0 primitives) 
Checking 85/301...  (0 transitives;  0 primitives) 
Checking 86/301...  (0 transitives;  0 primitives) 
Checking 87/301...  (0 transitives;  0 primitives) 
Checking 88/301...  (0 transitives;  0 primitives) 
Checking 89/301...  (0 transitives;  0 primitives) 
Checking 90/301...  (0 transitives;  0 primitives) 
Checking 91/301...  (0 transitives;  0 primitives) 
Checking 92/301...  (0 transitives;  0 primitives) 
Checking 93/301...  (0 transitives;  0 primitives) 
Checking 94/301...  (0 transitives;  0 primitives) 
Checking 95/301...  (0 transitives;  0 primitives) 
Checking 96/301...  (0 transitives;  0 primitives) 
Checking 97/301...  (0 transitives;  0 primitives) 
Checking 98/301...  (0 transitives;  0 primitives) 
Checking 99/301...  (0 transitives;  0 primitives) 
Checking 100/301...  (0 transitives;  0 primitives) 
Checking 101/301...  (0 transitives;  0 primitives) 
Checking 102/301...  (0 transitives;  0 primitives) 
Checking 103/301...  (0 transitives;  0 primitives) 
Checking 104/301...  (0 transitives;  0 primitives) 
Checking 105/301...  (0 transitives;  0 primitives) 
Checking 106/301...  (0 transitives;  0 primitives) 
Checking 107/301...  (0 transitives;  0 primitives) 
Checking 108/301...  (0 transitives;  0 primitives) 
Checking 109/301...  (0 transitives;  0 primitives) 
Checking 110/301...  (0 transitives;  0 primitives) 
Checking 111/301...  (0 transitives;  0 primitives) 
Checking 112/301...  (0 transitives;  0 primitives) 
Checking 113/301...  (0 transitives;  0 primitives) 
Checking 114/301...  (0 transitives;  0 primitives) 
Checking 115/301...  (0 transitives;  0 primitives) 
Checking 116/301...  (0 transitives;  0 primitives) 
Checking 117/301...  (0 transitives;  0 primitives) 
Checking 118/301...  (0 transitives;  0 primitives) 
Checking 119/301...  (0 transitives;  0 primitives) 
Checking 120/301...  (0 transitives;  0 primitives) 
Checking 121/301...  (0 transitives;  0 primitives) 
Checking 122/301...  (0 transitives;  0 primitives) 
Checking 123/301...  (0 transitives;  0 primitives) 
Checking 124/301...  (0 transitives;  0 primitives) 
Checking 125/301...  (0 transitives;  0 primitives) 
Checking 126/301...  (0 transitives;  0 primitives) 
Checking 127/301...  (0 transitives;  0 primitives) 
Checking 128/301...  (0 transitives;  0 primitives) 
Checking 129/301...  (0 transitives;  0 primitives) 
Checking 130/301...  (0 transitives;  0 primitives) 
Checking 131/301...  (0 transitives;  0 primitives) 
Checking 132/301...  (0 transitives;  0 primitives) 
Checking 133/301...  (0 transitives;  0 primitives) 
Checking 134/301...  (0 transitives;  0 primitives) 
Checking 135/301...  (0 transitives;  0 primitives) 
Checking 136/301...  (0 transitives;  0 primitives) 
Checking 137/301...  (0 transitives;  0 primitives) 
Checking 138/301...  (0 transitives;  0 primitives) 
Checking 139/301...  (0 transitives;  0 primitives) 
Checking 140/301...  (0 transitives;  0 primitives) 
Checking 141/301...  (0 transitives;  0 primitives) 
Checking 142/301...  (0 transitives;  0 primitives) 
Checking 143/301...  (0 transitives;  0 primitives) 
Checking 144/301...  (0 transitives;  0 primitives) 
Checking 145/301...  (0 transitives;  0 primitives) 
Checking 146/301...  (0 transitives;  0 primitives) 
Checking 147/301...  (0 transitives;  0 primitives) 
Checking 148/301...  (0 transitives;  0 primitives) 
Checking 149/301...  (0 transitives;  0 primitives) 
Checking 150/301...  (0 transitives;  0 primitives) 
Checking 151/301...  (0 transitives;  0 primitives) 
Checking 152/301...  (0 transitives;  0 primitives) 
Checking 153/301...  (0 transitives;  0 primitives) 
Checking 154/301...  (0 transitives;  0 primitives) 
Checking 155/301...  (0 transitives;  0 primitives) 
Checking 156/301...  (0 transitives;  0 primitives) 
Checking 157/301...  (0 transitives;  0 primitives) 
Checking 158/301...  (0 transitives;  0 primitives) 
Checking 159/301...  (0 transitives;  0 primitives) 
Checking 160/301...  (0 transitives;  0 primitives) 
Checking 161/301...  (0 transitives;  0 primitives) 
Checking 162/301...  (0 transitives;  0 primitives) 
Checking 163/301...  (0 transitives;  0 primitives) 
Checking 164/301...  (0 transitives;  0 primitives) 
Checking 165/301...  (0 transitives;  0 primitives) 
Checking 166/301...  (0 transitives;  0 primitives) 
Checking 167/301...  (0 transitives;  0 primitives) 
Checking 168/301...  (0 transitives;  0 primitives) 
Checking 169/301...  (0 transitives;  0 primitives) 
Checking 170/301...  (0 transitives;  0 primitives) 
Checking 171/301...  (0 transitives;  0 primitives) 
Checking 172/301...  (0 transitives;  0 primitives) 
Checking 173/301...  (0 transitives;  0 primitives) 
Checking 174/301...  (0 transitives;  0 primitives) 
Checking 175/301...  (0 transitives;  0 primitives) 
Checking 176/301...  (0 transitives;  0 primitives) 
Checking 177/301...  (0 transitives;  0 primitives) 
Checking 178/301...  (0 transitives;  0 primitives) 
Checking 179/301...  (0 transitives;  0 primitives) 
Checking 180/301...  (0 transitives;  0 primitives) 
Checking 181/301...  (0 transitives;  0 primitives) 
Checking 182/301...  (0 transitives;  0 primitives) 
Checking 183/301...  (0 transitives;  0 primitives) 
Checking 184/301...  (0 transitives;  0 primitives) 
Checking 185/301...  (0 transitives;  0 primitives) 
Checking 186/301...  (0 transitives;  0 primitives) 
Checking 187/301...  (0 transitives;  0 primitives) 
Checking 188/301...  (0 transitives;  0 primitives) 
Checking 189/301...  (0 transitives;  0 primitives) 
Checking 190/301...  (0 transitives;  0 primitives) 
Checking 191/301...  (0 transitives;  0 primitives) 
Checking 192/301...  (0 transitives;  0 primitives) 
Checking 193/301...  (0 transitives;  0 primitives) 
Checking 194/301...  (0 transitives;  0 primitives) 
Checking 195/301...  (0 transitives;  0 primitives) 
Checking 196/301...  (0 transitives;  0 primitives) 
Checking 197/301...  (0 transitives;  0 primitives) 
Checking 198/301...  (0 transitives;  0 primitives) 
Checking 199/301...  (0 transitives;  0 primitives) 
Checking 200/301...  (0 transitives;  0 primitives) 
Checking 201/301...  (0 transitives;  0 primitives) 
Checking 202/301...  (0 transitives;  0 primitives) 
Checking 203/301...  (0 transitives;  0 primitives) 
Checking 204/301...  (0 transitives;  0 primitives) 
Checking 205/301...  (0 transitives;  0 primitives) 
Checking 206/301...  (0 transitives;  0 primitives) 
Checking 207/301...  (0 transitives;  0 primitives) 
Checking 208/301...  (0 transitives;  0 primitives) 
Checking 209/301...  (0 transitives;  0 primitives) 
Checking 210/301...  (0 transitives;  0 primitives) 
Checking 211/301...  (0 transitives;  0 primitives) 
Checking 212/301...  (0 transitives;  0 primitives) 
Checking 213/301...  (0 transitives;  0 primitives) 
Checking 214/301...  (0 transitives;  0 primitives) 
Checking 215/301...  (0 transitives;  0 primitives) 
Checking 216/301...  (0 transitives;  0 primitives) 
Checking 217/301...  (0 transitives;  0 primitives) 
Checking 218/301...  (0 transitives;  0 primitives) 
Checking 219/301...  (0 transitives;  0 primitives) 
Checking 220/301...  (0 transitives;  0 primitives) 
Checking 221/301...  (0 transitives;  0 primitives) 
Checking 222/301...  (0 transitives;  0 primitives) 
Checking 223/301...  (0 transitives;  0 primitives) 
Checking 224/301...  (0 transitives;  0 primitives) 
Checking 225/301...  (0 transitives;  0 primitives) 
Checking 226/301...  (0 transitives;  0 primitives) 
Checking 227/301...  (0 transitives;  0 primitives) 
Checking 228/301...  (0 transitives;  0 primitives) 
Checking 229/301...  (0 transitives;  0 primitives) 
Checking 230/301...  (0 transitives;  0 primitives) 
Checking 231/301...  (0 transitives;  0 primitives) 
Checking 232/301...  (0 transitives;  0 primitives) 
Checking 233/301...  (0 transitives;  0 primitives) 
Checking 234/301...  (0 transitives;  0 primitives) 
Checking 235/301...  (0 transitives;  0 primitives) 
Checking 236/301...  (0 transitives;  0 primitives) 
Checking 237/301...  (0 transitives;  0 primitives) 
Checking 238/301...  (0 transitives;  0 primitives) 
Checking 239/301...  (0 transitives;  0 primitives) 
Checking 240/301...  (0 transitives;  0 primitives) 
Checking 241/301...  (0 transitives;  0 primitives) 
Checking 242/301...  (0 transitives;  0 primitives) 
Checking 243/301...  (0 transitives;  0 primitives) 
Checking 244/301...  (0 transitives;  0 primitives) 
Checking 245/301...  (0 transitives;  0 primitives) 
Checking 246/301...  (0 transitives;  0 primitives) 
Checking 247/301...  (0 transitives;  0 primitives) 
Checking 248/301...  (0 transitives;  0 primitives) 
Checking 249/301...  (0 transitives;  0 primitives) 
Checking 250/301...  (0 transitives;  0 primitives) 
Checking 251/301...  (0 transitives;  0 primitives) 
Checking 252/301...  (0 transitives;  0 primitives) 
Checking 253/301...  (0 transitives;  0 primitives) 
Checking 254/301...  (0 transitives;  0 primitives) 
Checking 255/301...  (0 transitives;  0 primitives) 
Checking 256/301...  (0 transitives;  0 primitives) 
Checking 257/301...  (0 transitives;  0 primitives) 
Checking 258/301...  (0 transitives;  0 primitives) 
Checking 259/301...  (0 transitives;  0 primitives) 
Checking 260/301...  (0 transitives;  0 primitives) 
Checking 261/301...  (0 transitives;  0 primitives) 
Checking 262/301...  (0 transitives;  0 primitives) 
Checking 263/301...  (0 transitives;  0 primitives) 
Checking 264/301...  (0 transitives;  0 primitives) 
Checking 265/301...  (0 transitives;  0 primitives) 
Checking 266/301...  (0 transitives;  0 primitives) 
Checking 267/301...  (0 transitives;  0 primitives) 
Checking 268/301...  (0 transitives;  0 primitives) 
Checking 269/301...  (0 transitives;  0 primitives) 
Checking 270/301...  (0 transitives;  0 primitives) 
Checking 271/301...  (0 transitives;  0 primitives) 
Checking 272/301...  (0 transitives;  0 primitives) 
Checking 273/301...  (0 transitives;  0 primitives) 
Checking 274/301...  (0 transitives;  0 primitives) 
Checking 275/301...  (0 transitives;  0 primitives) 
Checking 276/301...  (0 transitives;  0 primitives) 
Checking 277/301...  (0 transitives;  0 primitives) 
Checking 278/301...  (0 transitives;  0 primitives) 
Checking 279/301...  (0 transitives;  0 primitives) 
Checking 280/301...  (0 transitives;  0 primitives) 
Checking 281/301...  (0 transitives;  0 primitives) 
Checking 282/301...  (0 transitives;  0 primitives) 
Checking 283/301...  (0 transitives;  0 primitives) 
Checking 284/301...  (0 transitives;  0 primitives) 
Checking 285/301...  (0 transitives;  0 primitives) 
Checking 286/301...  (0 transitives;  0 primitives) 
Checking 287/301...  (0 transitives;  0 primitives) 
Checking 288/301...  (0 transitives;  0 primitives) 
Checking 289/301...  (0 transitives;  0 primitives) 
Checking 290/301...  (0 transitives;  0 primitives) 
Checking 291/301...  (0 transitives;  0 primitives) 
Checking 292/301...  (0 transitives;  0 primitives) 
Checking 293/301...  (0 transitives;  0 primitives) 
Checking 294/301...  (0 transitives;  0 primitives) 
Checking 295/301...  (0 transitives;  0 primitives) 
Checking 296/301...  (0 transitives;  0 primitives) 
Checking 297/301...  (0 transitives;  0 primitives) 
Checking 298/301...  (0 transitives;  0 primitives) 
Checking 299/301...  (0 transitives;  0 primitives) 
Checking 300/301...  (0 transitives;  0 primitives) 
Checking 301/301...  (0 transitives;  0 primitives) 
gap> Read("../ConjectureTransGroups.gap");
gap> transMaxSubgroups(6);
Checking 1/16...  (0 transitives;  0 primitives) 
Checking 2/16...  (0 transitives;  0 primitives) 
Checking 3/16...  (0 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,3);  max subgroup: 2
       K = C6 < D12 = G
Found a maximal transitive subgroup of TransitiveGroup(6,3);  max subgroup: 3
       K = S3 < D12 = G
Checking 4/16...  (2 transitives;  0 primitives) 
Checking 5/16...  (2 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,5);  max subgroup: 2
       K = S3 < C3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,5);  max subgroup: 3
       K = C6 < C3 x S3 = G
Checking 6/16...  (4 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,6);  max subgroup: 1
       K = A4 < C2 x A4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,6);  max subgroup: 3
       K = C6 < C2 x A4 = G
Checking 7/16...  (6 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,7);  max subgroup: 1
       K = A4 < S4 = G
Checking 8/16...  (7 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,8);  max subgroup: 1
       K = A4 < S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,8);  max subgroup: 3
       K = S3 < S4 = G
Checking 9/16...  (9 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 1
       K = C3 x S3 < S3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 3
       K = C3 x S3 < S3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 4
       K = D12 < S3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 5
       K = D12 < S3 x S3 = G
Checking 10/16...  (13 transitives;  0 primitives) 
Checking 11/16...  (13 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 1
       K = S4 < C2 x S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 2
       K = C2 x A4 < C2 x S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 3
       K = S4 < C2 x S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 5
       K = D12 < C2 x S4 = G
Checking 12/16...  (17 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,12);  max subgroup: 2
       K = D10 < A5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,12);  max subgroup: 3
       K = A4 < A5 = G
Checking 13/16...  (19 transitives;  1 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,13);  max subgroup: 1
       K = S3 x S3 < (S3 x S3) : C2 = G
Found a maximal transitive subgroup of TransitiveGroup(6,13);  max subgroup: 3
       K = (C3 x C3) : C4 < (S3 x S3) : C2 = G
Checking 14/16...  (21 transitives;  1 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 1
       K = D12 < S5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 2
       K = C5 : C4 < S5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 3
       K = S4 < S5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 4
       K = A5 < S5 = G
Checking 15/16...  (25 transitives;  3 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 2
       K = A5 < A6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 3
       K = S4 < A6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 4
       K = (C3 x C3) : C4 < A6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 5
       K = A5 < A6 = G
Checking 16/16...  (29 transitives;  5 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 1
       K = A6 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 3
       K = S5 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 4
       K = C2 x S4 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 5
       K = (S3 x S3) : C2 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 6
       K = S5 < S6 = G
gap> PointerButtonDown(0,401,515,1);
gap> PointerButtonDown(0,400,29,1);
gap> MenuSelected( 0, 2, 12 );
#I  Intermediate Subgroups (G,2) --> (14,31,13,18,17,36,37,40,48,49,50,51)
gap> Read("../ConjectureTransGroups.gap");
gap> transMaxSubgroups(6);
Checking 1/16...  (0 transitives;  0 primitives) 
Checking 2/16...  (0 transitives;  0 primitives) 
Checking 3/16...  (0 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,3);  max subgroup: 2
       K = C6 < D12 = G
Found a maximal transitive subgroup of TransitiveGroup(6,3);  max subgroup: 3
       K = S3 < D12 = G
Checking 4/16...  (2 transitives;  0 primitives) 
Checking 5/16...  (2 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,5);  max subgroup: 2
       K = S3 < C3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,5);  max subgroup: 3
       K = C6 < C3 x S3 = G
Checking 6/16...  (4 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,6);  max subgroup: 1
       K = A4 < C2 x A4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,6);  max subgroup: 3
       K = C6 < C2 x A4 = G
Checking 7/16...  (6 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,7);  max subgroup: 1
       K = A4 < S4 = G
Checking 8/16...  (7 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,8);  max subgroup: 1
       K = A4 < S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,8);  max subgroup: 3
       K = S3 < S4 = G
Checking 9/16...  (9 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 1
       K = C3 x S3 < S3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 3
       K = C3 x S3 < S3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 4
       K = D12 < S3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 5
       K = D12 < S3 x S3 = G
Checking 10/16...  (13 transitives;  0 primitives) 
Checking 11/16...  (13 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 1
       K = S4 < C2 x S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 2
       K = C2 x A4 < C2 x S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 3
       K = S4 < C2 x S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 5
       K = D12 < C2 x S4 = G
Checking 12/16...  (17 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,12);  max subgroup: 2
       K = D10 < A5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,12);  max subgroup: 3
       K = A4 < A5 = G
Checking 13/16...  (19 transitives;  1 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,13);  max subgroup: 1
       K = S3 x S3 < (S3 x S3) : C2 = G
Found a maximal transitive subgroup of TransitiveGroup(6,13);  max subgroup: 3
       K = (C3 x C3) : C4 < (S3 x S3) : C2 = G
Checking 14/16...  (21 transitives;  1 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 1
       K = D12 < S5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 2
       K = C5 : C4 < S5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 3
       K = S4 < S5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 4
       K = A5 < S5 = G
Checking 15/16...  (25 transitives;  3 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 2
       K = A5 < A6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 3
       K = S4 < A6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 4
       K = (C3 x C3) : C4 < A6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 5
       K = A5 < A6 = G
Checking 16/16...  (29 transitives;  5 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 1
       K = A6 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 3
       K = S5 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 4
       K = C2 x S4 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 5
       K = (S3 x S3) : C2 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 6
       K = S5 < S6 = G
gap> transMaxSubgroups(6);
Checking 1/16...  (0 transitives;  0 primitives) 
Checking 2/16...  (0 transitives;  0 primitives) 
Checking 3/16...  (0 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,3);  max subgroup: 2
       K = C6 < D12 = G
Found a maximal transitive subgroup of TransitiveGroup(6,3);  max subgroup: 3
       K = S3 < D12 = G
Checking 4/16...  (2 transitives;  0 primitives) 
Checking 5/16...  (2 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,5);  max subgroup: 2
       K = S3 < C3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,5);  max subgroup: 3
       K = C6 < C3 x S3 = G
Checking 6/16...  (4 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,6);  max subgroup: 1
       K = A4 < C2 x A4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,6);  max subgroup: 3
       K = C6 < C2 x A4 = G
Checking 7/16...  (6 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,7);  max subgroup: 1
       K = A4 < S4 = G
Checking 8/16...  (7 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,8);  max subgroup: 1
       K = A4 < S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,8);  max subgroup: 3
       K = S3 < S4 = G
Checking 9/16...  (9 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 1
       K = C3 x S3 < S3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 3
       K = C3 x S3 < S3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 4
       K = D12 < S3 x S3 = G
Found a maximal transitive subgroup of TransitiveGroup(6,9);  max subgroup: 5
       K = D12 < S3 x S3 = G
Checking 10/16...  (13 transitives;  0 primitives) 
Checking 11/16...  (13 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 1
       K = S4 < C2 x S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 2
       K = C2 x A4 < C2 x S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 3
       K = S4 < C2 x S4 = G
Found a maximal transitive subgroup of TransitiveGroup(6,11);  max subgroup: 5
       K = D12 < C2 x S4 = G
Checking 12/16...  (17 transitives;  0 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,12);  max subgroup: 2
       K = D10 < A5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,12);  max subgroup: 3
       K = A4 < A5 = G
Checking 13/16...  (19 transitives;  1 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,13);  max subgroup: 1
       K = S3 x S3 < (S3 x S3) : C2 = G
Found a maximal transitive subgroup of TransitiveGroup(6,13);  max subgroup: 3
       K = (C3 x C3) : C4 < (S3 x S3) : C2 = G
Checking 14/16...  (21 transitives;  1 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 1
       K = D12 < S5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 2
       K = C5 : C4 < S5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 3
       K = S4 < S5 = G
Found a maximal transitive subgroup of TransitiveGroup(6,14);  max subgroup: 4
       K = A5 < S5 = G
Checking 15/16...  (25 transitives;  3 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 2
       K = A5 < A6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 3
       K = S4 < A6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 4
       K = (C3 x C3) : C4 < A6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,15);  max subgroup: 5
       K = A5 < A6 = G
Checking 16/16...  (29 transitives;  5 primitives) 
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 1
       K = A6 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 3
       K = S5 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 4
       K = C2 x S4 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 5
       K = (S3 x S3) : C2 < S6 = G
Found a maximal transitive subgroup of TransitiveGroup(6,16);  max subgroup: 6
       K = S5 < S6 = G
gap> Read("../ConjectureTransGroups.gap");
gap> transMaxSubgroups(6);
Checking 1/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 2/16...  (0 transitive;  0 primitive;  2 normal) 
Checking 3/16...  (0 transitive;  0 primitive;  3 normal) 
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 2
       K = C6 < D12 = G
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 3
       K = S3 < D12 = G
Checking 4/16...  (2 transitive;  0 primitive;  6 normal) 
Checking 5/16...  (2 transitive;  0 primitive;  7 normal) 
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 2
       K = S3 < C3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 3
       K = C6 < C3 x S3 = G
Checking 6/16...  (4 transitive;  0 primitive;  9 normal) 
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 1
       K = A4 < C2 x A4 = G
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 3
       K = C6 < C2 x A4 = G
Checking 7/16...  (6 transitive;  0 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,7);  max subgroup: 1
       K = A4 < S4 = G
Checking 8/16...  (7 transitive;  0 primitive;  12 normal) 
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 1
       K = A4 < S4 = G
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 3
       K = S3 < S4 = G
Checking 9/16...  (9 transitive;  0 primitive;  13 normal) 
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 1
       K = C3 x S3 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 3
       K = C3 x S3 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 4
       K = D12 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 5
       K = D12 < S3 x S3 = G
Checking 10/16...  (13 transitive;  0 primitive;  16 normal) 
Checking 11/16...  (13 transitive;  0 primitive;  17 normal) 
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 1
       K = S4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 2
       K = C2 x A4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 3
       K = S4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 5
       K = D12 < C2 x S4 = G
Checking 12/16...  (17 transitive;  0 primitive;  20 normal) 
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 2
       K = D10 < A5 = G
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 3
       K = A4 < A5 = G
Checking 13/16...  (19 transitive;  1 primitive;  20 normal) 
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 1
       K = S3 x S3 < (S3 x S3) : C2 = G
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 3
       K = (C3 x C3) : C4 < (S3 x S3) : C2 = G
Checking 14/16...  (21 transitive;  1 primitive;  23 normal) 
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 1
       K = D12 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 2
       K = C5 : C4 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 3
       K = S4 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 4
       K = A5 < S5 = G
Checking 15/16...  (25 transitive;  3 primitive;  24 normal) 
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 2
       K = A5 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 3
       K = S4 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 4
       K = (C3 x C3) : C4 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 5
       K = A5 < A6 = G
Checking 16/16...  (29 transitive;  5 primitive;  24 normal) 
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 1
       K = A6 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 3
       K = S5 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 4
       K = C2 x S4 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 5
       K = (S3 x S3) : C2 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 6
       K = S5 < S6 = G
gap> 
gap> 
gap> 
gap> 
gap> 
gap> 
gap> 
gap> transMaxSubgroups(6);
Checking 1/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 2/16...  (0 transitive;  0 primitive;  2 normal) 
Checking 3/16...  (0 transitive;  0 primitive;  3 normal) 
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 2
       K = C6 < D12 = G
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 3
       K = S3 < D12 = G
Checking 4/16...  (2 transitive;  0 primitive;  6 normal) 
Checking 5/16...  (2 transitive;  0 primitive;  7 normal) 
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 2
       K = S3 < C3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 3
       K = C6 < C3 x S3 = G
Checking 6/16...  (4 transitive;  0 primitive;  9 normal) 
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 1
       K = A4 < C2 x A4 = G
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 3
       K = C6 < C2 x A4 = G
Checking 7/16...  (6 transitive;  0 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,7);  max subgroup: 1
       K = A4 < S4 = G
Checking 8/16...  (7 transitive;  0 primitive;  12 normal) 
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 1
       K = A4 < S4 = G
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 3
       K = S3 < S4 = G
Checking 9/16...  (9 transitive;  0 primitive;  13 normal) 
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 1
       K = C3 x S3 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 3
       K = C3 x S3 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 4
       K = D12 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 5
       K = D12 < S3 x S3 = G
Checking 10/16...  (13 transitive;  0 primitive;  16 normal) 
Checking 11/16...  (13 transitive;  0 primitive;  17 normal) 
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 1
       K = S4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 2
       K = C2 x A4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 3
       K = S4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 5
       K = D12 < C2 x S4 = G
Checking 12/16...  (17 transitive;  0 primitive;  20 normal) 
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 2
       K = D10 < A5 = G
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 3
       K = A4 < A5 = G
Checking 13/16...  (19 transitive;  1 primitive;  20 normal) 
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 1
       K = S3 x S3 < (S3 x S3) : C2 = G
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 3
       K = (C3 x C3) : C4 < (S3 x S3) : C2 = G
Checking 14/16...  (21 transitive;  1 primitive;  23 normal) 
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 1
       K = D12 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 2
       K = C5 : C4 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 3
       K = S4 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 4
       K = A5 < S5 = G
Checking 15/16...  (25 transitive;  3 primitive;  24 normal) 
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 2
       K = A5 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 3
       K = S4 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 4
       K = (C3 x C3) : C4 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 5
       K = A5 < A6 = G
Checking 16/16...  (29 transitive;  5 primitive;  24 normal) 
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 1
       K = A6 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 3
       K = S5 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 4
       K = C2 x S4 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 5
       K = (S3 x S3) : C2 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 6
       K = S5 < S6 = G
gap> Read("../ConjectureTransGroups.gap");
gap> 
gap> 
gap> 
gap> 
gap> 
gap> Read("../ConjectureTransGroups.gap");
gap> transMaxSubgroups(6);
Checking 1/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 2/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 3/16...  (0 transitive;  0 primitive;  0 normal) 
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 2
       K = C6 < D12 = G
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 3
       K = S3 < D12 = G
Checking 4/16...  (2 transitive;  0 primitive;  2 normal) 
Checking 5/16...  (2 transitive;  0 primitive;  2 normal) 
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 2
       K = S3 < C3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 3
       K = C6 < C3 x S3 = G
Checking 6/16...  (4 transitive;  0 primitive;  3 normal) 
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 1
       K = A4 < C2 x A4 = G
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 3
       K = C6 < C2 x A4 = G
Checking 7/16...  (6 transitive;  0 primitive;  4 normal) 
Found maxl trans subgroup of TransitiveGroup(6,7);  max subgroup: 1
       K = A4 < S4 = G
Checking 8/16...  (7 transitive;  0 primitive;  5 normal) 
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 1
       K = A4 < S4 = G
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 3
       K = S3 < S4 = G
Checking 9/16...  (9 transitive;  0 primitive;  6 normal) 
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 1
       K = C3 x S3 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 3
       K = C3 x S3 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 4
       K = D12 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 5
       K = D12 < S3 x S3 = G
Checking 10/16...  (13 transitive;  0 primitive;  8 normal) 
Checking 11/16...  (13 transitive;  0 primitive;  8 normal) 
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 1
       K = S4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 2
       K = C2 x A4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 3
       K = S4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 5
       K = D12 < C2 x S4 = G
Checking 12/16...  (17 transitive;  0 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 2
       K = D10 < A5 = G
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 3
       K = A4 < A5 = G
Checking 13/16...  (19 transitive;  1 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 1
       K = S3 x S3 < (S3 x S3) : C2 = G
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 3
       K = (C3 x C3) : C4 < (S3 x S3) : C2 = G
Checking 14/16...  (21 transitive;  1 primitive;  13 normal) 
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 1
       K = D12 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 2
       K = C5 : C4 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 3
       K = S4 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 4
       K = A5 < S5 = G
Checking 15/16...  (25 transitive;  3 primitive;  14 normal) 
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 2
       K = A5 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 3
       K = S4 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 4
       K = (C3 x C3) : C4 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 5
       K = A5 < A6 = G
Checking 16/16...  (29 transitive;  5 primitive;  14 normal) 
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 1
       K = A6 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 3
       K = S5 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 4
       K = C2 x S4 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 5
       K = (S3 x S3) : C2 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 6
       K = S5 < S6 = G
gap> g:=TransitiveGroup(6,3);
D(6) = S(3)[x]2
gap> StructureDescription(g);
"D12"
gap> L:=GraphicSubgroupLattice(g);
<graphic subgroup lattice "GraphicSubgroupLattice of D(6) = S(3)[x]2">
gap> MenuSelected( 2, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,G)
gap> PointerButtonDown(2,397,151,1);
gap> PointerButtonDown(2,394,453,1);
gap> h:=Stabilizer(g);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `StabilizerOfExternalSet' on 1 arguments called from
StabilizerOfExternalSet( arg[1] ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> h:=Stabilizer(g,1);
Group([ (2,6)(3,5) ])
gap> Index(g,h);
6
gap> InsertVertex(L,h);
[ <vertex of graphic graph, label: "3", Serial:67>, false ]
gap> PointerButtonDown(2,288,465,1);
gap> IntermediateSubgroups(g,h);
rec( subgroups := [ Group([ (2,6)(3,5), (1,4)(2,5)(3,6) ]), Group([ (2,6)(3,5), (1,5,3)(2,6,4) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
gap> ms:=MaximalSubgroupClassReps(g);
[ Group([ (2,6)(3,5), (1,3,5)(2,4,6) ]), Group([ (1,4)(2,5)(3,6), (1,3,5)(2,4,6) ]), 
  Group([ (1,4)(2,3)(5,6), (1,3,5)(2,4,6) ]), Group([ (2,6)(3,5), (1,4)(2,5)(3,6) ]) ]
gap> k1:=ms[3];
Group([ (1,4)(2,3)(5,6), (1,3,5)(2,4,6) ])
gap> StructureDescription(k1);
"S3"
gap> Stabilizer(k1,1);
Group(())
gap> Index(g,k1);
2
gap> InsertVertex(k1);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `InsertVertex' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> InsertVertex(L,k1);
[ <vertex of graphic graph, label: "15", Serial:79>, false ]
gap> PointerButtonDown(2,609,153,1);
gap> PointerButtonDown(2,402,352,1);
gap> PointerButtonDown(2,284,460,1);
gap> h:
Syntax error: ; expected
h:
 ^
gap> h;
Group([ (2,6)(3,5) ])
gap> ConjugacyClassSubgroups(k1);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `ConjugacyClassSubgroups' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> k1;
S3
gap> ConjugacyClassesSubgroups(k1);
[ Group( () )^G, Group( [ (1,4)(2,3)(5,6) ] )^G, Group( [ (1,5,3)(2,6,4) ] )^G, 
  Group( [ (1,5,3)(2,6,4), (1,4)(2,3)(5,6) ] )^G ]
gap> ccsg:=ConjugacyClassesSubgroups(k1);
[ Group( () )^G, Group( [ (1,4)(2,3)(5,6) ] )^G, Group( [ (1,5,3)(2,6,4) ] )^G, 
  Group( [ (1,5,3)(2,6,4), (1,4)(2,3)(5,6) ] )^G ]
gap> x:=(2,6)(3,5);
(2,6)(3,5)
gap> y:=(1,4)(2,3)(5,6);
(1,4)(2,3)(5,6)
gap> y^x;
(1,4)(2,3)(5,6)
gap> y:=(1,5,3)(2,6,4);
(1,5,3)(2,6,4)
gap> y^x;
(1,3,5)(2,4,6)
gap> IsNormal(g,ccsg[2]);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `IsNormal' on 2 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> ccsg[2];
Group( [ (1,4)(2,3)(5,6) ] )^G
gap> Representative(ccsg[2]);
Group([ (1,4)(2,3)(5,6) ])
gap> IsNormal(g,Representative(ccsg[2]));
false
gap> IsNormal(g,Representative(ccsg[3]));
true
gap> s3:=Representative(ccsg[3]);
Group([ (1,5,3)(2,6,4) ])
gap> Order(s3);
3
gap> PointerButtonDown(2,488,249,1);
gap> MenuSelected( 2, 1, 1 );
gap> PointerButtonDown(2,322,173,1);
gap> MenuSelected( 2, 1, 4 );
gap> PointerButtonDown(2,454,258,1);
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(6,3,3);
rec(
  subgroups := [ Group( [ (2,6)(3,5), (1,4)(2,3)(5,6) ] ), Group( [ (2,6)(3,5), (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
rec(
  subgroups := [ Group( [ (1,4)(2,3)(5,6) ] ), Group( [ (1,6)(2,5)(3,4) ] ), Group( [ (1,2)(3,6)(4,5) ] ), 
      Group( [ (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(6,3,3);
rec(
  subgroups := [ Group( [ (2,6)(3,5), (1,4)(2,3)(5,6) ] ), Group( [ (2,6)(3,5), (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
rec(
  subgroups := [ Group( [ (1,4)(2,3)(5,6) ] ), Group( [ (1,6)(2,5)(3,4) ] ), Group( [ (1,2)(3,6)(4,5) ] ), 
      Group( [ (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> PointerButtonDown(3,406,146,1);
gap> PointerButtonDown(3,398,347,1);
gap> PointerButtonDown(3,400,252,1);
gap> PointerButtonDown(3,408,449,1);
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(6,3,3);
rec(
  subgroups := [ Group( [ (2,6)(3,5), (1,4)(2,3)(5,6) ] ), Group( [ (2,6)(3,5), (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
rec(
  subgroups := [ Group( [ (1,4)(2,3)(5,6) ] ), Group( [ (1,6)(2,5)(3,4) ] ), Group( [ (1,2)(3,6)(4,5) ] ), 
      Group( [ (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> PointerButtonDown(4,404,358,1);
gap> PointerButtonDown(4,400,155,1);
gap> n=6;
Variable: 'n' must have a value

gap> n:=6;
6
gap> j:=3;
3
gap> k:=3;
3
gap> G:= TransitiveGroup(n,j);
D(6) = S(3)[x]2
gap>     Gx:=Stabilizer(G,1);
Group([ (2,6)(3,5) ])
gap>     intGxG:=IntermediateSubgroups(G,Gx);
rec( subgroups := [ Group([ (2,6)(3,5), (1,4)(2,3)(5,6) ]), Group([ (2,6)(3,5), (1,5,3)(2,6,4) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
gap>     maxsubs:=MaximalSubgroupClassReps(G);
[ Group([ (2,6)(3,5), (1,3,5)(2,4,6) ]), Group([ (1,4)(2,5)(3,6), (1,3,5)(2,4,6) ]), 
  Group([ (1,4)(2,3)(5,6), (1,3,5)(2,4,6) ]), Group([ (2,6)(3,5), (1,4)(2,5)(3,6) ]) ]
gap>     K:=maxsubs[k];
Group([ (1,4)(2,3)(5,6), (1,3,5)(2,4,6) ])
gap>     StructureDescription(K);
"S3"
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(6,3,3);
rec(
  subgroups := [ Group( [ (2,6)(3,5), (1,4)(2,3)(5,6) ] ), Group( [ (2,6)(3,5), (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
rec(
  subgroups := [ Group( [ (1,4)(2,3)(5,6) ] ), Group( [ (1,6)(2,5)(3,4) ] ), Group( [ (1,2)(3,6)(4,5) ] ), 
      Group( [ (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> PointerButtonDown(5,403,349,1);
gap> PointerButtonDown(5,402,149,1);
gap> PointerButtonDown(5,396,248,1);
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(6,3,3);
rec(
  subgroups := [ Group( [ (2,6)(3,5), (1,4)(2,3)(5,6) ] ), Group( [ (2,6)(3,5), (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
rec(
  subgroups := [ Group( [ (1,4)(2,3)(5,6) ] ), Group( [ (1,6)(2,5)(3,4) ] ), Group( [ (1,2)(3,6)(4,5) ] ), 
      Group( [ (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> PointerButtonDown(6,404,148,1);
gap> PointerButtonDown(6,249,445,1);
gap> PointerButtonDown(6,396,450,1);
gap> PointerButtonDown(6,408,353,1);
gap> PointerButtonDown(6,207,455,1);
gap> PointerButtonDown(6,194,412,1);
gap> transMaxSubgroups(6);
Checking 1/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 2/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 3/16...  (0 transitive;  0 primitive;  0 normal) 
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 2
       K = C6 < D12 = G
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 3
       K = S3 < D12 = G
Checking 4/16...  (2 transitive;  0 primitive;  2 normal) 
Checking 5/16...  (2 transitive;  0 primitive;  2 normal) 
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 2
       K = S3 < C3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 3
       K = C6 < C3 x S3 = G
Checking 6/16...  (4 transitive;  0 primitive;  3 normal) 
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 1
       K = A4 < C2 x A4 = G
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 3
       K = C6 < C2 x A4 = G
Checking 7/16...  (6 transitive;  0 primitive;  4 normal) 
Found maxl trans subgroup of TransitiveGroup(6,7);  max subgroup: 1
       K = A4 < S4 = G
Checking 8/16...  (7 transitive;  0 primitive;  5 normal) 
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 1
       K = A4 < S4 = G
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 3
       K = S3 < S4 = G
Checking 9/16...  (9 transitive;  0 primitive;  6 normal) 
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 1
       K = C3 x S3 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 3
       K = C3 x S3 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 4
       K = D12 < S3 x S3 = G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 5
       K = D12 < S3 x S3 = G
Checking 10/16...  (13 transitive;  0 primitive;  8 normal) 
Checking 11/16...  (13 transitive;  0 primitive;  8 normal) 
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 1
       K = S4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 2
       K = C2 x A4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 3
       K = S4 < C2 x S4 = G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 5
       K = D12 < C2 x S4 = G
Checking 12/16...  (17 transitive;  0 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 2
       K = D10 < A5 = G
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 3
       K = A4 < A5 = G
Checking 13/16...  (19 transitive;  1 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 1
       K = S3 x S3 < (S3 x S3) : C2 = G
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 3
       K = (C3 x C3) : C4 < (S3 x S3) : C2 = G
Checking 14/16...  (21 transitive;  1 primitive;  13 normal) 
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 1
       K = D12 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 2
       K = C5 : C4 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 3
       K = S4 < S5 = G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 4
       K = A5 < S5 = G
Checking 15/16...  (25 transitive;  3 primitive;  14 normal) 
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 2
       K = A5 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 3
       K = S4 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 4
       K = (C3 x C3) : C4 < A6 = G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 5
       K = A5 < A6 = G
Checking 16/16...  (29 transitive;  5 primitive;  14 normal) 
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 1
       K = A6 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 3
       K = S5 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 4
       K = C2 x S4 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 5
       K = (S3 x S3) : C2 < S6 = G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 6
       K = S5 < S6 = G
gap> Read("../ConjectureTransGroups.gap");
Syntax error: fi expected in ../ConjectureTransGroups.gap line 59
                else,                     
                    ^
Syntax error: od expected in ../ConjectureTransGroups.gap line 62
            fi;
             ^
Syntax error: end expected in ../ConjectureTransGroups.gap line 65
    od;
     ^
gap> Read("../ConjectureTransGroups.gap");
gap> transMaxSubgroups(6);
Checking 1/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 2/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 3/16...  (0 transitive;  0 primitive;  0 normal) 
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 2
       K = C6 < D12 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 3
       K = S3 < D12 = G       K is normal in G
Checking 4/16...  (2 transitive;  0 primitive;  2 normal) 
Checking 5/16...  (2 transitive;  0 primitive;  2 normal) 
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 2
       K = S3 < C3 x S3 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 3
       K = C6 < C3 x S3 = G       K is not normal in G
Checking 6/16...  (4 transitive;  0 primitive;  3 normal) 
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 1
       K = A4 < C2 x A4 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 3
       K = C6 < C2 x A4 = G       K is not normal in G
Checking 7/16...  (6 transitive;  0 primitive;  4 normal) 
Found maxl trans subgroup of TransitiveGroup(6,7);  max subgroup: 1
       K = A4 < S4 = G       K is normal in G
Checking 8/16...  (7 transitive;  0 primitive;  5 normal) 
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 1
       K = A4 < S4 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 3
       K = S3 < S4 = G       K is not normal in G
Checking 9/16...  (9 transitive;  0 primitive;  6 normal) 
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 1
       K = C3 x S3 < S3 x S3 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 3
       K = C3 x S3 < S3 x S3 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 4
       K = D12 < S3 x S3 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 5
       K = D12 < S3 x S3 = G       K is not normal in G
Checking 10/16...  (13 transitive;  0 primitive;  8 normal) 
Checking 11/16...  (13 transitive;  0 primitive;  8 normal) 
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 1
       K = S4 < C2 x S4 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 2
       K = C2 x A4 < C2 x S4 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 3
       K = S4 < C2 x S4 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 5
       K = D12 < C2 x S4 = G       K is not normal in G
Checking 12/16...  (17 transitive;  0 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 2
       K = D10 < A5 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 3
       K = A4 < A5 = G       K is not normal in G
Checking 13/16...  (19 transitive;  1 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 1
       K = S3 x S3 < (S3 x S3) : C2 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 3
       K = (C3 x C3) : C4 < (S3 x S3) : C2 = G       K is normal in G
Checking 14/16...  (21 transitive;  1 primitive;  13 normal) 
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 1
       K = D12 < S5 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 2
       K = C5 : C4 < S5 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 3
       K = S4 < S5 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 4
       K = A5 < S5 = G       K is normal in G
Checking 15/16...  (25 transitive;  3 primitive;  14 normal) 
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 2
       K = A5 < A6 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 3
       K = S4 < A6 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 4
       K = (C3 x C3) : C4 < A6 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 5
       K = A5 < A6 = G       K is not normal in G
Checking 16/16...  (29 transitive;  5 primitive;  14 normal) 
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 1
       K = A6 < S6 = G       K is normal in G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 3
       K = S5 < S6 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 4
       K = C2 x S4 < S6 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 5
       K = (S3 x S3) : C2 < S6 = G       K is not normal in G
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 6
       K = S5 < S6 = G       K is not normal in G
gap> testConj(6,8,3);
rec(
  subgroups := [ Group( [ (2,5)(3,6), (2,3,5,6), (1,4)(3,6) ] ) ],
  inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
rec(
  subgroups := [ Group( [ (1,4)(2,3)(5,6) ] ), Group( [ (1,6)(2,5)(3,4) ] ), Group( [ (1,2)(3,6)(4,5) ] ), 
      Group( [ (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> PointerButtonDown(7,391,192,1);
gap> PointerButtonDown(7,403,264,1);
gap> PointerButtonDown(7,395,485,1);
gap> PointerButtonDown(7,397,338,1);
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(6,8,3);
rec(
  subgroups := [ Group( [ (2,5)(3,6), (2,3,5,6), (1,4)(2,5) ] ) ],
  inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
rec(
  subgroups := [ Group( [ (1,4)(2,3)(5,6) ] ), Group( [ (1,6)(2,5)(3,4) ] ), Group( [ (1,2)(3,6)(4,5) ] ), 
      Group( [ (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> transMaxSubgroups(6);
Checking 1/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 2/16...  (0 transitive;  0 primitive;  0 normal) 
Checking 3/16...  (0 transitive;  0 primitive;  0 normal) 
Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 2
 Stab(1) = C2;     K = C6 < D12 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,3);  max subgroup: 3
 Stab(1) = C2;     K = S3 < D12 = G;       K is normal in G

Checking 4/16...  (2 transitive;  0 primitive;  2 normal) 
Checking 5/16...  (2 transitive;  0 primitive;  2 normal) 
Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 2
 Stab(1) = C3;     K = S3 < C3 x S3 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,5);  max subgroup: 3
 Stab(1) = C3;     K = C6 < C3 x S3 = G;       K is not normal in G

Checking 6/16...  (4 transitive;  0 primitive;  3 normal) 
Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 1
 Stab(1) = C2 x C2;     K = A4 < C2 x A4 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,6);  max subgroup: 3
 Stab(1) = C2 x C2;     K = C6 < C2 x A4 = G;       K is not normal in G

Checking 7/16...  (6 transitive;  0 primitive;  4 normal) 
Found maxl trans subgroup of TransitiveGroup(6,7);  max subgroup: 1
 Stab(1) = C2 x C2;     K = A4 < S4 = G;       K is normal in G

Checking 8/16...  (7 transitive;  0 primitive;  5 normal) 
Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 1
 Stab(1) = C4;     K = A4 < S4 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,8);  max subgroup: 3
 Stab(1) = C4;     K = S3 < S4 = G;       K is not normal in G

Checking 9/16...  (9 transitive;  0 primitive;  6 normal) 
Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 1
 Stab(1) = S3;     K = C3 x S3 < S3 x S3 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 3
 Stab(1) = S3;     K = C3 x S3 < S3 x S3 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 4
 Stab(1) = S3;     K = D12 < S3 x S3 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,9);  max subgroup: 5
 Stab(1) = S3;     K = D12 < S3 x S3 = G;       K is not normal in G

Checking 10/16...  (13 transitive;  0 primitive;  8 normal) 
Checking 11/16...  (13 transitive;  0 primitive;  8 normal) 
Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 1
 Stab(1) = D8;     K = S4 < C2 x S4 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 2
 Stab(1) = D8;     K = C2 x A4 < C2 x S4 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 3
 Stab(1) = D8;     K = S4 < C2 x S4 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,11);  max subgroup: 5
 Stab(1) = D8;     K = D12 < C2 x S4 = G;       K is not normal in G

Checking 12/16...  (17 transitive;  0 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 2
 Stab(1) = D10;     K = D10 < A5 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,12);  max subgroup: 3
 Stab(1) = D10;     K = A4 < A5 = G;       K is not normal in G

Checking 13/16...  (19 transitive;  1 primitive;  11 normal) 
Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 1
 Stab(1) = D12;     K = S3 x S3 < (S3 x S3) : C2 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,13);  max subgroup: 3
 Stab(1) = D12;     K = (C3 x C3) : C4 < (S3 x S3) : C2 = G;       K is normal in G

Checking 14/16...  (21 transitive;  1 primitive;  13 normal) 
Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 1
 Stab(1) = C5 : C4;     K = D12 < S5 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 2
 Stab(1) = C5 : C4;     K = C5 : C4 < S5 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 3
 Stab(1) = C5 : C4;     K = S4 < S5 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,14);  max subgroup: 4
 Stab(1) = C5 : C4;     K = A5 < S5 = G;       K is normal in G

Checking 15/16...  (25 transitive;  3 primitive;  14 normal) 
Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 2
 Stab(1) = A5;     K = A5 < A6 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 3
 Stab(1) = A5;     K = S4 < A6 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 4
 Stab(1) = A5;     K = (C3 x C3) : C4 < A6 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,15);  max subgroup: 5
 Stab(1) = A5;     K = A5 < A6 = G;       K is not normal in G

Checking 16/16...  (29 transitive;  5 primitive;  14 normal) 
Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 1
 Stab(1) = S5;     K = A6 < S6 = G;       K is normal in G

Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 3
 Stab(1) = S5;     K = S5 < S6 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 4
 Stab(1) = S5;     K = C2 x S4 < S6 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 5
 Stab(1) = S5;     K = (S3 x S3) : C2 < S6 = G;       K is not normal in G

Found maxl trans subgroup of TransitiveGroup(6,16);  max subgroup: 6
 Stab(1) = S5;     K = S5 < S6 = G;       K is not normal in G

gap> testConj(6,8,3);
rec(
  subgroups := [ Group( [ (2,5)(3,6), (2,3,5,6), (1,4)(2,5) ] ) ],
  inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
rec(
  subgroups := [ Group( [ (1,4)(2,3)(5,6) ] ), Group( [ (1,6)(2,5)(3,4) ] ), Group( [ (1,2)(3,6)(4,5) ] ), 
      Group( [ (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> testConj(6,8,4);
rec(
  subgroups := [ Group( [ (2,5)(3,6), (2,3,5,6), (1,4)(2,5) ] ) ],
  inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
List Element: <list>[4] must have an assigned value at
K := maxsubs[k];
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> testConj(6,9,4);
rec(
  subgroups := [ Group( [ (2,4,6), (3,5)(4,6), (1,5,3) ] ) ],
  inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
rec(
  subgroups := [ Group( [ (3,5)(4,6), (1,2)(3,4)(5,6) ] ), Group( [ (3,5)(4,6), (1,5,3)(2,4,6) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
gap> PointerButtonDown(10,403,101,1);
gap> PointerButtonDown(10,405,167,1);
gap> PointerButtonDown(10,406,365,1);
gap> PointerButtonDown(10,296,115,1);
gap> PointerButtonDown(10,397,304,1);
gap> PointerButtonDown(10,198,304,1);
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(6,9,4);
rec(
  subgroups := [ Group( [ (2,4,6), (3,5)(4,6), (1,5,3) ] ) ],
  inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
 Stab(1) = S3;     K = D12 < S3 x S3 = G; [G:Gx] = 6   [G:K]= 3
rec(
  subgroups := [ Group( [ (3,5)(4,6), (1,2)(3,4)(5,6) ] ), Group( [ (3,5)(4,6), (1,5,3)(2,6,4) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
gap> PointerButtonDown(10,601,158,1);
gap> PointerButtonDown(10,162,109,1);
gap> g:=TransitiveGroup(12,16);
[3^2]E(4)
gap> ms:=MaximalSubgroupClassReps(g);
[ Group([ (1,7)(2,8)(3,9)(4,10)(5,11)(6,12), (1,9,5)(3,7,11), (2,10,6)(4,8,12) ]), 
  Group([ (1,10)(2,5)(3,12)(4,7)(6,9)(8,11), (1,9,5)(3,7,11), (2,10,6)(4,8,12) ]), 
  Group([ (1,4)(2,11)(3,6)(5,8)(7,10)(9,12), (1,9,5)(3,7,11), (2,10,6)(4,8,12) ]), 
  Group([ (1,7)(2,8)(3,9)(4,10)(5,11)(6,12), (1,10)(2,5)(3,12)(4,7)(6,9)(8,11), 
      (1,9,5)(2,10,6)(3,7,11)(4,8,12) ]), 
  Group([ (1,7)(2,8)(3,9)(4,10)(5,11)(6,12), (1,10)(2,5)(3,12)(4,7)(6,9)(8,11), 
      (1,9,5)(2,6,10)(3,7,11)(4,12,8) ]) ]
gap> List([1..Size(ms)], x->IsTransitive(ms[x]));
[ false, false, false, true, true ]
gap> k:=ms[4];
Group([ (1,7)(2,8)(3,9)(4,10)(5,11)(6,12), (1,10)(2,5)(3,12)(4,7)(6,9)(8,11), (1,9,5)(2,10,6)(3,7,11)(4,8,12) 
 ])
gap> IsTransitive(k);
true
gap> IsNormal(g,k);
false
gap> h:=Stabilizer(g,1);
Group([ (2,10,6)(4,8,12) ])
gap> k1:=Stabilizer(k,1);
Group(())
gap> testConj(12,16,4);
rec(
  subgroups := [ Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1,11)( 2, 8)( 3, 5)( 4,10)( 6,12)( 7, 9) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 3)( 2, 8)( 4,10)( 5, 7)( 6,12)( 9,11) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 5, 9)( 3,11, 7) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12), ( 1, 5, 9)( 3,11, 7) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 6 ], [ 2, 6 ], [ 3, 6 ], [ 4, 5 ], [ 4, 6 ], 
      [ 4, 7 ], [ 5, 8 ], [ 6, 8 ], [ 7, 8 ] ] )
 Stab(1) = C3;     K = D12 < S3 x S3 = G; [G:Gx] = 12   [G:K]= 3
rec(
  subgroups := [ Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ), 
      Group( [ ( 1, 3)( 2, 4)( 5, 7)( 6, 8)( 9,11)(10,12) ] ), 
      Group( [ ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ), 
      Group( [ ( 1, 8)( 2, 3)( 4, 9)( 5,12)( 6, 7)(10,11) ] ), 
      Group( [ ( 1,12)( 2, 7)( 3,10)( 4, 5)( 6,11)( 8, 9) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1, 3)( 2, 4)( 5, 7)( 6, 8)( 9,11)(10,12) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 0, 6 ], [ 0, 7 ], [ 0, 8 ], [ 1, 9 ], 
      [ 2, 9 ], [ 5, 9 ], [ 1, 10 ], [ 3, 10 ], [ 6, 10 ], [ 1, 11 ], [ 4, 11 ], [ 7, 11 ], [ 1, 12 ], 
      [ 8, 12 ], [ 2, 13 ], [ 3, 13 ], [ 4, 13 ], [ 8, 13 ], [ 5, 14 ], [ 6, 14 ], [ 7, 14 ], [ 8, 14 ], 
      [ 9, 15 ], [ 10, 15 ], [ 11, 15 ], [ 12, 15 ], [ 13, 15 ], [ 14, 15 ] ] )
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(12,16,4);
 Stab(1) = C3;     K = D12 < S3 x S3 = G; [G:Gx] = 12   [G:K]= 3
rec(
  subgroups := [ Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1,11)( 2, 8)( 3, 5)( 4,10)( 6,12)( 7, 9) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 3)( 2, 8)( 4,10)( 5, 7)( 6,12)( 9,11) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 5, 9)( 3,11, 7) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12), ( 1, 5, 9)( 3,11, 7) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 6 ], [ 2, 6 ], [ 3, 6 ], [ 4, 5 ], [ 4, 6 ], 
      [ 4, 7 ], [ 5, 8 ], [ 6, 8 ], [ 7, 8 ] ] )
rec(
  subgroups := [ Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ), 
      Group( [ ( 1, 3)( 2, 4)( 5, 7)( 6, 8)( 9,11)(10,12) ] ), 
      Group( [ ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ), 
      Group( [ ( 1, 8)( 2, 3)( 4, 9)( 5,12)( 6, 7)(10,11) ] ), 
      Group( [ ( 1,12)( 2, 7)( 3,10)( 4, 5)( 6,11)( 8, 9) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1, 3)( 2, 4)( 5, 7)( 6, 8)( 9,11)(10,12) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 0, 6 ], [ 0, 7 ], [ 0, 8 ], [ 1, 9 ], 
      [ 2, 9 ], [ 5, 9 ], [ 1, 10 ], [ 3, 10 ], [ 6, 10 ], [ 1, 11 ], [ 4, 11 ], [ 7, 11 ], [ 1, 12 ], 
      [ 8, 12 ], [ 2, 13 ], [ 3, 13 ], [ 4, 13 ], [ 8, 13 ], [ 5, 14 ], [ 6, 14 ], [ 7, 14 ], [ 8, 14 ], 
      [ 9, 15 ], [ 10, 15 ], [ 11, 15 ], [ 12, 15 ], [ 13, 15 ], [ 14, 15 ] ] )
gap> Read("../ConjectureTransGroups.gap");
Syntax error: ) expected in ../ConjectureTransGroups.gap line 85
    Print("\nK1 = ", StructureDescription(Kx), "   [G:K] = ", Index(G,K), "  [K:K1] = ", Index(K,Kx), "\n");
                                                                                                           ^
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(12,16,4);

G = S3 x S3
G1 = C3   [G:G1] = 12
K = D12
K1 = 1   [G:K] = 3  [K:K1] = 12
rec(
  subgroups := [ Group( [ ( 2,10, 6)( 4, 8,12), ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 3)( 2, 4)( 5, 7)( 6, 8)( 9,11)(10,12) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 9, 5)( 2,10, 6)( 3, 7,11)( 4, 8,12) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 9, 5)( 2,10, 6)( 3, 7,11)( 4, 8,12), 
          ( 1,10, 9, 6, 5, 2)( 3,12, 7, 4,11, 8) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 9, 5)( 2,10, 6)( 3, 7,11)( 4, 8,12), 
          ( 1,12, 5, 4, 9, 8)( 2, 3,10,11, 6, 7) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 9, 5)( 2,10, 6)( 3, 7,11)( 4, 8,12), 
          ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 7 ], [ 2, 7 ], [ 3, 7 ], [ 4, 5 ], [ 4, 6 ], 
      [ 4, 7 ], [ 5, 8 ], [ 6, 8 ], [ 7, 8 ] ] )
rec(
  subgroups := [ Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ), 
      Group( [ ( 1, 3)( 2, 4)( 5, 7)( 6, 8)( 9,11)(10,12) ] ), 
      Group( [ ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ), 
      Group( [ ( 1, 8)( 2, 3)( 4, 9)( 5,12)( 6, 7)(10,11) ] ), 
      Group( [ ( 1,12)( 2, 7)( 3,10)( 4, 5)( 6,11)( 8, 9) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1, 3)( 2, 4)( 5, 7)( 6, 8)( 9,11)(10,12) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 0, 6 ], [ 0, 7 ], [ 0, 8 ], [ 1, 9 ], 
      [ 2, 9 ], [ 5, 9 ], [ 1, 10 ], [ 3, 10 ], [ 6, 10 ], [ 1, 11 ], [ 4, 11 ], [ 7, 11 ], [ 1, 12 ], 
      [ 8, 12 ], [ 2, 13 ], [ 3, 13 ], [ 4, 13 ], [ 8, 13 ], [ 5, 14 ], [ 6, 14 ], [ 7, 14 ], [ 8, 14 ], 
      [ 9, 15 ], [ 10, 15 ], [ 11, 15 ], [ 12, 15 ], [ 13, 15 ], [ 14, 15 ] ] )
gap> Read("../ConjectureTransGroups.gap");
gap> testConj(12,16,4);

G = S3 x S3      G1 = C3    [G:G1] = 12
K = D12      K1 = 1   [G:K] = 3  [K:K1] = 12
rec(
  subgroups := [ Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 3)( 2, 8)( 4,10)( 5, 7)( 6,12)( 9,11) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1,11)( 2, 4)( 3, 5)( 6, 8)( 7, 9)(10,12) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 7)( 2,12)( 3, 9)( 4, 6)( 5,11)( 8,10) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 9, 5)( 2,10, 6)( 3, 7,11)( 4, 8,12) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 9, 5)( 2,10, 6)( 3, 7,11)( 4, 8,12), 
          ( 1,10, 9, 6, 5, 2)( 3,12, 7, 4,11, 8) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 9, 5)( 2,10, 6)( 3, 7,11)( 4, 8,12), 
          ( 1, 8, 9, 4, 5,12)( 2, 7, 6,11,10, 3) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 9, 5)( 2,10, 6)( 3, 7,11)( 4, 8,12), 
          ( 1, 3)( 2, 8)( 4,10)( 5, 7)( 6,12)( 9,11) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 7 ], [ 2, 7 ], [ 3, 7 ], [ 4, 5 ], [ 4, 6 ], 
      [ 4, 7 ], [ 5, 8 ], [ 6, 8 ], [ 7, 8 ] ] )
rec(
  subgroups := [ Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 2)( 3, 8)( 4,11)( 5, 6)( 7,12)( 9,10) ] ), 
      Group( [ ( 1, 6)( 2, 9)( 3, 4)( 5,10)( 7, 8)(11,12) ] ), 
      Group( [ ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1,11)( 2, 4)( 3, 5)( 6, 8)( 7, 9)(10,12) ] ), 
      Group( [ ( 1, 3)( 2,12)( 4, 6)( 5, 7)( 8,10)( 9,11) ] ), 
      Group( [ ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ), 
      Group( [ ( 1, 5, 9)( 2,10, 6)( 3,11, 7)( 4, 8,12) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1, 2)( 3, 8)( 4,11)( 5, 6)( 7,12)( 9,10), ( 1,11)( 2, 4)( 3, 5)( 6, 8)( 7, 9)(10,12) ] ), 
      Group( [ ( 1, 6)( 2, 9)( 3, 4)( 5,10)( 7, 8)(11,12), ( 1, 3)( 2,12)( 4, 6)( 5, 7)( 8,10)( 9,11) ] ), 
      Group( [ ( 1, 5, 9)( 2,10, 6)( 3,11, 7)( 4, 8,12), ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 5, 9)( 2,10, 6)( 3,11, 7)( 4, 8,12), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1, 5, 9)( 2,10, 6)( 3,11, 7)( 4, 8,12), ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 0, 6 ], [ 0, 7 ], [ 0, 8 ], [ 1, 9 ], 
      [ 4, 9 ], [ 7, 9 ], [ 2, 10 ], [ 5, 10 ], [ 7, 10 ], [ 3, 11 ], [ 6, 11 ], [ 7, 11 ], [ 1, 12 ], 
      [ 2, 12 ], [ 3, 12 ], [ 8, 12 ], [ 4, 13 ], [ 5, 13 ], [ 6, 13 ], [ 8, 13 ], [ 7, 14 ], [ 8, 14 ], 
      [ 9, 15 ], [ 10, 15 ], [ 11, 15 ], [ 12, 15 ], [ 13, 15 ], [ 14, 15 ] ] )
Error, window system: window not used called from
WcSetLineWidth( WindowId( line ), line!.width ); called from
Draw( line ); called from
Line( C!.sheet, pos1[1], pos1[2], pos2[1] - pos1[1], pos2[2] - pos1[2], def ) called from
Connection( v1!.obj, v2!.obj, def ); called from
Edge( poset, v1, v2, rec(
     ) ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> testConj(12,16,4);

G = S3 x S3      G1 = C3    [G:G1] = 12
K = D12      K1 = 1   [G:K] = 3  [K:K1] = 12
rec(
  subgroups := [ Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1,11)( 2, 8)( 3, 5)( 4,10)( 6,12)( 7, 9) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 3)( 2, 8)( 4,10)( 5, 7)( 6,12)( 9,11) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 5, 9)( 3,11, 7) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12), ( 1, 5, 9)( 3,11, 7) ] ), 
      Group( [ ( 2,10, 6)( 4, 8,12), ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 6 ], [ 2, 6 ], [ 3, 6 ], [ 4, 5 ], [ 4, 6 ], 
      [ 4, 7 ], [ 5, 8 ], [ 6, 8 ], [ 7, 8 ] ] )
rec(
  subgroups := [ Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ), 
      Group( [ ( 1, 3)( 2, 4)( 5, 7)( 6, 8)( 9,11)(10,12) ] ), 
      Group( [ ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ), 
      Group( [ ( 1, 8)( 2, 3)( 4, 9)( 5,12)( 6, 7)(10,11) ] ), 
      Group( [ ( 1,12)( 2, 7)( 3,10)( 4, 5)( 6,11)( 8, 9) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1,11)( 2,12)( 3, 5)( 4, 6)( 7, 9)( 8,10) ] ), 
      Group( [ ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11), ( 1, 3)( 2, 4)( 5, 7)( 6, 8)( 9,11)(10,12) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1,10)( 2, 5)( 3,12)( 4, 7)( 6, 9)( 8,11) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1, 7)( 2, 8)( 3, 9)( 4,10)( 5,11)( 6,12) ] ), 
      Group( [ ( 1, 5, 9)( 2, 6,10)( 3,11, 7)( 4,12, 8), ( 1, 4)( 2,11)( 3, 6)( 5, 8)( 7,10)( 9,12) ] ) ],
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 0, 6 ], [ 0, 7 ], [ 0, 8 ], [ 1, 9 ], 
      [ 2, 9 ], [ 5, 9 ], [ 1, 10 ], [ 3, 10 ], [ 6, 10 ], [ 1, 11 ], [ 4, 11 ], [ 7, 11 ], [ 1, 12 ], 
      [ 8, 12 ], [ 2, 13 ], [ 3, 13 ], [ 4, 13 ], [ 8, 13 ], [ 5, 14 ], [ 6, 14 ], [ 7, 14 ], [ 8, 14 ], 
      [ 9, 15 ], [ 10, 15 ], [ 11, 15 ], [ 12, 15 ], [ 13, 15 ], [ 14, 15 ] ] )
gap> PointerButtonDown(16,408,424,1);
gap> PointerButtonDown(16,459,297,1);
gap> PointerButtonDown(16,198,104,1);
gap> PointerButtonDown(16,397,230,1);
gap> PointerButtonDown(16,400,100,1);
gap> PointerButtonDown(16,602,102,1);
gap> PointerButtonDown(16,632,306,1);
gap> PointerButtonDown(16,609,278,1);
gap> PointerButtonDown(16,532,289,1);
gap> PointerButtonDown(16,399,167,1);
gap> PointerButtonDown(16,483,119,1);
gap> PointerButtonDown(16,572,122,1);
gap> PointerButtonDown(16,127,311,1);
gap> PointerButtonDown(16,188,299,1);
gap> PointerButtonDown(16,290,295,1);
gap> PointerButtonDown(16,394,360,1);
gap> PointerButtonDown(16,82,383,1);
gap> PointerButtonDown(16,602,496,1);
gap> PointerButtonDown(16,403,498,1);
gap> PointerButtonDown(16,248,490,1);
gap> PointerButtonDown(16,690,277,1);
gap> PointerButtonDown(16,390,285,1);
gap> PointerButtonDown(16,146,317,1);
gap> PointerButtonDown(16,52,318,1);
gap> PointerButtonDown(16,137,309,1);
gap> PointerButtonDown(16,83,311,1);
gap> PointerButtonDown(16,190,430,1);
gap> PointerButtonDown(16,396,559,1);
gap> PointerButtonDown(16,73,185,1);
gap> PointerButtonDown(16,232,314,1);
gap> PointerButtonDown(16,150,306,1);
gap> PointerButtonDown(16,96,305,1);
gap> PointerButtonDown(16,116,171,1);
gap> MenuSelected( 16, 1, 12 );
gap> PointerButtonDown(16,710,426,1);
gap> MenuSelected( 16, 1, 12 );
gap> PointerButtonDown(16,579,243,1);
gap> PointerButtonDown(16,54,511,1);
gap> PointerButtonDown(16,157,479,1);
gap> PointerButtonDown(16,179,486,1);
gap> PointerButtonDown(16,560,225,1);
gap> PointerButtonDown(16,675,281,1);
gap> PointerButtonDown(16,697,426,1);
gap> PointerButtonDown(16,620,310,1);
gap> PointerButtonDown(16,475,249,1);
gap> PointerButtonDown(16,638,120,1);
gap> PointerButtonDown(16,510,111,1);
gap> PointerButtonDown(16,413,118,1);
gap> PointerButtonDown(16,402,36,1);
gap> PointerButtonDown(16,119,173,1);
gap> PointerButtonDown(16,518,249,1);
gap> MenuSelected( 16, 0, 1 );
gap> PointerButtonDown(16,538,229,1);
gap> PointerButtonDown(16,526,247,1);
gap> PointerButtonDown(16,479,428,1);
gap> PointerButtonDown(16,526,228,1);
gap> MenuSelected( 16, 0, 1 );
gap> G := Group([(2,3)(4,7)(5,9)(6,8), (1,3)(4,9)(5,8)(6,7), (1,4,7)(2,5,8)(3,6,9)]);
Group([ (2,3)(4,7)(5,9)(6,8), (1,3)(4,9)(5,8)(6,7), (1,4,7)(2,5,8)(3,6,9) ])
gap> MaximalNormalSubgroups(G);
[ Group([ (1,7,4)(2,8,5)(3,9,6), (1,2,3)(4,5,6)(7,8,9) ]) ]
gap> N:=MaximalNormalSubgroups(G);
[ Group([ (1,7,4)(2,8,5)(3,9,6), (1,2,3)(4,5,6)(7,8,9) ]) ]
gap> StructureDescription(N);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `StructureDescription' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> N:=N[1];
Group([ (1,7,4)(2,8,5)(3,9,6), (1,2,3)(4,5,6)(7,8,9) ])
gap> StructureDescription(N);
"C3 x C3"
gap> IsTransitive(N);
true
gap> quit;
