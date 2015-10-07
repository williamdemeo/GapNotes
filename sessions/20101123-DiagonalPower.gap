gap> T:=AlternatingGroup(5);;
gap> S4:=SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> Generators(S4);
Variable: 'Generators' must have a value

gap> S4.generators;
Error, illegal access to record component `obj.generators'
of the object <obj>. (Objects by default do not have record components.
The error might be a relic from translated GAP3 code.)       called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> M:=DirectProduct(T,T,T,T);
<permutation group of size 12960000 with 8 generators>
gap> M.generators;
Error, illegal access to record component `obj.generators'
of the object <obj>. (Objects by default do not have record components.
The error might be a relic from translated GAP3 code.)       called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Generators(M);
Variable: 'Generators' must have a value

gap> GeneratorsOfGroup(S4);
[ (1,2,3,4), (1,2) ]
gap> GeneratorsOfGroup(M);
[ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10), (11,12,13,14,15), (13,14,15), (16,17,18,19,20), (18,19,20) ]
gap> emb1:=Embedding(M,1);
1st embedding into <permutation group of size 12960000 with 8 generators>
gap> emb2:=Embedding(M,2);;
gap> emb3:=Embedding(M,3);;
gap> emb4:=Embedding(M,4);;
gap> GeneratorsOfGroup(T);
[ (1,2,3,4,5), (3,4,5) ]
gap> diag:=List(GeneratorsOfGroup(T), i->Image(emb1,i)*Image(emb2,i)*Image(emb3,i)*Image(emb4,i));
[ (1,2,3,4,5)(6,7,8,9,10)(11,12,13,14,15)(16,17,18,19,20), (3,4,5)(8,9,10)(13,14,15)(18,19,20) ]
gap> hatT:=Group(diag,());
Group([ (1,2,3,4,5)(6,7,8,9,10)(11,12,13,14,15)(16,17,18,19,20), (3,4,5)(8,9,10)(13,14,15)(18,19,20) ])
gap> Order(hatT);
60
gap> IsSubgroup(M,hatT);
true
gap> fhatT := IntermediateSubgroups(M,hatT);
user interrupt at
blist[new] := true;
 called from
PermutationOp( g, D, act ) called from
Permutation( elm, HomeEnumerator( xset ), FunctionAction( xset ) ) called from
ImageElmActionHomomorphism( hom, gen ) called from
func( elm ) called from
List( gens, function ( gen )
      return ImageElmActionHomomorphism( hom, gen );
  end ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> M:=DirectProduct(T,T,T);
Group([ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10), (11,12,13,14,15), (13,14,15) ])
gap> emb1:=Embedding(M,1);;
gap> emb2:=Embedding(M,2);;
gap> emb3:=Embedding(M,3);;
gap> diag:=List(GeneratorsOfGroup(T), i->Image(emb1,i)*Image(emb2,i)*Image(emb3,i));
[ (1,2,3,4,5)(6,7,8,9,10)(11,12,13,14,15), (3,4,5)(8,9,10)(13,14,15) ]
gap> hatT:=Group(diag,());;
gap> IsSubgroup(M,hatT);
true
gap> fhatT := IntermediateSubgroups(M,hatT);;  
gap> # This takes too long.  Let's try a smaller example.
gap> Size(fhatT.subgroups);
3
gap> fhatT.subgroups[1];
Group([ (1,2,3,4,5)(6,7,8,9,10)(11,12,13,14,15), (3,4,5)(8,9,10)(13,14,15), (13,14,15) ])
gap> StructureDescription(fhatT.subgroups[1]);
"A5 x A5"
gap> StructureDescription(fhatT.subgroups[2]);
"A5 x A5"
gap> StructureDescription(fhatT.subgroups[3]);
"A5 x A5"
gap> fhatT.subgroups[2];
A5 x A5
gap> fhatT.subgroups[3];
A5 x A5
gap> fhatT := IntermediateSubgroups(M,hatT);;  
gap> fhatT.subgroups[2];
Group([ (1,2,3,4,5)(6,7,8,9,10)(11,12,13,14,15), (3,4,5)(8,9,10)(13,14,15), (8,9,10) ])
gap> fhatT.subgroups[3];
Group([ (1,2,3,4,5)(6,7,8,9,10)(11,12,13,14,15), (3,4,5)(8,9,10)(13,14,15), (8,9,10)(13,14,15) ])
gap> L := GraphicSubgroupLattice(M);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> InsertVertex(L, hatT);
[ <vertex of graphic graph, label: "2", Serial:3>, true ]
gap> InsertVertex(L, fhatT.subgroups[1]);
[ <vertex of graphic graph, label: "3", Serial:4>, true ]
gap> InsertVertex(L, fhatT.subgroups[2]);
[ <vertex of graphic graph, label: "4", Serial:5>, true ]
gap> InsertVertex(L, fhatT.subgroups[3]);
[ <vertex of graphic graph, label: "5", Serial:6>, true ]
gap> MenuSelected( 0, 1, 7 );
gap> PointerButtonDown(0,580,264,1);
gap> PointerButtonDown(0,571,350,1);
gap> PointerButtonDown(0,570,283,1);
gap> PointerButtonDown(0,580,180,1);
gap> PointerButtonDown(0,581,187,1);
gap> PointerButtonDown(0,578,267,1);
gap> T:=AlternatingGroup(5);;
gap> S4:=SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> M:=DirectProduct(T,T,T,T);
<permutation group of size 12960000 with 8 generators>
gap> # Construct hatT (the diagonal subgroup)
gap> emb1:=Embedding(M,1);;
gap> emb2:=Embedding(M,2);;
gap> emb3:=Embedding(M,3);;
gap> emb4:=Embedding(M,4);;
gap> diag:=List(GeneratorsOfGroup(T), i->Image(emb1,i)*Image(emb2,i)*Image(emb3,i)*Image(emb4,i));
[ (1,2,3,4,5)(6,7,8,9,10)(11,12,13,14,15)(16,17,18,19,20), (3,4,5)(8,9,10)(13,14,15)(18,19,20) ]
gap> hatT:=Group(diag,());;
gap> IsSubgroup(M,hatT);
true
gap> # The filter above hatT is:
gap> fhatT := IntermediateSubgroups(M,hatT);;  
user interrupt at
blist[new] := true;
 called from
PermutationOp( g, D, act ) called from
Permutation( elm, HomeEnumerator( xset ), FunctionAction( xset ) ) called from
ImageElmActionHomomorphism( hom, gen ) called from
func( elm ) called from
List( gens, function ( gen )
      return ImageElmActionHomomorphism( hom, gen );
  end ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit
> ;
gap> S8:=SymmetricGroup(8);
Sym( [ 1 .. 8 ] )
gap> GeneratorsOfGroup(S8);
[ (1,2,3,4,5,6,7,8), (1,2) ]
gap> M:=DirectProduct(S8,S8,S8);
<permutation group of size 65548320768000 with 6 generators>
gap> GeneratorsOfGroup(M);
[ (1,2,3,4,5,6,7,8), (1,2), (9,10,11,12,13,14,15,16), (9,10), (17,18,19,20,21,22,23,24), (17,18) ]
gap> mgens := GeneratorsOfGroup(M);
[ (1,2,3,4,5,6,7,8), (1,2), (9,10,11,12,13,14,15,16), (9,10), (17,18,19,20,21,22,23,24), (17,18) ]
gap> hom1:=GroupHomomorphismByImages(M,M,mgens,mgens{Concatenation([15..21],[8..14],[1..7])});
List Elements: <list>[15] must have an assigned value
not in any function
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> M.generators;
Error, illegal access to record component `obj.generators'
of the object <obj>. (Objects by default do not have record components.
The error might be a relic from translated GAP3 code.)       called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> GeneratorsOfGroup(S4);
[ (1,2,3,4), (1,2) ]
gap> T:=AlternatingGroup(5);;
gap> S4:=SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> M:=DirectProduct(T,T,T,T);
<permutation group of size 12960000 with 8 generators>
gap> # Construct hatT (the diagonal subgroup)
gap> emb1:=Embedding(M,1);;
gap> emb2:=Embedding(M,2);;
gap> emb3:=Embedding(M,3);;
gap> emb4:=Embedding(M,4);;
gap> diag:=List(GeneratorsOfGroup(T), i->Image(emb1,i)*Image(emb2,i)*Image(emb3,i)*Image(emb4,i));
[ (1,2,3,4,5)(6,7,8,9,10)(11,12,13,14,15)(16,17,18,19,20), (3,4,5)(8,9,10)(13,14,15)(18,19,20) ]
gap> hatT:=Group(diag,());;
gap> IsSubgroup(M,hatT);
true
gap> # To describe automorphisms of M, we need the generators of M
gap> mgens:=GeneratorsOfGroup(M);
[ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10), (11,12,13,14,15), (13,14,15), (16,17,18,19,20), (18,19,20) ]
gap> 
gap> # Actions of S4 on M:
gap> actions:=List(GeneratorsOfGroup(S4), i->ConjugatorAutomorphism(M,i));
[ ^(1,2,3,4), ^(1,2) ]
gap> mgens:=GeneratorsOfGroup(M);
[ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10), (11,12,13,14,15), (13,14,15), (16,17,18,19,20), (18,19,20) ]
gap> s4gens:=GeneratorsOfGroup(S4);
[ (1,2,3,4), (1,2) ]
gap> # Actions of S4 on M:
gap> actions:=List(s4gens, i->ConjugatorAutomorphism(M,i));
[ ^(1,2,3,4), ^(1,2) ]
gap> alpha:=GroupHomomorphismByImages(S4, Group(actions), s4gens, actions);        
[ (1,2,3,4), (1,2) ] -> [ ^(1,2,3,4), ^(1,2) ]
gap> # Now we can form a corresponding semidirect product
gap> G:=SemidirectProduct(S4,alpha,M);
exceeded the permitted memory (`-o' command line option) at
rep := S.identity;
 called from
ElementsStabChain( StabChainMutable( G ) ) called from
AsSSortedList( S ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit
> ;
gap> Unbind();
Syntax error: identifier expected
Unbind();
       ^
gap> Unbind(*);
Syntax error: identifier expected
Unbind(*);
       ^
gap> quit;
