gap> s4 := SymmetricGroup(4);; gl23 := GL(2,3);;
gap> List([a..z]);
Variable: 'a' must have a value

gap> List('a','b');
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `ListOp' on 2 arguments called from
CallFuncList( ListOp, arg ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> List(["a", "b"]);
[ "a", "b" ]
gap> alphabet :=last;
[ "a", "b" ]
gap> alphabet[1];
"a"
gap> alphabet := List([a, b]);
Variable: 'a' must have a value

gap> alphabet := List(['a', 'b']);
"ab"
gap> alphabet[1];
'a'
gap> alphabet[2];
'b'
gap> alphabet := "abcdefg";
"abcdefg"
gap> alphabet[1];
'a'
gap> NamesUserGVars();
[ "alphabet", "gl23", "s4", "~" ]
gap> cc := ConjugacyClasses(s4);
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> for i in cc do
> SetName(i, alphabet[i]);
> od;
List Element: <position> must be a positive integer (not a object (component)) at
SetName( i, alphabet[i] );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <position> via 'return <position>;' to continue
brk> quit;
gap> for i in cc do
> SetName(cc[i], alphabet[i]);
> od;
List Element: <position> must be a positive integer (not a object (component)) at
SetName( cc[i], alphabet[i] );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <position> via 'return <position>;' to continue
brk> quit;
gap> nn := Size(cc);
5
gap> for i in [1..nn] do
> SetName(cc[i], alphabet[i]);
> od;
Error, SetName: <name> must be a string called from
SetName( cc[i], alphabet[i] ); called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> alphabet[nn];
'e'
gap> IsString(alphabet[nn]);
false
gap> "alphabet[nn]";
"alphabet[nn]"
gap> TypeObj(alphabet[1]);
NewType( NewFamily( "CharsFamily", [ 196 ], [ 196 ] ), [ 34, 196 ] )
gap> CharacterString(alphabet[1]);
Function: number of arguments must be 2 (not 1)
not in any function
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace the argument list <args> via 'return <args>;' to continue
brk> quit;
gap> String(alphabet[1]);
"'a'"
gap> alphabet
> ;
"abcdefg"
gap> alphabet:= abcdef;
Variable: 'abcdef' must have a value

gap> IsString('a');
false
gap> IsChar('a');
true
gap> ConvertToStringRep(alphabet[1]);
ConvString: <string> must be a string (not a character)
not in any function
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <string> via 'return <string>;' to continue
brk> quit;
gap> ll := ['a', 'b']; IsStringRep( ll ); ConvertToStringRep(ll);
"ab"
false
gap> ll
> ;
"ab"
gap> IsStringRep(ll);
true
gap> Alpha;
<Operation "Alpha">
gap> alphabet[1];
'a'
gap> String(alphabet[1]);
"'a'"
gap> WordAlp(alphabet, 1);
"a"
gap> for i in [1..nn] do
> SetName(cc[i], WordAlp(alphabet, i));
> od;
gap> cc
> ;
[ a, b, c, d, e ]
gap> cc[1]
> ;
a
gap> Elements(a);
Variable: 'a' must have a value

gap> Elements(cc[1]);
[ () ]
gap> Elements(cc[2]);
[ (3,4), (2,3), (2,4), (1,2), (1,3), (1,4) ]
gap> MaximalSubgroupsClassReps(s4);
Variable: 'MaximalSubgroupsClassReps' must have a value

gap> MaximalSubgroupClassReps(s4);
[ Alt( [ 1 .. 4 ] ), Group([ (1,2,3), (1,2) ]), Group([ (1,2), (3,4), (1,3)(2,4) ]) ]
gap> cc := ConjugacyClasses(s4);
[ a, b, c, d, e ]
gap> cc[1];
a
gap> S4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> cc := ConjugacyClasses(S4);
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> ccRenamed := cc;
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> for i in [1..nn] do
> SetName(ccRenamed[i], WordAlp(alphabet, i));
> od;
gap> cc;
[ a, b, c, d, e ]
gap> s4 := SymmetricGroup(s4);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `SymmetricGroupCons' on 2 arguments called from
SymmetricGroupCons( IsPermGroup, arg[1] ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> s4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
brk> cc := ConjugacyClasses(s4);
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
brk> ccCopy := ShallowCopy(cc);
Syntax error: warning: unbound global variable in *errin* line 3
ccCopy := ShallowCopy(cc);
        ^
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
brk> quit;
gap> ccCopy;
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> cc;
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> for i in [1..nn] do
> SetName(ccCopy[i], WordAlp(alphabet, i));
> od
> ;
gap> cc
> ;
[ a, b, c, d, e ]
gap> ccCopy;
[ a, b, c, d, e ]
gap> S4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> s4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> cc := ConjugacyClasses(s4);
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> ccCopy := ConjugacyClasses(S4);
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> for i in [1..nn] do
> SetName(ccCopy[i], WordAlp(alphabet, i));
> od;
gap> cc;
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> ccCopy;
[ a, b, c, d, e ]
gap> Elements(cc[1]);
[ () ]
gap> Elements(cc[2]);
[ (3,4), (2,3), (2,4), (1,2), (1,3), (1,4) ]
gap> mscr[1];
Variable: 'mscr' must have a value

gap> mscr:= MaximalSubgroupReps(s4);
Variable: 'MaximalSubgroupReps' must have a value

gap> mscr:= MaximalSubgroupReps(s4);
Variable: 'MaximalSubgroupReps' must have a value

gap> 
gap> mscr:= MaximalSubgroupClassReps(s4);
[ Alt( [ 1 .. 4 ] ), Group([ (1,2,3), (1,2) ]), Group([ (1,2), (3,4), (1,3)(2,4) ]) ]
gap> mscr[1];
Alt( [ 1 .. 4 ] )
gap> Intersection(Elements(mscr[1]), Elements(cc[1]));
[ () ]
gap> Intersection(Elements(mscr[1]), Elements(cc[2]));
[  ]
gap> Intersection(Elements(mscr[1]), Elements(cc[3]));
[ (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]
gap> Intersection(Elements(mscr[1]), Elements(cc[4]));
[ (2,3,4), (2,4,3), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,4,2), (1,4,3) ]
gap> IsEmpty(Intersection(Elements(mscr[1]), Elements(cc[4])));
false
gap> IsEmpty(Intersection(Elements(mscr[1]), Elements(cc[1])));
false
gap> IsEmpty(Intersection(Elements(mscr[1]), Elements(cc[2])));
true
gap> S4;
Sym( [ 1 .. 4 ] )
gap> Name(S4);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Name' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> S4.name;
Error, illegal access to record component `obj.name'
of the object <obj>. (Objects by default do not have record components.
The error might be a relic from translated GAP3 code.)       called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> SetName(S4, "S4");
gap> Name(S4);
"S4"
gap> S4;
S4
gap> Name(s4);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Name' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> date;
Variable: 'date' must have a value

gap> Print(msrc[1]);
Variable: 'msrc' must have a value

gap> msrc;
Variable: 'msrc' must have a value

gap> mscr;
[ Alt( [ 1 .. 4 ] ), Group([ (1,2,3), (1,2) ]), Group([ (1,2), (3,4), (1,3)(2,4) ]) ]
gap> Print(mscr[1]);
AlternatingGroup( [ 1 .. 4 ] )gap> ;
gap> Print(ccRenamed[1]);
agap> Print(ccRenamed[1], "\n");
a
gap> Print(ccRenamed[1], \n);
Variable: '
' must have a value

gap> Read("testConjecture.g");
Error, file "testConjecture.g" must exist and be readable called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Read("testConjecture.g");
Syntax error: end expected in testConjecture.g line 19
    local cc, numcc, ccRenamed;
        ^
gap> Read("testConjecture.g");
Syntax error: ; expected in testConjecture.g line 23
    alphabet := "abcdefghijklmnopqrstuvwxyz";
           ^
Syntax error: warning: unbound global variable in testConjecture.g line 46
        nSetName(mscrRenamed[i],WordAlp(Alphabet, i));
                ^
gap> Read("testConjecture.g");
Syntax error: warning: unbound global variable in testConjecture.g line 46
        nSetName(mscrRenamed[i],WordAlp(Alphabet, i));
                ^
gap> Read("testConjecture.g");
gap> s4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> S4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> name := "S4";
"S4"
gap> testConjecture(s4, S4, name);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `SUM' on 2 arguments called from
pathname + name called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> testConjecture(s4, S4, name);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `SUM' on 2 arguments called from
pathname + name called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name);
Error, You cannot loop over the integer 5 did you mean the range [1..5] called from
Size( ccRenamed ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name);
List Element: <list>[5] must have an assigned value at
SetName( mscrRenamed[i], WordAlp( Alphabet, i ) );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> mscr;
[ Alt( [ 1 .. 4 ] ), Group([ (1,2,3), (1,2) ]), Group([ (1,2), (3,4), (1,3)(2,4) ]) ]
gap> Size(mscr);
3
gap> nummscr;
Variable: 'nummscr' must have a value

gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name);
gap> name;
"S4"
gap> outfile;
Variable: 'outfile' must have a value

gap>  pathname := "~/pub/DeMeo/research/LatticeTheory/ResearchNotes/Bertram/";
"~/pub/DeMeo/research/LatticeTheory/ResearchNotes/Bertram/"
gap>     outfile := Concatenation(pathname, name, ".out");
"~/pub/DeMeo/research/LatticeTheory/ResearchNotes/Bertram/S4.out"
gap> mscrRenamed[1];
Variable: 'mscrRenamed' must have a value

gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name);
gap> mscr[1];
Alt( [ 1 .. 4 ] )
gap> PrintTo(outfile, mscr[1]);
gap> PrintTo(outfile, mscr[1], ": ");
gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name);
gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name);
gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name);
gap> Read("testConjecture.g");
Syntax error: ; expected in testConjecture.g line 39
     for i in [1..numcc] do
       ^
Syntax error: end expected in testConjecture.g line 44
    od;
     ^
gap> Read("testConjecture.g");
Syntax error: od expected in testConjecture.g line 81
end;;  ^
gap> Read("testConjecture.g");
Syntax error: od expected in testConjecture.g line 81
end;;  ^
gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name, 1);
<expr> must be 'true' or 'false' (not a integer) at
if verbose  then
    AppendTo( outfile, "\nConjugacy Classes: \n" );
fi;
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <expr> via 'return <expr>;' to continue
brk> quit;
gap> testConjecture(s4, S4, name, true);
gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name, true);
gap> Read("testConjecture.g");
gap> testConjecture(s4, S4, name, true);
gap> G := GL(2,3);
GL(2,3)
gap> g := GL(2,3);
GL(2,3)
gap> name;
"S4"
gap> name := "GL23";
"GL23"
gap> testConjecture(G, g, name, true);
gap> Read("testConjecture.g");
gap> testConjecture(G, g, name, true);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `IsNormal' on 1 arguments called from
IsNormal( mscr[i] ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> mscr;
[ Alt( [ 1 .. 4 ] ), Group([ (1,2,3), (1,2) ]), Group([ (1,2), (3,4), (1,3)(2,4) ]) ]
gap> IsNormal(mscr[1]);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `IsNormal' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> mscr[1];
Alt( [ 1 .. 4 ] )
gap> IsNormal(s4, mscr[1]);
true
gap> Read("testConjecture.g");
gap> testConjecture(G, g, name, true);
gap> testConjecture(s4, S4, name, true);
gap> testConjecture(G, g, name, true);
gap> name := "S4";
"S4"
gap> testConjecture(s4, S4, name, true);
gap> quit;
