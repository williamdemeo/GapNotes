gap> s8 := SymmetricGroup(8);
Sym( [ 1 .. 8 ] )
gap> a8 := DerivedSubgroup( s8 );
Group([ (1,3,2), (2,4,3), (2,3)(4,5), (2,4,6,5,3), (2,5,3)(4,7,6), 
  (2,8,7,4,5,6,3) ])
gap> size( a8 ); IsAbelian(a8); IsPerfect(a8);
Variable: 'size' must have a value

false
true
gap> Size( a8 ); IsAbelian(a8); IsPerfect(a8);
20160
false
true
gap> elab := Group((1,2)(3,4)(5,6)(7,8), (1,3)(2,4)(5,7)(6,8),(1,5)(2,6)(3,7)(4,8));
Group([ (1,2)(3,4)(5,6)(7,8), (1,3)(2,4)(5,7)(6,8), (1,5)(2,6)(3,7)(4,8) ])
gap> Size(elab);
8
gap> IsElementaryAbelian(elab);
true
gap> LatticeSubgroups(elab);
<subgroup lattice of Group([ (1,2)(3,4)(5,6)(7,8), (1,3)(2,4)(5,7)(6,8), 
  (1,5)(2,6)(3,7)(4,8) ]), 16 classes, 16 subgroups>
gap> GraphicSubgroupLattice(elab);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 0, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,G)
gap> % comment;
Syntax error: expression expected
% comment;
^
gap> s4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> GraphicSubgroupLattice(s4);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 1, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,\
22,23,24,25,26,27,28,29,G)
gap> PointerButtonDown(1,400,184,1);
gap> PointerButtonDown(1,194,334,1);
gap> PointerButtonDown(1,396,110,1);
gap> PointerButtonDown(1,452,410,1);
gap> PointerButtonDown(1,402,334,1);
gap> PointerButtonDown(1,252,182,1);
gap> PointerButtonDown(1,408,261,1);
gap> PointerButtonDown(1,249,264,1);
gap> PointerButtonDown(1,191,490,1);
gap> PointerButtonDown(1,83,331,1);
gap> PointerButtonDown(1,603,333,1);
gap> PointerButtonDown(1,676,436,1);
gap> PointerButtonDown(1,457,486,1);
gap> PointerButtonDown(1,460,358,1);
gap> PointerButtonDown(1,546,328,1);
gap> PointerButtonDown(1,504,357,1);
gap> PointerButtonDown(1,438,332,1);
gap> PointerButtonDown(1,430,484,1);
gap> PointerButtonDown(1,627,426,1);
gap> PointerButtonDown(1,545,350,1);
gap> PointerButtonDown(1,188,494,1);
gap> PointerButtonDown(1,401,24,1);
gap> PointerButtonDown(1,613,115,1);
gap> PointerButtonDown(1,509,342,1);
gap> PointerButtonDown(1,231,266,1);
gap> PointerButtonDown(1,518,330,1);
gap> PointerButtonDown(1,264,479,1);
gap> PointerButtonDown(1,208,250,1);
gap> PointerButtonDown(1,700,425,1);
gap> PointerButtonDown(1,371,337,1);
gap> PointerButtonDown(1,270,250,1);
gap> PointerButtonDown(1,276,474,1);
gap> PointerButtonDown(1,282,462,1);
gap> PointerButtonDown(1,289,244,1);
gap> MenuSelected( 1, 2, 19 );
#I  SelectedGroups to GAP (25)
gap> PointerButtonDown(1,289,236,1);
gap> MenuSelected( 1, 2, 1 );
#I  All Subgroups (25) --> (1,8,6,10,14,25)
gap> PointerButtonDown(1,274,473,1);
gap> MenuSelected( 1, 2, 4 );
#I  Closure (10) --> (10)
gap> MenuSelected( 1, 2, 4 );
#I  Closure (10) --> (10)
gap> PointerButtonDown(1,612,110,1);
gap> quit;
