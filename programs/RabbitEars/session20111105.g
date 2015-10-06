gap> G:=Group([(1,2), (1,2,3)]);
Group([ (1,2), (1,2,3) ])
gap> G:=Action(G,G,OnRight);
Group([ (1,5)(2,4)(3,6), (1,2,3)(4,5,6) ])
gap> for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
[ [ 1, 5 ], [ 2, 6 ], [ 3, 4 ] ]
[ [ 1, 2, 3 ], [ 4, 5, 6 ] ]
[ [ 1, 4 ], [ 2, 5 ], [ 3, 6 ] ]
[ [ 1, 6 ], [ 3, 5 ], [ 2, 4 ] ]
gap> Read("OverAlgebras.g");
gap> OverAlgebra(G, [1,4], "S3");
Function: number of arguments must be 1 (not 3)
not in any function
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace the argument list <args> via 'return <args>;' to continue
brk> quit;
gap> OverAlgebra(G, [1,4], "S3");
Function: number of arguments must be 1 (not 3)
not in any function
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace the argument list <args> via 'return <args>;' to continue
brk> quit;
gap> OverAlgebra([G, [1,4], "S3"]);
OverAlgebra called with the following arguments: 
args[1] = Group( [ (1,5)(2,4)(3,6), (1,2,3)(4,5,6) ] )
args[2] = [ 1, 4 ]
args[3] = S3
uacalc file: /tmp/OverAlgebras/OverAlgebra-S3-0-3.ua
axes = [ 1, 4 ]
B0 = [ 1, 2, 3, 4, 5, 6 ]
B1 = [ 1, 7, 8, 9, 10, 11 ]
B2 = [ 12, 13, 14, 4, 15, 16 ]
p0[1] = ( 2, 7)( 3, 8)( 4, 9)( 5,10)( 6,11)
p0[2] = ( 1,12)( 2,13)( 3,14)( 5,15)( 6,16)
s = [ 1, 2, 3, 4, 5, 6, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4 ]
gap> Read("gap2uacalc.g");
Syntax error: warning: unbound global variable in gap2uacalc.g line 170
    pathname := getPathName();
                           ^
gap> Read("gap2uacalc.g");
gap> gset2uacalc([G,"S3set"]);
gap> gg:=SymmetricGroup(3);
Sym( [ 1 .. 3 ] )
gap> group2uacalc([gg,"S3"]);
gap> groups2uacalc(6);
gap> NumberSmallGroups(6);
2
gap> NumberSmallGroups(15);
1
gap> NumberSmallGroups(14);
2
gap> NumberSmallGroups(12);
5
gap> NumberSmallGroups(16);
14
gap> NumberSmallGroups(32);
51
gap> OverAlgebra([G, [1,4], "S3"]);
OverAlgebra called with the following arguments: 
args[1] = Group( [ (1,5)(2,4)(3,6), (1,2,3)(4,5,6) ] )
args[2] = [ 1, 4 ]
args[3] = S3
uacalc file: /tmp/OverAlgebras/OverAlgebra-S3-0-3.ua
axes = [ 1, 4 ]
B0 = [ 1, 2, 3, 4, 5, 6 ]
B1 = [ 1, 7, 8, 9, 10, 11 ]
B2 = [ 12, 13, 14, 4, 15, 16 ]
p0[1] = ( 2, 7)( 3, 8)( 4, 9)( 5,10)( 6,11)
p0[2] = ( 1,12)( 2,13)( 3,14)( 5,15)( 6,16)
s = [ 1, 2, 3, 4, 5, 6, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4 ]
gap> G
> ;
S3
gap> OverAlgebra([G, [1,4]]);
OverAlgebra called with the following arguments: 
args[1] = Group( [ (1,5)(2,4)(3,6), (1,2,3)(4,5,6) ] )
args[2] = [ 1, 4 ]
uacalc file: /tmp/OverAlgebras/OverAlgebra-S3-0-3.ua
axes = [ 1, 4 ]
B0 = [ 1, 2, 3, 4, 5, 6 ]
B1 = [ 1, 7, 8, 9, 10, 11 ]
B2 = [ 12, 13, 14, 4, 15, 16 ]
p0[1] = ( 2, 7)( 3, 8)( 4, 9)( 5,10)( 6,11)
p0[2] = ( 1,12)( 2,13)( 3,14)( 5,15)( 6,16)
s = [ 1, 2, 3, 4, 5, 6, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4 ]
gap> Read("OverAlgebras.g");
gap> OverAlgebra([G, [1,4]]);
OverAlgebra called with the following arguments: 
args[1] = Group( [ (1,5)(2,4)(3,6), (1,2,3)(4,5,6) ] )
args[2] = [ 1, 4 ]
uacalc file: ./OverAlgebra-S3-0-3.ua
axes = [ 1, 4 ]
B0 = [ 1, 2, 3, 4, 5, 6 ]
B1 = [ 1, 7, 8, 9, 10, 11 ]
B2 = [ 12, 13, 14, 4, 15, 16 ]
p0[1] = ( 2, 7)( 3, 8)( 4, 9)( 5,10)( 6,11)
p0[2] = ( 1,12)( 2,13)( 3,14)( 5,15)( 6,16)
s = [ 1, 2, 3, 4, 5, 6, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4 ]
gap> OverAlgebra([G, [1,3]]);
OverAlgebra called with the following arguments: 
args[1] = Group( [ (1,5)(2,4)(3,6), (1,2,3)(4,5,6) ] )
args[2] = [ 1, 3 ]
uacalc file: ./OverAlgebra-S3-0-2.ua
axes = [ 1, 3 ]
B0 = [ 1, 2, 3, 4, 5, 6 ]
B1 = [ 1, 7, 8, 9, 10, 11 ]
B2 = [ 12, 13, 3, 14, 15, 16 ]
p0[1] = ( 2, 7)( 3, 8)( 4, 9)( 5,10)( 6,11)
p0[2] = ( 1,12)( 2,13)( 4,14)( 5,15)( 6,16)
s = [ 1, 2, 3, 4, 5, 6, 1, 1, 1, 1, 1, 3, 3, 3, 3, 3 ]
gap> LogTo();
