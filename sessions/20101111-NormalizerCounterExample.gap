gap> G := SmallGroup(360,118);; 
gap> StructureDescription(G);              # A6
"A6"
gap> 
gap> ccs := ConjugacyClassesSubgroups(G);;
gap> 
gap> H := Representative(ccs[16]);; 
gap> StructureDescription(H);              # (C3 x C3) : C2
"(C3 x C3) : C2"
gap> StructureDescription(Normalizer(G,H));# (C3 x C3) : C4
"(C3 x C3) : C4"
gap> MenuSelected( 1, 0, 2 );
gap> 
gap> K := Representative(ccs[17]);; 
gap> StructureDescription(K);                # S4
"S4"
gap> StructureDescription(Normalizer(K));    # S4
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Normalizer' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk>                                         # (K is self-normalizing)
brk> 
brk> HcapK := Intersection(H,K);; 
Syntax error: warning: unbound global variable in *errin* line 3
HcapK := Intersection(H,K);; 
       ^
brk> StructureDescription(HcapK);            # S3
"S3"
brk> StructureDescription(Normalizer(HcapK));# S3
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Normalizer' on 1 arguments called from
Error( no_method_found ); called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk_02> quit;
brk> quit;
gap> clear;
Variable: 'clear' must have a value

gap> Clear;
Variable: 'Clear' must have a value

gap> G := SmallGroup(360,118);; 
gap> StructureDescription(G);              # A6
"A6"
gap> 
gap> ccs := ConjugacyClassesSubgroups(G);;
gap> 
gap> H := Representative(ccs[16]);; 
gap> StructureDescription(H);              # (C3 x C3) : C2
"(C3 x C3) : C2"
gap> StructureDescription(Normalizer(G,H));# (C3 x C3) : C4
"(C3 x C3) : C4"
gap>                                       # (H is not self-normalizing)
gap> 
gap> K := Representative(ccs[17]);; 
gap> StructureDescription(K);                # S4
"S4"
gap> StructureDescription(Normalizer(G,K));    # S4
"S4"
gap>                                         # (K is self-normalizing)
gap> 
gap> HcapK := Intersection(H,K);; 
gap> StructureDescription(HcapK);            # S3
"S3"
gap> StructureDescription(Normalizer(G,HcapK));# S3
"S3"
gap>  L := GraphicSubgroupLattice(G);
<graphic subgroup lattice "GraphicSubgroupLattice of [ 360, 118 ]">
gap> InsertVertex(L, HcapK);
[ <vertex of graphic graph, label: "2", Serial:92>, true ]
gap> filterHcapK := IntermediateSubroups(G,HcapK);;
Variable: 'IntermediateSubroups' must have a value

gap> filterHcapK := IntermediateSubgroups(G,HcapK);;
gap> Size(filterHcapK);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Size' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Size(filterHcapK.subgroups);
4
gap> filterHcapK := IntermediateSubgroups(G,HcapK);
rec( subgroups := [ Group([ (4,5,6), (1,2)(5,6), (2,3)(4,5) ]), Group([ (4,5,6), (1,2)(5,6), (3,5,4) ]), 
      Group([ (4,5,6), (1,2)(5,6), (2,3)(4,5), (1,4,3,5)(2,6) ]), Group([ (4,5,6), (1,2)(5,6), (2,4)(5,6) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 4 ], [ 1, 3 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> for k in [1..4] do
> StructureDescription(filterHcapK.subgroups[k]);
> od;
gap> StructureDescription(filterHcapK.subgroups[1]);
"(C3 x C3) : C2"
gap> StructureDescription(filterHcapK.subgroups[2]);
"S4"
gap> StructureDescription(filterHcapK.subgroups[3]);
"(C3 x C3) : C4"
gap> StructureDescription(filterHcapK.subgroups[4]);
"A5"
gap> filterHcapK := IntermediateSubgroups(G,HcapK);;
gap> for k in [1..Size(filterHcapK.subgroups)] do
>     InsertVertex(L, filterHcapK.subgroups[k]); 
> od;
gap> PointerButtonDown(2,405,327,1);
gap> PointerButtonDown(2,401,271,1);
gap> PointerButtonDown(2,407,139,1);
gap> PointerButtonDown(2,405,218,1);
gap> PointerButtonDown(2,562,326,1);
gap> PointerButtonDown(2,374,142,1);
gap> PointerButtonDown(2,241,269,1);
gap> PointerButtonDown(2,396,138,1);
gap> L := GraphicSubgroupLattice(G);
<graphic subgroup lattice "GraphicSubgroupLattice of [ 360, 118 ]">
gap> InsertVertex(L, HcapK);
[ <vertex of graphic graph, label: "2", Serial:99>, true ]
gap> InsertVertex(L, H);
[ <vertex of graphic graph, label: "3", Serial:100>, true ]
gap> PointerButtonDown(3,401,481,1);
gap> MenuSelected( 3, 1, 12 );
gap> PointerButtonDown(3,405,484,1);
gap> MenuSelected( 3, 1, 12 );
gap> InsertVertex(L, K);
[ <vertex of graphic graph, label: "4", Serial:101>, true ]
gap> PointerButtonDown(3,396,327,1);
gap> PointerButtonDown(3,258,325,1);
gap> MenuSelected( 3, 1, 12 );
gap> PointerButtonDown(3,404,270,1);
gap> PointerButtonDown(3,531,273,1);
gap> MenuSelected( 3, 1, 12 );
gap> filterHcapK := IntermediateSubgroups(G,HcapK);
rec( subgroups := [ Group([ (4,5,6), (1,2)(5,6), (2,3)(4,5) ]), Group([ (4,5,6), (1,2)(5,6), (3,5,4) ]), 
      Group([ (4,5,6), (1,2)(5,6), (2,3)(4,5), (1,4,3,5)(2,6) ]), Group([ (4,5,6), (1,2)(5,6), (2,4)(5,6) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 4 ], [ 1, 3 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> StructureDescription(filterHcapK.subgroups[1]);
"(C3 x C3) : C2"
gap> StructureDescription(filterHcapK.subgroups[2]);
"S4"
gap> StructureDescription(filterHcapK.subgroups[3]);
"(C3 x C3) : C4"
gap> StructureDescription(filterHcapK.subgroups[4]);
"A5"
gap> InsertVertex(L, filterHcapK.subgroups[3]); 
[ <vertex of graphic graph, label: "5", Serial:102>, true ]
gap> PointerButtonDown(3,400,221,1);
gap> PointerButtonDown(3,254,221,1);
gap> MenuSelected( 3, 1, 12 );
gap> InsertVertex(L, filterHcapK.subgroups[4]); 
[ <vertex of graphic graph, label: "6", Serial:103>, true ]
gap> PointerButtonDown(3,399,140,1);
gap> PointerButtonDown(3,403,145,1);
gap> MenuSelected( 3, 1, 12 );
gap> PointerButtonDown(3,402,16,1);
gap> MenuSelected( 3, 1, 12 );
gap> PointerButtonDown(3,530,272,1);
gap> MenuSelected( 3, 1, 12 );
gap> PointerButtonDown(3,404,479,1);
gap> MenuSelected( 3, 1, 12 );
gap> PointerButtonDown(3,256,325,1);
gap> PointerButtonDown(3,534,277,1);
gap> MenuSelected( 3, 0, 1 );
gap> PointerButtonDown(3,251,502,1);
gap> MenuSelected( 3, 0, 1 );
gap> quit;
