gap> a5 := AlternatingGroup(5);
Alt( [ 1 .. 5 ] )
gap> a5a5 := DirectProduct(a5,a5);
Group([ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ])
gap> P2 := SylowSubgroup(a5a5,2);
Group([ (7,8)(9,10), (7,9)(8,10), (2,3)(4,5), (2,5)(3,4) ])
gap> Order(P2);
16
gap> IsNormal(a5a5,P2);
false
gap> Conjugates(a5a5,P2);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Conjugates' on 2 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> ConjugacyClassSubgroups(a5a5,P2);
Group( [ ( 7, 8)( 9,10), ( 7, 9)( 8,10), (2,3)(4,5), (2,5)(3,4) ] )^G
gap> Size(last);
25
gap> P3 := SylowSubgroup(a5a5,3);
Group([ (8,9,10), (3,4,5) ])
gap> Size(ConjugacyClassSubgroups(a5a5,P3));
100
gap> P5 := SylowSubgroup(a5a5,5);
Group([ (6,10,9,8,7), (1,3,4,5,2) ])
gap> Size(ConjugacyClassSubgroups(a5a5,P5));
36
gap> s2 := SymmetricGroup(2);
Sym( [ 1 .. 2 ] )
gap> GeneratorsOfGroup(s2);
[ (1,2) ]
gap> M := a5a5;
Group([ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ])
gap> Mgens := M.generators;
Error, illegal access to record component `obj.generators'
of the object <obj>. (Objects by default do not have record components.
The error might be a relic from translated GAP3 code.)       called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Mgens := GeneratorsOfGroup(M);
[ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ]
gap> # Build hom from s2 to Aut(M):
gap> hom1 := GroupHomomorphismByImages(M,M,Mgens,Mgens{Concatenation([3..4],[1..2])});
[ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ] -> 
[ (6,7,8,9,10), (8,9,10), (1,2,3,4,5), (3,4,5) ]
gap> hom := GroupHomomorphismByImages(M,M,Mgens,Mgens{Concatenation([3..4],[1..2])});
[ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ] -> 
[ (6,7,8,9,10), (8,9,10), (1,2,3,4,5), (3,4,5) ]
gap> hom.isMapping := true;
Error, illegal assignement to record component `obj.isMapping'
of the object <obj>. (Objects by default cannot have record components.
The error might be a relic from translated GAP3 code.)       called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> hom.IsMapping := true;
Error, illegal assignement to record component `obj.IsMapping'
of the object <obj>. (Objects by default cannot have record components.
The error might be a relic from translated GAP3 code.)       called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> aut:=Group(hom);
<group with 1 generators>
gap> ahom := GroupHomomorphismByImages(s2,aut,s2.generators,aut.generators);
Error, illegal access to record component `obj.generators'
of the object <obj>. (Objects by default do not have record components.
The error might be a relic from translated GAP3 code.)       called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> GeneratorsOfGroup(aut);
[ [ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ] -> 
    [ (6,7,8,9,10), (8,9,10), (1,2,3,4,5), (3,4,5) ] ]
gap> s2gens := GeneratorsOfGroup(s2);
[ (1,2) ]
gap> autgens := GeneratorsOfGroup(aut);
[ [ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ] -> 
    [ (6,7,8,9,10), (8,9,10), (1,2,3,4,5), (3,4,5) ] ]
gap> ahom := GroupHomomorphismByImages(s2,aut,s2gens,autgens);
[ (1,2) ] -> 
[ [ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ] -> [ (6,7,8,9,10), (8,9,10), 
      (1,2,3,4,5), (3,4,5) ] ]
gap> sdp := SemidirectProduct(M, ahom, s2);
Error, usage: Image(<map>), Image(<map>,<elm>), Image(<map>,<coll>) called from
Image( map, r ) called from
func( elm ) called from
List( LS, function ( x )
      return Image( Image( map, r ), x );
  end ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> # Probably better to use wreath product:
gap> a5;
Alt( [ 1 .. 5 ] )
gap> c2 := CyclicGroup(2);
<pc group of size 2 with 1 generators>
gap> G := WreathProduct(a5, c2);
<group of size 7200 with 3 generators>
gap> 60*60*2;
7200
gap> T1 := Image(Embedding(G,1));
<group with 2 generators>
gap> T1;
<group with 2 generators>
gap> Size(T1);
60
gap> T2 := Image(Embedding(G,2));
<group with 2 generators>
gap> H := Image(Embedding(G,3));
<group with 1 generators>
gap> Size(H);
2
gap> IdGroup(T1);
[ 60, 5 ]
gap> IdGroup(T2);
[ 60, 5 ]
gap> M := Group(Union(T1,T2));
<group with 119 generators>
gap> Size(M);
3600
gap> IdGroup(M);
Error, the group identification for groups of size 3600 is not available called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Size(a5a5);
3600
gap> IsSimple(T1);
true
gap> IsSimple(T2);
true
gap> IdGroup(a5);
[ 60, 5 ]
gap> L := GraphicSubgroupLattice(G);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> ms := MaximalSubgroups(G);
user interrupt at
a := InverseOp( elm );
 called from
act( pnt, gen ) called from
RepresentativeActionOp( G, d, e, act ) called from
RepresentativeAction( xorb, Representative( xorb ), pnt ) called from
elm in classes[i] called from
ConjugacyClassesTry( G, classes, Random( cent ), 0, 1 ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> SubG := LatticeSubgroups(G);
user interrupt at
info := FamilyObj( x )!.info;
 called from
list[s][1] < obj called from
PositionFirstComponentDict( d!.entries, x ) called from
KnowsDictionary( dict, img ) called from
RepresentativeActionOp( G, d, e, act ) called from
RepresentativeAction( xorb, Representative( xorb ), pnt ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> SubG := LatticeSubgroups(G);;
user interrupt at
info := FamilyObj( x )!.info;
 called from
list[s][1] < obj called from
PositionFirstComponentDict( d!.entries, x ) called from
KnowsDictionary( dict, img ) called from
RepresentativeActionOp( G, d, e, act ) called from
RepresentativeAction( xorb, Representative( xorb ), pnt ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> MaximalSubgroupClassReps(G);
user interrupt at
MakeImmutable( a );
 called from
act( pnt, gen ) called from
RepresentativeActionOp( G, d, e, act ) called from
RepresentativeAction( xorb, Representative( xorb ), pnt ) called from
elm in classes[i] called from
ConjugacyClassesTry( G, classes, Random( cent ), 0, 1 ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> IsNormal(G,M);
true
gap> IsNormal(G,H);
false
gap> intSubs:=IntermediateSubgroups(G,H);
user interrupt at
info := FamilyObj( x )!.info;
 called from
Representative( xorb ) in AsList( yorb ) called from
x in d!.list called from
KnowsDictionary( d, i ) called from
orbish( G, pnt, gens, acts, act ) called from
Orbit( G, RightCoset( U, One( U ) ), OnRight ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> intSubs:=IntermediateSubgroups(G,H);;
user interrupt at
info := FamilyObj( x )!.info;
 called from
Representative( xorb ) in AsList( yorb ) called from
x in d!.list called from
KnowsDictionary( d, i ) called from
orbish( G, pnt, gens, acts, act ) called from
Orbit( G, RightCoset( U, One( U ) ), OnRight ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> L := GraphicSubgroupLattice(G);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> InsertVertex(L,H);
[ <vertex of graphic graph, label: "2", Serial:5>, true ]
gap> MenuSelected( 1, 1, 7 );
gap> Order(G);
7200
gap> InsertVertex(L,M);
[ <vertex of graphic graph, label: "3", Serial:6>, true ]
gap> PointerButtonDown(1,579,101,1);
gap> PointerButtonDown(1,578,163,1);
gap> InsertVertex(L,T1);
[ <vertex of graphic graph, label: "4", Serial:7>, true ]
gap> InsertVertex(L,T2);
[ <vertex of graphic graph, label: "5", Serial:8>, true ]
gap> PointerButtonDown(1,581,152,1);
gap> PointerButtonDown(1,512,159,1);
gap> PointerButtonDown(1,501,150,1);
gap> PointerButtonDown(1,629,202,1);
gap> PointerButtonDown(1,644,186,1);
gap> IsNormalSubgroup(M,T1);
Variable: 'IsNormalSubgroup' must have a value

gap> IsNormal(M,T1);
true
gap> IsNormal(M,T2);
true
gap> Intersection(M,H);
<trivial group>
gap> msM := MaximalSubgroups(M);;
user interrupt at
j := i ^ p;
 called from
rep[p] * gens[i] called from
OrbitStabilizerAlgorithm( G, false, false, gens, acts, rec(
    pnt := d,
    act := act ) ) called from
orbish( G, pnt, gens, acts, act ) called from
CallFuncList( StabilizerFunc, arg ) called from
Stabilizer( G, elm, OnPoints ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> MinimalNormalSubgroups(G);
[ <group of size 3600 with 3 generators> ]
gap> mns := last;
[ <group of size 3600 with 3 generators> ]
gap> mns := mns[1];
<group of size 3600 with 3 generators>
gap> M = mns;
true
gap> NormalClosure(G,H);
<group with 4 generators>
gap> ncH := NormalClosure(G,H);
<group with 4 generators>
gap> InsertVertex(L,ncH);
[ <vertex of graphic graph, label: "G", Serial:3>, false ]
gap> PointerButtonDown(1,689,363,1);
gap> PointerButtonDown(1,681,431,1);
gap> Order(ncH);
7200
gap> Order(G);
7200
gap> ncH = G;
true
gap> 7200-3600
> ;
3600
gap> c2four := DirectProduct(c2,c2);
<pc group of size 4 with 2 generators>
gap> c2four := DirectProduct(c2four,c2four);
<pc group of size 16 with 4 generators>
gap> IsAbelian(c2four);
true
gap> a3 := AlternatingGroup(3);
Alt( [ 1 .. 3 ] )
gap> wpA5twoA3 := WreathProduct(a5,a3);
<permutation group of size 648000 with 7 generators>
gap> GG := wpA5twoA3;
<permutation group of size 648000 with 7 generators>
gap> T1 := Image(Embedding(GG,1));
Group([ (1,2,3,4,5), (3,4,5) ])
gap> Order(T1);
60
gap> T2 := Image(Embedding(GG,2));
Group([ (6,7,8,9,10), (8,9,10) ])
gap> H := Image(Embedding(GG,3));
Group([ (11,12,13,14,15), (13,14,15) ])
gap> M := Group(Union(T1,T2));
<permutation group with 119 generators>
gap> LL := SubgroupLattice(GG);
Variable: 'SubgroupLattice' must have a value

gap> LL := GraphicSubgroupLattice(GG);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> InsertVertex(LL,M);
[ <vertex of graphic graph, label: "2", Serial:11>, true ]
gap> IsNormal(GG,M);
false
gap> InsertVertex(LL,T1);
[ <vertex of graphic graph, label: "3", Serial:12>, true ]
gap> InsertVertex(LL,T2);
[ <vertex of graphic graph, label: "4", Serial:13>, true ]
gap> InsertVertex(LL,H);
[ <vertex of graphic graph, label: "5", Serial:14>, true ]
gap> PointerButtonDown(2,394,79,1);
gap> PointerButtonDown(2,402,134,1);
gap> PointerButtonDown(2,339,140,1);
gap> PointerButtonDown(2,344,140,1);
gap> MinimalNormalSubgroups(GG);
[ Group([ (1,2)(3,4)(6,7)(8,9)(11,12)(13,14), (2,4)(3,5)(6,7)(8,9)(11,12)(14,15), 
      (1,2)(3,4)(6,7)(9,10)(11,12)(13,14), (3,4,5)(6,10,7,8,9)(13,15,14), 
      (1,4,2,5,3)(6,9,10,7,8)(11,13,15) ]) ]
gap> minN := last[1];
Group([ (1,2)(3,4)(6,7)(8,9)(11,12)(13,14), (2,4)(3,5)(6,7)(8,9)(11,12)(14,15), 
  (1,2)(3,4)(6,7)(9,10)(11,12)(13,14), (3,4,5)(6,10,7,8,9)(13,15,14), 
  (1,4,2,5,3)(6,9,10,7,8)(11,13,15) ])
gap> Order(minN);
216000
gap> FactorsInt(216000);
[ 2, 2, 2, 2, 2, 2, 3, 3, 3, 5, 5, 5 ]
gap> 4*3*5;
60
gap> minN;
Group([ (1,2)(3,4)(6,7)(8,9)(11,12)(13,14), (2,4)(3,5)(6,7)(8,9)(11,12)(14,15), 
  (1,2)(3,4)(6,7)(9,10)(11,12)(13,14), (3,4,5)(6,10,7,8,9)(13,15,14), 
  (1,4,2,5,3)(6,9,10,7,8)(11,13,15) ])
gap> minN = M;
false
gap> Order(M);
3600
gap> Index(GG,minN);
3
gap> InsertVertex(LL,minN);
[ <vertex of graphic graph, label: "6", Serial:15>, true ]
gap> quit;
