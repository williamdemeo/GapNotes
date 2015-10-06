gap> Read("PermutingSubgroups.g");
gap> Read("PermutingExamplesSearch.g");
Error, file "PermutingExamplesSearch.g" must exist and be readable called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Read("PermutingExampleSearch.g");
Checking the 2 group(s) of order 6
Checking the 1 group(s) of order 7
Checking the 5 group(s) of order 8
Checking the 2 group(s) of order 9
Checking the 2 group(s) of order 10
Checking the 1 group(s) of order 11
Checking the 5 group(s) of order 12
Checking the 1 group(s) of order 13
Checking the 2 group(s) of order 14
Checking the 1 group(s) of order 15
Checking the 14 group(s) of order 16
===============>  Candidate: SmallGroup(16, 3), H=cc[7], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(16, 3), H=cc[7], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(16, 3), H=cc[11], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(16, 11), H=cc[16], K=cc[18]    <=============== 
 ===============>  Candidate: SmallGroup(16, 11), H=cc[17], K=cc[19]    <=============== 
 Checking the 1 group(s) of order 17
Checking the 5 group(s) of order 18
===============>  Candidate: SmallGroup(18, 3), H=cc[5], K=cc[7]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[7], K=cc[8]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[7], K=cc[9]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[7], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[8], K=cc[9]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[8], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[9], K=cc[10]    <=============== 
 Checking the 1 group(s) of order 19
Checking the 5 group(s) of order 20
Checking the 2 group(s) of order 21
Checking the 2 group(s) of order 22
Checking the 1 group(s) of order 23
Checking the 15 group(s) of order 24
===============>  Candidate: SmallGroup(24, 6), H=cc[6], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(24, 6), H=cc[7], K=cc[11]    <=============== 
 ===============>  Candidate: SmallGroup(24, 6), H=cc[10], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(24, 6), H=cc[11], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[6], K=cc[11]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[8], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[8], K=cc[11]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[10], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[11], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(24, 12), H=cc[4], K=cc[9]    <=============== 
 ===============>  Candidate: SmallGroup(24, 12), H=cc[7], K=cc[8]    <=============== 
 ===============>  Candidate: SmallGroup(24, 12), H=cc[8], K=cc[9]    <=============== 
 ===============>  Candidate: SmallGroup(24, 13), H=cc[8], K=cc[9]    <=============== 
 The candidates are: 
[ [ 16, 3, 7, 10 ], [ 16, 3, 7, 12 ], [ 16, 3, 11, 12 ], [ 16, 11, 16, 18 ], [ 16, 11, 17, 19 ], [ 18, 3, 5, 7 ], [ 18, 4, 7, 8 ], 
  [ 18, 4, 7, 9 ], [ 18, 4, 7, 10 ], [ 18, 4, 8, 9 ], [ 18, 4, 8, 10 ], [ 18, 4, 9, 10 ], [ 24, 6, 6, 10 ], [ 24, 6, 7, 11 ], 
  [ 24, 6, 10, 12 ], [ 24, 6, 11, 12 ], [ 24, 8, 6, 11 ], [ 24, 8, 8, 10 ], [ 24, 8, 8, 11 ], [ 24, 8, 10, 12 ], [ 24, 8, 11, 12 ], 
  [ 24, 12, 4, 9 ], [ 24, 12, 7, 8 ], [ 24, 12, 8, 9 ], [ 24, 13, 8, 9 ] ]
gap> G:=SmallGroup(24,6);
<pc group of size 24 with 4 generators>
gap> StructureDescription(G);
"D24"
gap> G:=SmallGroup(24,8);
<pc group of size 24 with 4 generators>
gap> StructureDescription(G);
"(C6 x C2) : C2"
gap> G:=SmallGroup(24,12);
<pc group of size 24 with 4 generators>
gap> StructureDescription(G);
"S4"
gap> cc:=ConjugacyClassesSubgroups(G);;
gap> H:=cc[4];;
gap> StructureDescription(H);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `StructureDescription' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> H:=Representative(cc[4]);;
gap> StructureDescription(H);
"C3"
gap> U:=Representative(cc[9]);;
gap> StructureDescription(U);
"D8"
gap> ArePermuting(U,H);
true
gap> Normalizes(U,H);
false
gap> Normalizes(H,U);
false
gap> CUH:= CommutatorSubgroup(U,H);
Group([ f2, f3, f4 ])
gap> StructureDescription(CUH);
"A4"
gap> IsSubgroup(CUH,H);
true
gap> IsSubgroup(CUH,U);
false
gap> One(G);
<identity> of ...
gap> SubU:=IntermediateSubgroups(U,One(U));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `IntermediateSubgroups' on 2 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> U;
D8
gap> SubU:=IntermediateSubgroups(U,Group([One(U)]));
rec( subgroups := [ Group([ f4 ]), Group([ f3 ]), Group([ f3*f4 ]), Group([ f1 ]), Group([ f1*f3*f4 ]), Group([ f3, f4 ]), 
      Group([ f1, f3*f4 ]), Group([ f1*f4, f3*f4 ]) ], inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 1, 6 ], 
      [ 2, 6 ], [ 3, 6 ], [ 3, 7 ], [ 4, 7 ], [ 5, 7 ], [ 3, 8 ], [ 6, 9 ], [ 7, 9 ], [ 8, 9 ] ] )
gap> for V in SubU.subgroups do Print(ArePermuting(V,H), "  "); od;
false  false  false  true  false  true  false  false  gap> V:=SubU.subgroups[4];
Group([ f1 ])
gap> ArePermuting(V,H);
true
gap> StructureDescription(V);
"C2"
gap> W:=SubU.subgroups[4];
C2
gap> V:=SubU.subgroups[6];
Group([ f3, f4 ])
gap> StructureDescription(V);
"C2 x C2"
gap> IsSubgroup(CUH,V);
true
gap> CVH:=Commutator(V,H);
Variable: 'Commutator' must have a value

gap> CVH:=CommutatorSubgroup(V,H);
Group([ f3, f4 ])
gap> CVH:=CommutatorSubgroup(H,V);
Group([ f3, f4 ])
gap> CWH:=CommutatorSubgroup(W,H);
Group([ f2 ])
gap> StructureDescription(CWH);
"C3"
gap> CWH=H;
true
gap> List(SubU.subgroups, x->StructureDescription(Commutator(x,H)));
Syntax error: warning: unbound global variable
List(SubU.subgroups, x->StructureDescription(Commutator(x,H)));
                                                       ^
Variable: 'Commutator' must have an assigned value at
return StructureDescription( Commutator( x, H ) );
 called from
func( elm ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> List(SubU.subgroups, x->StructureDescription(CommutatorSubgroup(x,H)));
[ "C2 x C2", "C2 x C2", "C2 x C2", "C3", "A4", "C2 x C2", "A4", "A4" ]
gap> List(SubU.subgroups, x->StructureDescription(x));
[ "C2", "C2", "C2", "C2", "C2", "C2 x C2", "C2 x C2", "C4" ]
gap> SubV:=IntermediateSubgroups(V,Group([One(V)]));
rec( subgroups := [ Group([ f3 ]), Group([ f4 ]), Group([ f3*f4 ]) ], inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 4 ], [ 2, 4 ], 
      [ 3, 4 ] ] )
gap> List(SubV.subgroups, x->StructureDescription(CommutatorSubgroup(x,H)));
[ "C2 x C2", "C2 x C2", "C2 x C2" ]
gap> SubU;
rec( subgroups := [ C2, C2, C2, C2, C2, C2 x C2, C2 x C2, C4 ], inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], 
      [ 1, 6 ], [ 2, 6 ], [ 3, 6 ], [ 3, 7 ], [ 4, 7 ], [ 5, 7 ], [ 3, 8 ], [ 6, 9 ], [ 7, 9 ], [ 8, 9 ] ] )
gap> W;
C2
gap> IsNormal(G,CUH);
true
gap> IsNormal(G,CWH);
false
gap> IsNormal(G,CVH);
true
gap> IsNormal(G,V);
true
gap> IsNormal(G,U);
false
gap> IsNormal(G,W);
false
gap> IsNormal(G,H);
false
gap> Normalizes(H,W);
false
gap> Normalizes(W,H);
true
gap> Normalizes(V,H);
false
gap> Normalizes(H,V);
true
gap> List(SubV.subgroups, x->Normalizes(H,x));
[ false, false, false ]
gap> CHU:= CommutatorSubgroup(H,U);
Group([ f2, f3, f4 ])
gap> StructureDescription(CHU);
"A4"
gap> CHU=CUH;
true
gap> IsSubgroup(CUH,H);
true
gap> IsSubgroup(CUH,U);
false
gap> IsNormal(CUH,H);
false
gap> intHUH:=IntermediateSubgroups(G,H);
rec( subgroups := [ Group([ f1, f2 ]), Group([ f2, f3, f4 ]) ], inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
gap> a4;
Variable: 'a4' must have a value

gap> a4:=intHUH.subgroups[1];
Group([ f1, f2 ])
gap> StructureDescription(a4);
"S3"
gap> a4:=intHUH.subgroups[2];
Group([ f2, f3, f4 ])
gap> StructureDescription(a4);
"A4"
gap> K:=SubU.subgroups[5];
C2
gap> CKH:=CommutatorSubgroup(K,H);
Group([ f2, f3, f4 ])
gap> CVH;
Group([ f3, f4 ])
gap> StructureDescription(CVH);
"C2 x C2"
gap> CVH=V;
true
gap> CVH=H;
false
gap> List(SubU, x->ArePermuting(x,H));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `ListOp' on 2 arguments called from
CallFuncList( ListOp, arg ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> #List(SubU, x->ArePermuting(x,H));
gap> SubU;
rec( subgroups := [ C2, C2, C2, C2, C2, C2 x C2, C2 x C2, C4 ], inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], 
      [ 1, 6 ], [ 2, 6 ], [ 3, 6 ], [ 3, 7 ], [ 4, 7 ], [ 5, 7 ], [ 3, 8 ], [ 6, 9 ], [ 7, 9 ], [ 8, 9 ] ] )
gap> List(SubU.subgroups, x->ArePermuting(x,H));
[ false, false, false, true, false, true, false, false ]
gap> IsSubgroup(CUH,U);
false
gap> G:=SmallGroup(18,3);      # C3 x S3
<pc group of size 18 with 3 generators>
gap> G:=SmallGroup(18,3);      # C3 x S3
<pc group of size 18 with 3 generators>
gap> cc:=ConjugacyClassesSubgroups(G);;
gap> U:=Representative(cc[7]);;
gap> H:=Representative(cc[5]);;
gap> ArePermuting(U,H);
true
gap> Normalizes(H,V);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `ClosureGroup' on 2 arguments called from
ClosureGroup( H, K ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Normalizes(U,H);
false
gap> Normalizes(H,U);
false
gap> UH:=ClosureGroup(U,H);
Group([ f1, f2, f3 ])
gap> StructureDescription(UH);
"C3 x S3"
gap> U0:=Intersection(U,H);
Group([  ])
gap> IntU0U:=IntermediateSubgroups(U,U0);
rec( subgroups := [ Group([ f1 ]), Group([ f2 ]) ], inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
gap> IntHUH:=IntermediateSubgroups(H,UH);
Error, <N> must be a normal subgroup of <G> called from
NaturalHomomorphismByNormalSubgroup( G, N ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> IntHUH:=IntermediateSubgroups(UH,H);
rec( subgroups := [ Group([ f2*f3, f3 ]) ], inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
gap> K:=IntHUH.subgroups[1];
Group([ f2*f3, f3 ])
gap> V:=IntU0U.subgroups[1];
Group([ f1 ])
gap> W:=IntU0U.subgroups[2];
Group([ f2 ])
gap> StructureDescription(K);
"C3 x C3"
gap> StructureDescription(V);
"C2"
gap> StructureDescription(W);
"C3"
gap> ArePermuting(V,H);
false
gap> ArePermuting(W,H);
true
gap> CWH:=CommutatorSubgroup(W,H);
Group([ <identity> of ... ])
gap> CVH:=CommutatorSubgroup(V,H);
Group([ f3 ])
gap> StructureDescription(CVH);
"C3"
gap> CVH=H;
false
gap> StructureDescription(V);
"C2"
gap> IsSubgroup(CVH,V);
false
gap> IsSubgroup(CVH,H);
false
gap> IsSubgroup(H,CVH);
false
gap> IsSubgroup(UH,CVH);
true
gap> IsSubgroup(U,CVH);
false
gap> IsSubgroup(U,V);
true
gap> IsSubgroup(K,CVH);
true
gap> CVH=W;
false
gap> CVH=V;
false
gap> SubK:=IntermediateSubgroups(K,Group([One(K)]));
rec( subgroups := [ Group([ f2*f3 ]), Group([ f3 ]), Group([ f2*f3^2 ]), Group([ f2 ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> List(SubK.subgroups, x->StructureDescription(x));
[ "C3", "C3", "C3", "C3" ]
gap> StructureDescription(K);
"C3 x C3"
gap> CVH=SubK.subgroups[1];
false
gap> CVH=SubK.subgroups[2];
true
gap> W=SubK.subgroups[1];
false
gap> W=SubK.subgroups[3];
false
gap> W=SubK.subgroups[4];
true
gap> H=SubK.subgroups[3];
false
gap> H=SubK.subgroups[1];
true
gap> 