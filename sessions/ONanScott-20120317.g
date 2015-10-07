gap> g:=AlternatingGroup(5);
Alt( [ 1 .. 5 ] )
gap> h:=DirectProduct(g,g);
Group([ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ])
gap> p:=List([1,2],i->Projection(h,i));
[ 1st projection of Group([ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ]), 
  2nd projection of Group([ (1,2,3,4,5), (3,4,5), (6,7,8,9,10), (8,9,10) ]) ]
gap> Order(h);
3600
gap> #ac:=Action(h,AsList(g),actfun
gap> Read("actfun.g");
Error, file "actfun.g" must exist and be readable called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Read("../programs/actfun.g");
gap> actfun
> ;
function( x, h ) ... end
gap> ac:=Action(h,AsList(g),actfun(g,h));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `POW' on 2 arguments called from
Image( p[1], h ) ^ -1 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> ac:=Action(h,AsList(g), function(g,h) return Image(p[1],h)^-1*g*Image(p[2],h);end);
<permutation group with 4 generators>
gap> Size(ac);
3600
gap> StructureDescription(ac);
"A5 x A5"
gap> ONanScottType(ac);
"3a"
gap> 
gap> 
gap> Read("session-20120318.g");
Error, file "session-20120318.g" must exist and be readable called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Read("session-20120317.g");
Variable: '
' must have an assigned value at
Print( "PrimitiveGroup(", i, ",", j, ") = ", StructureDescription( G ), \
   );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> Read("session-20120317.g");
Variable: '
' must have an assigned value at
Print( StructureDescription( G ), \
   );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> Read("session-20120317.g");
Variable: '
' must have an assigned value at
Print( "PrimitiveGroup(", i, ",", j, ") = ", StructureDescription( G ), \
   );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> Read("session-20120317.g");
PrimitiveGroup(5,4)
PrimitiveGroup(5,5)
PrimitiveGroup(6,1)
PrimitiveGroup(6,2)
PrimitiveGroup(6,3)
PrimitiveGroup(6,4)
PrimitiveGroup(7,5)
PrimitiveGroup(7,6)
PrimitiveGroup(7,7)
PrimitiveGroup(8,4)
PrimitiveGroup(8,5)
PrimitiveGroup(8,6)
PrimitiveGroup(8,7)
PrimitiveGroup(9,8)
PrimitiveGroup(9,9)
PrimitiveGroup(9,10)
PrimitiveGroup(9,11)
PrimitiveGroup(10,1)
PrimitiveGroup(10,2)
PrimitiveGroup(10,3)
PrimitiveGroup(10,4)
PrimitiveGroup(10,5)
PrimitiveGroup(10,6)
PrimitiveGroup(10,7)
PrimitiveGroup(10,8)
PrimitiveGroup(10,9)
PrimitiveGroup(11,5)
PrimitiveGroup(11,6)
PrimitiveGroup(11,7)
PrimitiveGroup(11,8)
PrimitiveGroup(12,1)
PrimitiveGroup(12,2)
PrimitiveGroup(12,3)
PrimitiveGroup(12,4)
PrimitiveGroup(12,5)
PrimitiveGroup(12,6)
PrimitiveGroup(13,7)
PrimitiveGroup(13,8)
PrimitiveGroup(13,9)
PrimitiveGroup(14,1)
PrimitiveGroup(14,2)
PrimitiveGroup(14,3)
PrimitiveGroup(14,4)
PrimitiveGroup(15,1)
PrimitiveGroup(15,2)
PrimitiveGroup(15,3)
PrimitiveGroup(15,4)
PrimitiveGroup(15,5)
PrimitiveGroup(15,6)
PrimitiveGroup(16,21)
PrimitiveGroup(16,22)
PrimitiveGroup(17,6)
PrimitiveGroup(17,7)
PrimitiveGroup(17,8)
PrimitiveGroup(17,9)
PrimitiveGroup(17,10)
PrimitiveGroup(18,1)
PrimitiveGroup(18,2)
PrimitiveGroup(18,3)
PrimitiveGroup(18,4)
PrimitiveGroup(19,7)
PrimitiveGroup(19,8)
PrimitiveGroup(20,1)
PrimitiveGroup(20,2)
PrimitiveGroup(20,3)
PrimitiveGroup(20,4)
PrimitiveGroup(21,1)
PrimitiveGroup(21,2)
PrimitiveGroup(21,3)
PrimitiveGroup(21,4)
PrimitiveGroup(21,5)
PrimitiveGroup(21,6)
PrimitiveGroup(21,7)
PrimitiveGroup(21,8)
PrimitiveGroup(21,9)
PrimitiveGroup(22,1)
PrimitiveGroup(22,2)
PrimitiveGroup(22,3)
PrimitiveGroup(22,4)
PrimitiveGroup(23,5)
PrimitiveGroup(23,6)
PrimitiveGroup(23,7)
PrimitiveGroup(24,1)
PrimitiveGroup(24,2)
PrimitiveGroup(24,3)
PrimitiveGroup(24,4)
PrimitiveGroup(24,5)
PrimitiveGroup(25,27)
PrimitiveGroup(25,28)
PrimitiveGroup(26,1)
PrimitiveGroup(26,2)
PrimitiveGroup(26,3)
PrimitiveGroup(26,4)
PrimitiveGroup(26,5)
PrimitiveGroup(26,6)
PrimitiveGroup(26,7)
PrimitiveGroup(27,12)
PrimitiveGroup(27,13)
PrimitiveGroup(27,14)
PrimitiveGroup(27,15)
PrimitiveGroup(28,1)
PrimitiveGroup(28,2)
PrimitiveGroup(28,3)
PrimitiveGroup(28,4)
PrimitiveGroup(28,5)
PrimitiveGroup(28,6)
PrimitiveGroup(28,7)
PrimitiveGroup(28,8)
PrimitiveGroup(28,9)
PrimitiveGroup(28,10)
PrimitiveGroup(28,11)
PrimitiveGroup(28,12)
PrimitiveGroup(28,13)
PrimitiveGroup(28,14)
PrimitiveGroup(29,7)
PrimitiveGroup(29,8)
PrimitiveGroup(30,1)
PrimitiveGroup(30,2)
PrimitiveGroup(30,3)
PrimitiveGroup(30,4)
PrimitiveGroup(31,9)
PrimitiveGroup(31,10)
PrimitiveGroup(31,11)
PrimitiveGroup(31,12)
PrimitiveGroup(32,4)
PrimitiveGroup(32,5)
PrimitiveGroup(32,6)
PrimitiveGroup(32,7)
PrimitiveGroup(33,1)
PrimitiveGroup(33,2)
PrimitiveGroup(33,3)
PrimitiveGroup(33,4)
PrimitiveGroup(34,1)
PrimitiveGroup(34,2)
PrimitiveGroup(35,1)
PrimitiveGroup(35,2)
PrimitiveGroup(35,3)
PrimitiveGroup(35,4)
PrimitiveGroup(35,5)
PrimitiveGroup(35,6)
PrimitiveGroup(36,1)
PrimitiveGroup(36,2)
PrimitiveGroup(36,3)
PrimitiveGroup(36,4)
PrimitiveGroup(36,5)
PrimitiveGroup(36,6)
PrimitiveGroup(36,7)
PrimitiveGroup(36,8)
PrimitiveGroup(36,9)
PrimitiveGroup(36,10)
PrimitiveGroup(36,11)
PrimitiveGroup(36,12)
PrimitiveGroup(36,21)
PrimitiveGroup(36,22)
PrimitiveGroup(37,10)
PrimitiveGroup(37,11)
PrimitiveGroup(38,1)
PrimitiveGroup(38,2)
PrimitiveGroup(38,3)
PrimitiveGroup(38,4)
PrimitiveGroup(39,1)
PrimitiveGroup(39,2)
PrimitiveGroup(40,1)
PrimitiveGroup(40,2)
PrimitiveGroup(40,3)
PrimitiveGroup(40,4)
PrimitiveGroup(40,5)
PrimitiveGroup(40,6)
PrimitiveGroup(40,7)
PrimitiveGroup(40,8)
PrimitiveGroup(41,9)
PrimitiveGroup(41,10)
PrimitiveGroup(42,1)
PrimitiveGroup(42,2)
PrimitiveGroup(42,3)
PrimitiveGroup(42,4)
PrimitiveGroup(43,9)
PrimitiveGroup(43,10)
PrimitiveGroup(44,1)
PrimitiveGroup(44,2)
PrimitiveGroup(44,3)
PrimitiveGroup(44,4)
PrimitiveGroup(45,1)
PrimitiveGroup(45,2)
PrimitiveGroup(45,3)
PrimitiveGroup(45,4)
PrimitiveGroup(45,5)
PrimitiveGroup(45,6)
PrimitiveGroup(45,7)
PrimitiveGroup(45,8)
PrimitiveGroup(45,9)
PrimitiveGroup(46,1)
PrimitiveGroup(46,2)
PrimitiveGroup(47,5)
PrimitiveGroup(47,6)
PrimitiveGroup(48,1)
PrimitiveGroup(48,2)
PrimitiveGroup(48,3)
PrimitiveGroup(48,4)
PrimitiveGroup(49,39)
PrimitiveGroup(49,40)
PrimitiveGroup(50,1)
PrimitiveGroup(50,2)
PrimitiveGroup(50,3)
PrimitiveGroup(50,4)
PrimitiveGroup(50,5)
PrimitiveGroup(50,6)
PrimitiveGroup(50,7)
PrimitiveGroup(50,8)
PrimitiveGroup(50,9)
PrimitiveGroup(51,1)
PrimitiveGroup(51,2)
PrimitiveGroup(52,1)
PrimitiveGroup(52,2)
PrimitiveGroup(52,3)
PrimitiveGroup(53,7)
PrimitiveGroup(53,8)
PrimitiveGroup(54,1)
PrimitiveGroup(54,2)
PrimitiveGroup(54,3)
PrimitiveGroup(54,4)
PrimitiveGroup(55,1)
PrimitiveGroup(55,2)
PrimitiveGroup(55,3)
PrimitiveGroup(55,4)
PrimitiveGroup(55,5)
PrimitiveGroup(55,6)
PrimitiveGroup(55,7)
PrimitiveGroup(55,8)
PrimitiveGroup(56,1)
PrimitiveGroup(56,2)
PrimitiveGroup(56,3)
PrimitiveGroup(56,4)
PrimitiveGroup(56,5)
PrimitiveGroup(56,6)
PrimitiveGroup(56,7)
PrimitiveGroup(56,8)
PrimitiveGroup(56,9)
PrimitiveGroup(57,1)
PrimitiveGroup(57,2)
PrimitiveGroup(57,3)
PrimitiveGroup(57,4)
PrimitiveGroup(57,5)
PrimitiveGroup(58,1)
PrimitiveGroup(58,2)
PrimitiveGroup(59,5)
PrimitiveGroup(59,6)
PrimitiveGroup(60,6)
PrimitiveGroup(60,7)
PrimitiveGroup(60,8)
PrimitiveGroup(60,9)
PrimitiveGroup(61,13)
PrimitiveGroup(61,14)
PrimitiveGroup(62,1)
PrimitiveGroup(62,2)
PrimitiveGroup(62,3)
PrimitiveGroup(62,4)
PrimitiveGroup(63,1)
PrimitiveGroup(63,2)
PrimitiveGroup(63,3)
PrimitiveGroup(63,4)
PrimitiveGroup(63,5)
PrimitiveGroup(63,6)
PrimitiveGroup(63,7)
PrimitiveGroup(63,8)
PrimitiveGroup(64,73)
PrimitiveGroup(64,74)
PrimitiveGroup(65,1)
PrimitiveGroup(65,2)
PrimitiveGroup(65,3)
PrimitiveGroup(65,4)
PrimitiveGroup(65,5)
PrimitiveGroup(65,6)
PrimitiveGroup(65,7)
PrimitiveGroup(65,8)
PrimitiveGroup(65,9)
PrimitiveGroup(65,10)
PrimitiveGroup(65,11)
PrimitiveGroup(65,12)
PrimitiveGroup(65,13)
PrimitiveGroup(66,1)
PrimitiveGroup(66,2)
PrimitiveGroup(66,3)
PrimitiveGroup(66,4)
PrimitiveGroup(66,5)
PrimitiveGroup(66,6)
PrimitiveGroup(66,7)
PrimitiveGroup(67,9)
PrimitiveGroup(67,10)
PrimitiveGroup(68,1)
PrimitiveGroup(68,2)
PrimitiveGroup(68,3)
PrimitiveGroup(68,4)
PrimitiveGroup(68,5)
PrimitiveGroup(68,6)
PrimitiveGroup(68,7)
PrimitiveGroup(69,1)
PrimitiveGroup(69,2)
PrimitiveGroup(70,1)
PrimitiveGroup(70,2)
PrimitiveGroup(71,9)
PrimitiveGroup(71,10)
PrimitiveGroup(72,1)
PrimitiveGroup(72,2)
PrimitiveGroup(72,3)
PrimitiveGroup(72,4)
PrimitiveGroup(73,13)
PrimitiveGroup(73,14)
PrimitiveGroup(73,15)
PrimitiveGroup(73,16)
PrimitiveGroup(74,1)
PrimitiveGroup(74,2)
PrimitiveGroup(74,3)
PrimitiveGroup(74,4)
PrimitiveGroup(75,1)
PrimitiveGroup(75,2)
PrimitiveGroup(76,1)
PrimitiveGroup(76,2)
PrimitiveGroup(77,1)
PrimitiveGroup(77,2)
PrimitiveGroup(77,3)
PrimitiveGroup(77,4)
PrimitiveGroup(78,1)
PrimitiveGroup(78,2)
PrimitiveGroup(78,3)
PrimitiveGroup(78,4)
PrimitiveGroup(78,5)
PrimitiveGroup(78,6)
PrimitiveGroup(79,9)
PrimitiveGroup(79,10)
PrimitiveGroup(80,1)
PrimitiveGroup(80,2)
PrimitiveGroup(80,3)
PrimitiveGroup(80,4)
PrimitiveGroup(81,154)
PrimitiveGroup(81,155)
PrimitiveGroup(82,1)
PrimitiveGroup(82,2)
PrimitiveGroup(82,3)
PrimitiveGroup(82,4)
PrimitiveGroup(82,5)
PrimitiveGroup(82,6)
PrimitiveGroup(82,7)
PrimitiveGroup(82,8)
PrimitiveGroup(82,9)
PrimitiveGroup(82,10)
PrimitiveGroup(83,5)
PrimitiveGroup(83,6)
PrimitiveGroup(84,1)
PrimitiveGroup(84,2)
PrimitiveGroup(84,3)
PrimitiveGroup(84,4)
PrimitiveGroup(84,5)
PrimitiveGroup(84,6)
PrimitiveGroup(85,1)
PrimitiveGroup(85,2)
PrimitiveGroup(85,3)
PrimitiveGroup(85,4)
PrimitiveGroup(85,5)
PrimitiveGroup(85,6)
PrimitiveGroup(86,1)
PrimitiveGroup(86,2)
PrimitiveGroup(87,1)
PrimitiveGroup(87,2)
PrimitiveGroup(88,1)
PrimitiveGroup(88,2)
PrimitiveGroup(89,9)
PrimitiveGroup(89,10)
PrimitiveGroup(90,1)
PrimitiveGroup(90,2)
PrimitiveGroup(90,3)
PrimitiveGroup(90,4)
PrimitiveGroup(91,1)
PrimitiveGroup(91,2)
PrimitiveGroup(91,3)
PrimitiveGroup(91,4)
PrimitiveGroup(91,5)
PrimitiveGroup(91,6)
PrimitiveGroup(91,7)
PrimitiveGroup(91,8)
PrimitiveGroup(91,9)
PrimitiveGroup(91,10)
PrimitiveGroup(92,1)
PrimitiveGroup(92,2)
PrimitiveGroup(93,1)
PrimitiveGroup(93,2)
PrimitiveGroup(94,1)
PrimitiveGroup(94,2)
PrimitiveGroup(95,1)
PrimitiveGroup(95,2)
PrimitiveGroup(96,1)
PrimitiveGroup(96,2)
PrimitiveGroup(97,13)
PrimitiveGroup(97,14)
PrimitiveGroup(98,1)
PrimitiveGroup(98,2)
PrimitiveGroup(98,3)
PrimitiveGroup(98,4)
PrimitiveGroup(99,1)
PrimitiveGroup(99,2)
PrimitiveGroup(100,1)
PrimitiveGroup(100,2)
PrimitiveGroup(100,3)
PrimitiveGroup(100,4)
PrimitiveGroup(100,37)
PrimitiveGroup(100,38)
gap> Read("session-20120317.g");
Variable: '
' must have an assigned value at
Print( "PrimitiveGroup(", i, ",", j, ") = ", StructureDescription( G ), \
   );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> Read("session-20120317.g");

PrimitiveGroup(5,4) = A5
PrimitiveGroup(5,5) = S5
PrimitiveGroup(6,1) = A5
PrimitiveGroup(6,2) = S5
PrimitiveGroup(6,3) = A6
PrimitiveGroup(6,4) = S6
PrimitiveGroup(7,5) = PSL(3,2)
PrimitiveGroup(7,6) = A7
PrimitiveGroup(7,7) = S7
PrimitiveGroup(8,4) = PSL(3,2)
PrimitiveGroup(8,5) = PSL(3,2) : C2
PrimitiveGroup(8,6) = A8
PrimitiveGroup(8,7) = S8
PrimitiveGroup(9,8) = PSL(2,8)
PrimitiveGroup(9,9) = PSL(2,8) : C3
PrimitiveGroup(9,10) = A9
PrimitiveGroup(9,11) = S9
PrimitiveGroup(10,1) = A5
PrimitiveGroup(10,2) = S5
PrimitiveGroup(10,3) = A6
PrimitiveGroup(10,4) = A6 : C2
PrimitiveGroup(10,5) = S6
PrimitiveGroup(10,6) = A6 . C2
PrimitiveGroup(10,7) = (A6 . C2) : C2
PrimitiveGroup(10,8) = A10
PrimitiveGroup(10,9) = S10
PrimitiveGroup(11,5) = PSL(2,11)
PrimitiveGroup(11,6) = M11
PrimitiveGroup(11,7) = A11
PrimitiveGroup(11,8) = S11
PrimitiveGroup(12,1) = M11
PrimitiveGroup(12,2) = M12
PrimitiveGroup(12,3) = PSL(2,11)
PrimitiveGroup(12,4) = PSL(2,11) : C2
PrimitiveGroup(12,5) = A12
PrimitiveGroup(12,6) = S12
PrimitiveGroup(13,7) = PSL(3,3)
PrimitiveGroup(13,8) = A13
PrimitiveGroup(13,9) = S13
PrimitiveGroup(14,1) = PSL(2,13)
PrimitiveGroup(14,2) = PSL(2,13) : C2
PrimitiveGroup(14,3) = A14
PrimitiveGroup(14,4) = S14
PrimitiveGroup(15,1) = A7
PrimitiveGroup(15,2) = A6
PrimitiveGroup(15,3) = S6
PrimitiveGroup(15,4) = A8
PrimitiveGroup(15,5) = A15
PrimitiveGroup(15,6) = S15
PrimitiveGroup(16,21) = A16
PrimitiveGroup(16,22) = S16
PrimitiveGroup(17,6) = PSL(2,16)
PrimitiveGroup(17,7) = PSL(2,16) : C2
PrimitiveGroup(17,8) = PSL(2,16) : C4
PrimitiveGroup(17,9) = A17
PrimitiveGroup(17,10) = S17
PrimitiveGroup(18,1) = PSL(2,17)
PrimitiveGroup(18,2) = PSL(2,17) : C2
PrimitiveGroup(18,3) = A18
PrimitiveGroup(18,4) = S18
PrimitiveGroup(19,7) = A19
PrimitiveGroup(19,8) = S19
PrimitiveGroup(20,1) = PSL(2,19)
PrimitiveGroup(20,2) = PSL(2,19) : C2
PrimitiveGroup(20,3) = A20
PrimitiveGroup(20,4) = S20
PrimitiveGroup(21,1) = PSL(3,2) : C2
PrimitiveGroup(21,2) = A7
PrimitiveGroup(21,3) = S7
PrimitiveGroup(21,4) = PSL(3,4)
PrimitiveGroup(21,5) = PSL(3,4) : C2
user interrupt at
blist[new] := true;
 called from
PermutationOp( g, D, act ) called from
Permutation( i, zuppos, function ( x, a )
      return SmallestGeneratorPerm( x ^ a );
  end ) called from
func( elm ) called from
List( GeneratorsOfGroup( G ), function ( i )
      return Permutation( i, zuppos, function ( x, a )
              return SmallestGeneratorPerm( x ^ a );
          end );
  end ) called from
LatticeSubgroups( G ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
PrimitiveGroup(21,6) = PSL(3,4) : C3gap> Read("session-20120317.g");

|G|=60  PrimitiveGroup(5,4) = A5
|G|=120  PrimitiveGroup(5,5) = S5
|G|=60  PrimitiveGroup(6,1) = A5
|G|=120  PrimitiveGroup(6,2) = S5
|G|=360  PrimitiveGroup(6,3) = A6
|G|=720  PrimitiveGroup(6,4) = S6
|G|=168  PrimitiveGroup(7,5) = PSL(3,2)
|G|=2520  PrimitiveGroup(7,6) = A7
|G|=5040  PrimitiveGroup(7,7) = S7
|G|=168  PrimitiveGroup(8,4) = PSL(3,2)
|G|=336  PrimitiveGroup(8,5) = PSL(3,2) : C2
|G|=20160  PrimitiveGroup(8,6) = A8
|G|=40320  PrimitiveGroup(8,7) = S8
|G|=504  PrimitiveGroup(9,8) = PSL(2,8)
|G|=1512  PrimitiveGroup(9,9) = PSL(2,8) : C3
|G|=181440  PrimitiveGroup(9,10) = A9
|G|=362880  PrimitiveGroup(9,11) = S9
|G|=60  PrimitiveGroup(10,1) = A5
|G|=120  PrimitiveGroup(10,2) = S5
|G|=360  PrimitiveGroup(10,3) = A6
|G|=720  PrimitiveGroup(10,4) = A6 : C2
|G|=720  PrimitiveGroup(10,5) = S6
|G|=720  PrimitiveGroup(10,6) = A6 . C2
|G|=1440  PrimitiveGroup(10,7) = (A6 . C2) : C2
|G|=1814400  PrimitiveGroup(10,8) = A10
|G|=3628800  PrimitiveGroup(10,9) = S10
|G|=660  PrimitiveGroup(11,5) = PSL(2,11)
|G|=7920  PrimitiveGroup(11,6) = M11
|G|=19958400  PrimitiveGroup(11,7) = A11
|G|=39916800  PrimitiveGroup(11,8) = S11
|G|=7920  PrimitiveGroup(12,1) = M11
|G|=95040  PrimitiveGroup(12,2) = M12
|G|=660  PrimitiveGroup(12,3) = PSL(2,11)
|G|=1320  PrimitiveGroup(12,4) = PSL(2,11) : C2
|G|=239500800  PrimitiveGroup(12,5) = A12
|G|=479001600  PrimitiveGroup(12,6) = S12
|G|=5616  PrimitiveGroup(13,7) = PSL(3,3)
|G|=3113510400  PrimitiveGroup(13,8) = A13
|G|=6227020800  PrimitiveGroup(13,9) = S13
|G|=1092  PrimitiveGroup(14,1) = PSL(2,13)
|G|=2184  PrimitiveGroup(14,2) = PSL(2,13) : C2
|G|=43589145600  PrimitiveGroup(14,3) = A14
|G|=87178291200  PrimitiveGroup(14,4) = S14
|G|=2520  PrimitiveGroup(15,1) = A7
|G|=360  PrimitiveGroup(15,2) = A6
|G|=720  PrimitiveGroup(15,3) = S6
|G|=20160  PrimitiveGroup(15,4) = A8
|G|=653837184000  PrimitiveGroup(15,5) = A15
|G|=1307674368000  PrimitiveGroup(15,6) = S15
|G|=10461394944000  PrimitiveGroup(16,21) = A16
|G|=20922789888000  PrimitiveGroup(16,22) = S16
|G|=4080  PrimitiveGroup(17,6) = PSL(2,16)
|G|=8160  PrimitiveGroup(17,7) = PSL(2,16) : C2
|G|=16320  PrimitiveGroup(17,8) = PSL(2,16) : C4
|G|=177843714048000  PrimitiveGroup(17,9) = A17
|G|=355687428096000  PrimitiveGroup(17,10) = S17
|G|=2448  PrimitiveGroup(18,1) = PSL(2,17)
|G|=4896  PrimitiveGroup(18,2) = PSL(2,17) : C2
|G|=3201186852864000  PrimitiveGroup(18,3) = A18
|G|=6402373705728000  PrimitiveGroup(18,4) = S18
|G|=60822550204416000  PrimitiveGroup(19,7) = A19
|G|=121645100408832000  PrimitiveGroup(19,8) = S19
|G|=3420  PrimitiveGroup(20,1) = PSL(2,19)
|G|=6840  PrimitiveGroup(20,2) = PSL(2,19) : C2
|G|=1216451004088320000  PrimitiveGroup(20,3) = A20
|G|=2432902008176640000  PrimitiveGroup(20,4) = S20
|G|=336  PrimitiveGroup(21,1) = PSL(3,2) : C2
|G|=2520  PrimitiveGroup(21,2) = A7
|G|=5040  PrimitiveGroup(21,3) = S7
|G|=20160  PrimitiveGroup(21,4) = PSL(3,4)
|G|=40320  PrimitiveGroup(21,5) = PSL(3,4) : C2
|G|=60480  PrimitiveGroup(21,6) = PSL(3,4) : C3
|G|=120960  PrimitiveGroup(21,7) = (PSL(3,4) : C3) : C2
|G|=25545471085854720000  PrimitiveGroup(21,8) = A21
|G|=51090942171709440000  PrimitiveGroup(21,9) = S21
user interrupt at
S := S.stabilizer;
 called from
StrongGeneratorsStabChain( StabChainMutable( G ) ) called from
RepOpElmTuplesPermGroup( true, ActingDomain( cl ), [ g ], [ Representative( cl ) ], TrivialSubgroup( G ), StabilizerOfExternalSet( cl ) 
 ) called from
elm in classes[i] called from
ConjugacyClassesTry( G, classes, Random( cent ), 0, 1 ) called from
ConjugacyClassesByRandomSearch( F ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
|G|=443520  PrimitiveGroup(22,1) = M22gap> Read("session-20120317.g");

|G|=60		  PrimitiveGroup(5,4) = A5
|G|=120		  PrimitiveGroup(5,5) = S5
|G|=60		  PrimitiveGroup(6,1) = A5
|G|=120		  PrimitiveGroup(6,2) = S5
|G|=360		  PrimitiveGroup(6,3) = A6
|G|=720		  PrimitiveGroup(6,4) = S6
|G|=168		  PrimitiveGroup(7,5) = PSL(3,2)
|G|=2520		  PrimitiveGroup(7,6) = A7
|G|=5040		  PrimitiveGroup(7,7) = S7
|G|=168		  PrimitiveGroup(8,4) = PSL(3,2)
|G|=336		  PrimitiveGroup(8,5) = PSL(3,2) : C2
|G|=20160		  PrimitiveGroup(8,6) = A8
|G|=40320		  PrimitiveGroup(8,7) = S8
|G|=504		  PrimitiveGroup(9,8) = PSL(2,8)
|G|=1512		  PrimitiveGroup(9,9) = PSL(2,8) : C3
|G|=181440		  PrimitiveGroup(9,10) = A9
|G|=362880		  PrimitiveGroup(9,11) = S9
|G|=60		  PrimitiveGroup(10,1) = A5
|G|=120		  PrimitiveGroup(10,2) = S5
|G|=360		  PrimitiveGroup(10,3) = A6
|G|=720		  PrimitiveGroup(10,4) = A6 : C2
|G|=720		  PrimitiveGroup(10,5) = S6
|G|=720		  PrimitiveGroup(10,6) = A6 . C2
|G|=1440		  PrimitiveGroup(10,7) = (A6 . C2) : C2
|G|=1814400		  PrimitiveGroup(10,8) = A10
|G|=3628800		  PrimitiveGroup(10,9) = S10
|G|=660		  PrimitiveGroup(11,5) = PSL(2,11)
|G|=7920		  PrimitiveGroup(11,6) = M11
|G|=19958400		  PrimitiveGroup(11,7) = A11
|G|=39916800		  PrimitiveGroup(11,8) = S11
|G|=7920		  PrimitiveGroup(12,1) = M11
|G|=95040		  PrimitiveGroup(12,2) = M12
|G|=660		  PrimitiveGroup(12,3) = PSL(2,11)
|G|=1320		  PrimitiveGroup(12,4) = PSL(2,11) : C2
|G|=239500800		  PrimitiveGroup(12,5) = A12
|G|=479001600		  PrimitiveGroup(12,6) = S12
|G|=5616		  PrimitiveGroup(13,7) = PSL(3,3)
|G|=3113510400		  PrimitiveGroup(13,8) = A13
|G|=6227020800		  PrimitiveGroup(13,9) = S13
|G|=1092		  PrimitiveGroup(14,1) = PSL(2,13)
|G|=2184		  PrimitiveGroup(14,2) = PSL(2,13) : C2
|G|=43589145600		  PrimitiveGroup(14,3) = A14
|G|=87178291200		  PrimitiveGroup(14,4) = S14
|G|=2520		  PrimitiveGroup(15,1) = A7
|G|=360		  PrimitiveGroup(15,2) = A6
|G|=720		  PrimitiveGroup(15,3) = S6
|G|=20160		  PrimitiveGroup(15,4) = A8
|G|=653837184000		  PrimitiveGroup(15,5) = A15
|G|=1307674368000		  PrimitiveGroup(15,6) = S15
|G|=10461394944000		  PrimitiveGroup(16,21) = A16
|G|=20922789888000		  PrimitiveGroup(16,22) = S16
|G|=4080		  PrimitiveGroup(17,6) = PSL(2,16)
|G|=8160		  PrimitiveGroup(17,7) = PSL(2,16) : C2
|G|=16320		  PrimitiveGroup(17,8) = PSL(2,16) : C4
|G|=177843714048000		  PrimitiveGroup(17,9) = A17
|G|=355687428096000		  PrimitiveGroup(17,10) = S17
|G|=2448		  PrimitiveGroup(18,1) = PSL(2,17)
|G|=4896		  PrimitiveGroup(18,2) = PSL(2,17) : C2
|G|=3201186852864000		  PrimitiveGroup(18,3) = A18
|G|=6402373705728000		  PrimitiveGroup(18,4) = S18
|G|=60822550204416000		  PrimitiveGroup(19,7) = A19
|G|=121645100408832000		  PrimitiveGroup(19,8) = S19
|G|=3420		  PrimitiveGroup(20,1) = PSL(2,19)
|G|=6840		  PrimitiveGroup(20,2) = PSL(2,19) : C2
|G|=1216451004088320000		  PrimitiveGroup(20,3) = A20
|G|=2432902008176640000		  PrimitiveGroup(20,4) = S20
|G|=336		  PrimitiveGroup(21,1) = PSL(3,2) : C2
|G|=2520		  PrimitiveGroup(21,2) = A7
|G|=5040		  PrimitiveGroup(21,3) = S7
|G|=20160		  PrimitiveGroup(21,4) = PSL(3,4)
user interrupt at
t := t + 1;
 called from
AddCosetInfoStabChain( enum!.stabChainGroup, enum!.stabChainSubgroup, LargestMovedPoint( enum!.group ) ); called from
RightTransversalPermGroupConstructor( IsRightTransversalPermGroupRep, G, U ) called from
RightTransversalOp( G, N ) called from
LatticeSubgroups( G ) called from
ConjugacyClassesSubgroups( G ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
|G|=40320		  PrimitiveGroup(21,5) = PSL(3,4) : C2gap> Read("session-20120317.g");

|G|=60			  PrimitiveGroup(5,4) = A5
|G|=120			  PrimitiveGroup(5,5) = S5
|G|=60			  PrimitiveGroup(6,1) = A5
|G|=120			  PrimitiveGroup(6,2) = S5
|G|=360			  PrimitiveGroup(6,3) = A6
|G|=720			  PrimitiveGroup(6,4) = S6
|G|=168			  PrimitiveGroup(7,5) = PSL(3,2)
|G|=2520			  PrimitiveGroup(7,6) = A7
|G|=5040			  PrimitiveGroup(7,7) = S7
|G|=168			  PrimitiveGroup(8,4) = PSL(3,2)
|G|=336			  PrimitiveGroup(8,5) = PSL(3,2) : C2
|G|=20160			  PrimitiveGroup(8,6) = A8
|G|=40320			  PrimitiveGroup(8,7) = S8
|G|=504			  PrimitiveGroup(9,8) = PSL(2,8)
|G|=1512			  PrimitiveGroup(9,9) = PSL(2,8) : C3
|G|=181440			  PrimitiveGroup(9,10) = A9
|G|=362880			  PrimitiveGroup(9,11) = S9
|G|=60			  PrimitiveGroup(10,1) = A5
|G|=120			  PrimitiveGroup(10,2) = S5
|G|=360			  PrimitiveGroup(10,3) = A6
|G|=720			  PrimitiveGroup(10,4) = A6 : C2
|G|=720			  PrimitiveGroup(10,5) = S6
|G|=720			  PrimitiveGroup(10,6) = A6 . C2
|G|=1440			  PrimitiveGroup(10,7) = (A6 . C2) : C2
|G|=1814400			  PrimitiveGroup(10,8) = A10
|G|=3628800			  PrimitiveGroup(10,9) = S10
|G|=660			  PrimitiveGroup(11,5) = PSL(2,11)
|G|=7920			  PrimitiveGroup(11,6) = M11
|G|=19958400			  PrimitiveGroup(11,7) = A11
|G|=39916800			  PrimitiveGroup(11,8) = S11
|G|=7920			  PrimitiveGroup(12,1) = M11
|G|=95040			  PrimitiveGroup(12,2) = M12
|G|=660			  PrimitiveGroup(12,3) = PSL(2,11)
|G|=1320			  PrimitiveGroup(12,4) = PSL(2,11) : C2
|G|=239500800			  PrimitiveGroup(12,5) = A12
|G|=479001600			  PrimitiveGroup(12,6) = S12
|G|=5616			  PrimitiveGroup(13,7) = PSL(3,3)
|G|=3113510400			  PrimitiveGroup(13,8) = A13
|G|=6227020800			  PrimitiveGroup(13,9) = S13
|G|=1092			  PrimitiveGroup(14,1) = PSL(2,13)
|G|=2184			  PrimitiveGroup(14,2) = PSL(2,13) : C2
|G|=43589145600			  PrimitiveGroup(14,3) = A14
|G|=87178291200			  PrimitiveGroup(14,4) = S14
|G|=2520			  PrimitiveGroup(15,1) = A7
|G|=360			  PrimitiveGroup(15,2) = A6
|G|=720			  PrimitiveGroup(15,3) = S6
|G|=20160			  PrimitiveGroup(15,4) = A8
|G|=653837184000			  PrimitiveGroup(15,5) = A15
|G|=1307674368000			  PrimitiveGroup(15,6) = S15
|G|=10461394944000			  PrimitiveGroup(16,21) = A16
|G|=20922789888000			  PrimitiveGroup(16,22) = S16
|G|=4080			  PrimitiveGroup(17,6) = PSL(2,16)
|G|=8160			  PrimitiveGroup(17,7) = PSL(2,16) : C2
|G|=16320			  PrimitiveGroup(17,8) = PSL(2,16) : C4
|G|=177843714048000			  PrimitiveGroup(17,9) = A17
|G|=355687428096000			  PrimitiveGroup(17,10) = S17
|G|=2448			  PrimitiveGroup(18,1) = PSL(2,17)
|G|=4896			  PrimitiveGroup(18,2) = PSL(2,17) : C2
|G|=3201186852864000			  PrimitiveGroup(18,3) = A18
|G|=6402373705728000			  PrimitiveGroup(18,4) = S18
|G|=60822550204416000			  PrimitiveGroup(19,7) = A19
|G|=121645100408832000			  PrimitiveGroup(19,8) = S19
|G|=3420			  PrimitiveGroup(20,1) = PSL(2,19)
|G|=6840			  PrimitiveGroup(20,2) = PSL(2,19) : C2
|G|=1216451004088320000			  PrimitiveGroup(20,3) = A20
|G|=2432902008176640000			  PrimitiveGroup(20,4) = S20
|G|=336			  PrimitiveGroup(21,1) = PSL(3,2) : C2
|G|=2520			  PrimitiveGroup(21,2) = A7
|G|=5040			  PrimitiveGroup(21,3) = S7
|G|=20160			  PrimitiveGroup(21,4) = PSL(3,4)
|G|=40320			  PrimitiveGroup(21,5) = PSL(3,4) : C2
|G|=60480			  PrimitiveGroup(21,6) = PSL(3,4) : C3
|G|=120960			  PrimitiveGroup(21,7) = (PSL(3,4) : C3) : C2
|G|=25545471085854720000			  PrimitiveGroup(21,8) = A21
|G|=51090942171709440000			  PrimitiveGroup(21,9) = S21
|G|=443520			  PrimitiveGroup(22,1) = M22user interrupt at
Kzups := classesZups[k];
 called from
LatticeSubgroups( G ) called from
ConjugacyClassesSubgroups( G ) called from
SemidirectFactorsOfGroup( G ) called from
StructureDescription( G ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> 
gap> 
gap> Read("session-20120317.g");

|G|=60			  PrimitiveGroup(5,4) = A5
|G|=120			  PrimitiveGroup(5,5) = S5
|G|=60			  PrimitiveGroup(6,1) = A5
|G|=120			  PrimitiveGroup(6,2) = S5
|G|=360			  PrimitiveGroup(6,3) = A6
|G|=720			  PrimitiveGroup(6,4) = S6
|G|=168			  PrimitiveGroup(7,5) = PSL(3,2)
|G|=2520			  PrimitiveGroup(7,6) = A7
|G|=5040			  PrimitiveGroup(7,7) = S7
|G|=168			  PrimitiveGroup(8,4) = PSL(3,2)
|G|=336			  PrimitiveGroup(8,5) = PSL(3,2) : C2
|G|=20160			  PrimitiveGroup(8,6) = A8
|G|=40320			  PrimitiveGroup(8,7) = S8
|G|=504			  PrimitiveGroup(9,8) = PSL(2,8)
|G|=1512			  PrimitiveGroup(9,9) = PSL(2,8) : C3
|G|=181440			  PrimitiveGroup(9,10) = A9
|G|=362880			  PrimitiveGroup(9,11) = S9
|G|=60			  PrimitiveGroup(10,1) = A5
|G|=120			  PrimitiveGroup(10,2) = S5
|G|=360			  PrimitiveGroup(10,3) = A6
|G|=720			  PrimitiveGroup(10,4) = A6 : C2
|G|=720			  PrimitiveGroup(10,5) = S6
|G|=720			  PrimitiveGroup(10,6) = A6 . C2
|G|=1440			  PrimitiveGroup(10,7) = (A6 . C2) : C2
|G|=1814400			  PrimitiveGroup(10,8) = A10
|G|=3628800			  PrimitiveGroup(10,9) = S10
|G|=660			  PrimitiveGroup(11,5) = PSL(2,11)
|G|=7920			  PrimitiveGroup(11,6) = M11
|G|=19958400			  PrimitiveGroup(11,7) = A11
|G|=39916800			  PrimitiveGroup(11,8) = S11
|G|=7920			  PrimitiveGroup(12,1) = M11
|G|=95040			  PrimitiveGroup(12,2) = M12
|G|=660			  PrimitiveGroup(12,3) = PSL(2,11)
|G|=1320			  PrimitiveGroup(12,4) = PSL(2,11) : C2
|G|=239500800			  PrimitiveGroup(12,5) = A12
|G|=479001600			  PrimitiveGroup(12,6) = S12
|G|=5616			  PrimitiveGroup(13,7) = PSL(3,3)
|G|=3113510400			  PrimitiveGroup(13,8) = A13
|G|=6227020800			  PrimitiveGroup(13,9) = S13
|G|=1092			  PrimitiveGroup(14,1) = PSL(2,13)
|G|=2184			  PrimitiveGroup(14,2) = PSL(2,13) : C2
|G|=43589145600			  PrimitiveGroup(14,3) = A14
|G|=87178291200			  PrimitiveGroup(14,4) = S14
|G|=2520			  PrimitiveGroup(15,1) = A7
|G|=360			  PrimitiveGroup(15,2) = A6
|G|=720			  PrimitiveGroup(15,3) = S6
|G|=20160			  PrimitiveGroup(15,4) = A8
|G|=653837184000			  PrimitiveGroup(15,5) = A15
|G|=1307674368000			  PrimitiveGroup(15,6) = S15
|G|=10461394944000			  PrimitiveGroup(16,21) = A16
|G|=20922789888000			  PrimitiveGroup(16,22) = S16
|G|=4080			  PrimitiveGroup(17,6) = PSL(2,16)
|G|=8160			  PrimitiveGroup(17,7) = PSL(2,16) : C2
|G|=16320			  PrimitiveGroup(17,8) = PSL(2,16) : C4
|G|=177843714048000			  PrimitiveGroup(17,9) = A17
|G|=355687428096000			  PrimitiveGroup(17,10) = S17
|G|=2448			  PrimitiveGroup(18,1) = PSL(2,17)
|G|=4896			  PrimitiveGroup(18,2) = PSL(2,17) : C2
|G|=3201186852864000			  PrimitiveGroup(18,3) = A18
|G|=6402373705728000			  PrimitiveGroup(18,4) = S18
|G|=60822550204416000			  PrimitiveGroup(19,7) = A19
|G|=121645100408832000			  PrimitiveGroup(19,8) = S19
|G|=3420			  PrimitiveGroup(20,1) = PSL(2,19)
|G|=6840			  PrimitiveGroup(20,2) = PSL(2,19) : C2
|G|=1216451004088320000			  PrimitiveGroup(20,3) = A20
|G|=2432902008176640000			  PrimitiveGroup(20,4) = S20gap> 
gap> Read("session-20120317.g");

|G|=60		 A5
|G|=120		 S5
|G|=60		 A5
|G|=120		 S5
|G|=360		 A6
|G|=720		 S6
|G|=168		 PSL(3,2)
|G|=2520		 A7
|G|=5040		 S7
|G|=168		 PSL(3,2)
|G|=336		 PSL(3,2) : C2
|G|=20160		 A8
|G|=40320		 S8
|G|=504		 PSL(2,8)
|G|=1512		 PSL(2,8) : C3
|G|=181440		 A9
|G|=362880		 S9
|G|=60		 A5
|G|=120		 S5
|G|=360		 A6
|G|=720		 A6 : C2
|G|=720		 S6
|G|=720		 A6 . C2
|G|=1440		 (A6 . C2) : C2
|G|=1814400		 A10
|G|=3628800		 S10
|G|=660		 PSL(2,11)
|G|=7920		 M11
|G|=19958400		 A11
|G|=39916800		 S11
|G|=7920		 M11
|G|=95040		 M12
|G|=660		 PSL(2,11)
|G|=1320		 PSL(2,11) : C2
|G|=239500800		 A12
|G|=479001600		 S12
|G|=5616		 PSL(3,3)
|G|=3113510400		 A13
|G|=6227020800		 S13
|G|=1092		 PSL(2,13)
|G|=2184		 PSL(2,13) : C2
|G|=43589145600		 A14
|G|=87178291200		 S14
|G|=2520		 A7
|G|=360		 A6
|G|=720		 S6
|G|=20160		 A8
|G|=653837184000		 A15
|G|=1307674368000		 S15
|G|=10461394944000		 A16
|G|=20922789888000		 S16
|G|=4080		 PSL(2,16)
|G|=8160		 PSL(2,16) : C2
|G|=16320		 PSL(2,16) : C4
|G|=177843714048000		 A17
|G|=355687428096000		 S17
|G|=2448		 PSL(2,17)
|G|=4896		 PSL(2,17) : C2
|G|=3201186852864000		 A18
|G|=6402373705728000		 S18
|G|=60822550204416000		 A19
|G|=121645100408832000		 S19
|G|=3420		 PSL(2,19)
|G|=6840		 PSL(2,19) : C2
|G|=1216451004088320000		 A20
|G|=2432902008176640000		 S20gap> Read("session-20120317.g");

A5& 60\
S5& 120\
A5& 60\
S5& 120\
A6& 360\
S6& 720\
PSL(3,2)& 168\
A7& 2520\
S7& 5040\
PSL(3,2)& 168\
PSL(3,2) : C2& 336\
A8& 20160\
S8& 40320\
PSL(2,8)& 504\
PSL(2,8) : C3& 1512\
A9& 181440\
S9& 362880\
A5& 60\
S5& 120\
A6& 360\
A6 : C2& 720\
S6& 720\
A6 . C2& 720\
(A6 . C2) : C2& 1440\
A10& 1814400\
S10& 3628800\
PSL(2,11)& 660\
M11& 7920\
A11& 19958400\
S11& 39916800\
M11& 7920\
M12& 95040\
PSL(2,11)& 660\
PSL(2,11) : C2& 1320\
A12& 239500800\
S12& 479001600\
PSL(3,3)& 5616\
A13& 3113510400\
S13& 6227020800\
PSL(2,13)& 1092\
PSL(2,13) : C2& 2184\
A14& 43589145600\
S14& 87178291200\
A7& 2520\
A6& 360\
S6& 720\
A8& 20160\
A15& 653837184000\
S15& 1307674368000\
A16& 10461394944000\
S16& 20922789888000\
PSL(2,16)& 4080\
PSL(2,16) : C2& 8160\
PSL(2,16) : C4& 16320\
A17& 177843714048000\
S17& 355687428096000\
PSL(2,17)& 2448\
PSL(2,17) : C2& 4896\
A18& 3201186852864000\
S18& 6402373705728000\
A19& 60822550204416000\
S19& 121645100408832000\
PSL(2,19)& 3420\
PSL(2,19) : C2& 6840\
A20& 1216451004088320000\
S20& 2432902008176640000\gap> 	
gap> 
gap> Read("session-20120317.g");

A5 & 60\\
S5 & 120\\
A5 & 60\\
S5 & 120\\
A6 & 360\\
S6 & 720\\
PSL(3,2) & 168\\
A7 & 2520\\
S7 & 5040\\
PSL(3,2) & 168\\
PSL(3,2) : C2 & 336\\
A8 & 20160\\
S8 & 40320\\
PSL(2,8) & 504\\
PSL(2,8) : C3 & 1512\\
A9 & 181440\\
S9 & 362880\\
A5 & 60\\
S5 & 120\\
A6 & 360\\
A6 : C2 & 720\\
S6 & 720\\
A6 . C2 & 720\\
(A6 . C2) : C2 & 1440\\
A10 & 1814400\\
S10 & 3628800\\
PSL(2,11) & 660\\
M11 & 7920\\
A11 & 19958400\\
S11 & 39916800\\
M11 & 7920\\
M12 & 95040\\
PSL(2,11) & 660\\
PSL(2,11) : C2 & 1320\\
A12 & 239500800\\
S12 & 479001600\\
PSL(3,3) & 5616\\
A13 & 3113510400\\
S13 & 6227020800\\
PSL(2,13) & 1092\\
PSL(2,13) : C2 & 2184\\
A14 & 43589145600\\
S14 & 87178291200\\
A7 & 2520\\
A6 & 360\\
S6 & 720\\
A8 & 20160\\
A15 & 653837184000\\
S15 & 1307674368000\\
A16 & 10461394944000\\
S16 & 20922789888000\\
PSL(2,16) & 4080\\
PSL(2,16) : C2 & 8160\\
PSL(2,16) : C4 & 16320\\
A17 & 177843714048000\\
S17 & 355687428096000\\
PSL(2,17) & 2448\\
PSL(2,17) : C2 & 4896\\
A18 & 3201186852864000\\
S18 & 6402373705728000\\
A19 & 60822550204416000\\
S19 & 121645100408832000\\
PSL(2,19) & 3420\\
PSL(2,19) : C2 & 6840\\
A20 & 1216451004088320000\\
S20 & 2432902008176640000\\gap> Read("session-20120317.g");

 (5,4) A5 & 60 \\
 (5,5) S5 & 120 \\
 (6,1) A5 & 60 \\
 (6,2) S5 & 120 \\
 (6,3) A6 & 360 \\
 (6,4) S6 & 720 \\
 (7,5) PSL(3,2) & 168 \\
 (7,6) A7 & 2520 \\
 (7,7) S7 & 5040 \\
 (8,4) PSL(3,2) & 168 \\
 (8,5) PSL(3,2) : C2 & 336 \\
 (8,6) A8 & 20160 \\
 (8,7) S8 & 40320 \\
 (9,8) PSL(2,8) & 504 \\
 (9,9) PSL(2,8) : C3 & 1512 \\
 (9,10) A9 & 181440 \\
 (9,11) S9 & 362880 \\
 (10,1) A5 & 60 \\
 (10,2) S5 & 120 \\
 (10,3) A6 & 360 \\
 (10,4) A6 : C2 & 720 \\
 (10,5) S6 & 720 \\
 (10,6) A6 . C2 & 720 \\
 (10,7) (A6 . C2) : C2 & 1440 \\
 (10,8) A10 & 1814400 \\
 (10,9) S10 & 3628800 \\
 (11,5) PSL(2,11) & 660 \\
 (11,6) M11 & 7920 \\
 (11,7) A11 & 19958400 \\
 (11,8) S11 & 39916800 \\
 (12,1) M11 & 7920 \\
 (12,2) M12 & 95040 \\
 (12,3) PSL(2,11) & 660 \\
 (12,4) PSL(2,11) : C2 & 1320 \\
 (12,5) A12 & 239500800 \\
 (12,6) S12 & 479001600 \\
 (13,7) PSL(3,3) & 5616 \\
 (13,8) A13 & 3113510400 \\
 (13,9) S13 & 6227020800 \\
 (14,1) PSL(2,13) & 1092 \\
 (14,2) PSL(2,13) : C2 & 2184 \\
 (14,3) A14 & 43589145600 \\
 (14,4) S14 & 87178291200 \\
 (15,1) A7 & 2520 \\
 (15,2) A6 & 360 \\
 (15,3) S6 & 720 \\
 (15,4) A8 & 20160 \\
 (15,5) A15 & 653837184000 \\
 (15,6) S15 & 1307674368000 \\
 (16,21) A16 & 10461394944000 \\
 (16,22) S16 & 20922789888000 \\
 (17,6) PSL(2,16) & 4080 \\
 (17,7) PSL(2,16) : C2 & 8160 \\
 (17,8) PSL(2,16) : C4 & 16320 \\
 (17,9) A17 & 177843714048000 \\
 (17,10) S17 & 355687428096000 \\
 (18,1) PSL(2,17) & 2448 \\
 (18,2) PSL(2,17) : C2 & 4896 \\
 (18,3) A18 & 3201186852864000 \\
 (18,4) S18 & 6402373705728000 \\
 (19,7) A19 & 60822550204416000 \\
 (19,8) S19 & 121645100408832000 \\
user interrupt at
mov := mov + 1;
 called from
NrMovedPoints( GeneratorsOfGroup( G ) ) called from
NrMovedPoints( grp ) called from
TryPcgsPermGroup( [ G, GroupStabChain( G, S, true ) ], false, false, true ) called from
StabChainOp( G, rec(
     ) ) called from
StabChainMutable( L ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
 (20,1) PSL(2,19) & 3420 \\gap> Read("session-20120317.g");

 (5,4) & A5 & 60 \\
 (5,5) & S5 & 120 \\
 (6,1) & A5 & 60 \\
 (6,2) & S5 & 120 \\
 (6,3) & A6 & 360 \\
 (6,4) & S6 & 720 \\
 (7,5) & PSL(3,2) & 168 \\
 (7,6) & A7 & 2520 \\
 (7,7) & S7 & 5040 \\
 (8,4) & PSL(3,2) & 168 \\
 (8,5) & PSL(3,2) : C2 & 336 \\
 (8,6) & A8 & 20160 \\
 (8,7) & S8 & 40320 \\
 (9,8) & PSL(2,8) & 504 \\
 (9,9) & PSL(2,8) : C3 & 1512 \\
 (9,10) & A9 & 181440 \\
 (9,11) & S9 & 362880 \\
 (10,1) & A5 & 60 \\
 (10,2) & S5 & 120 \\
 (10,3) & A6 & 360 \\
 (10,4) & A6 : C2 & 720 \\
 (10,5) & S6 & 720 \\
 (10,6) & A6 . C2 & 720 \\
 (10,7) & (A6 . C2) : C2 & 1440 \\
 (10,8) & A10 & 1814400 \\
 (10,9) & S10 & 3628800 \\
 (11,5) & PSL(2,11) & 660 \\
 (11,6) & M11 & 7920 \\
 (11,7) & A11 & 19958400 \\
 (11,8) & S11 & 39916800 \\
 (12,1) & M11 & 7920 \\
 (12,2) & M12 & 95040 \\
 (12,3) & PSL(2,11) & 660 \\
 (12,4) & PSL(2,11) : C2 & 1320 \\
 (12,5) & A12 & 239500800 \\
 (12,6) & S12 & 479001600 \\
 (13,7) & PSL(3,3) & 5616 \\
 (13,8) & A13 & 3113510400 \\
 (13,9) & S13 & 6227020800 \\
 (14,1) & PSL(2,13) & 1092 \\
 (14,2) & PSL(2,13) : C2 & 2184 \\
 (14,3) & A14 & 43589145600 \\
 (14,4) & S14 & 87178291200 \\
 (15,1) & A7 & 2520 \\
 (15,2) & A6 & 360 \\
 (15,3) & S6 & 720 \\
 (15,4) & A8 & 20160 \\
 (15,5) & A15 & 653837184000 \\
 (15,6) & S15 & 1307674368000 \\
 (16,21) & A16 & 10461394944000 \\
 (16,22) & S16 & 20922789888000 \\
 (17,6) & PSL(2,16) & 4080 \\
 (17,7) & PSL(2,16) : C2 & 8160 \\
 (17,8) & PSL(2,16) : C4 & 16320 \\
 (17,9) & A17 & 177843714048000 \\
 (17,10) & S17 & 355687428096000 \\
 (18,1) & PSL(2,17) & 2448 \\
 (18,2) & PSL(2,17) : C2 & 4896 \\
 (18,3) & A18 & 3201186852864000 \\
 (18,4) & S18 & 6402373705728000 \\
 (19,7) & A19 & 60822550204416000 \\
 (19,8) & S19 & 121645100408832000 \\
 (20,1) & PSL(2,19) & 3420 \\
 (20,2) & PSL(2,19) : C2 & 6840 \\
 (20,3) & A20 & 1216451004088320000 \\
 (20,4) & S20 & 2432902008176640000 \\gap> Read("session-20120317.g");
gap> Read("session-20120317.g");

 (60,1) & A5 x A5 & 3600 \\
 (60,2) & (A5 x A5) : C2 & 7200 \\
 (168,1) & PSL(3,2) x PSL(3,2) & 28224 \\
 (168,2) & (PSL(3,2) x PSL(3,2)) : C2 & 56448 \\#I  computing Conway polynomial for p = 257 and n = 1
#I  computing Conway polynomial for p = 307 and n = 1
#I  computing Conway polynomial for p = 311 and n = 1
#I  computing Conway polynomial for p = 313 and n = 1
#I  computing Conway polynomial for p = 317 and n = 1
#I  computing Conway polynomial for p = 331 and n = 1
#I  computing Conway polynomial for p = 337 and n = 1
#I  computing Conway polynomial for p = 347 and n = 1
#I  computing Conway polynomial for p = 349 and n = 1
#I  computing Conway polynomial for p = 353 and n = 1

 (360,1) & A6 x A6 & 129600 \\
 (360,2) & (A6 x A6) : C2 & 259200 \\
user interrupt at
bimg := OnTuples( bimg, S.transversal[bimg[1]] );
 called from
ImageSiftedBaseImage( S, OnTuples( BaseStabChain( S ), elm ), S.idimage, OnRight ) called from
ImageElm( map, elm ) called from
Image( zuperms, r ) called from
LatticeSubgroups( G ) called from
ConjugacyClassesSubgroups( G ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
 (360,3) & (A6 x A6) : C2 & 259200 \\gap> 
gap> 
gap> Read("session-20120317.g");
#I  computing Conway polynomial for p = 359 and n = 1
#I  computing Conway polynomial for p = 367 and n = 1
#I  computing Conway polynomial for p = 373 and n = 1
#I  computing Conway polynomial for p = 379 and n = 1
#I  computing Conway polynomial for p = 383 and n = 1
#I  computing Conway polynomial for p = 389 and n = 1
#I  computing Conway polynomial for p = 397 and n = 1
#I  computing Conway polynomial for p = 401 and n = 1
#I  computing Conway polynomial for p = 409 and n = 1
#I  computing Conway polynomial for p = 419 and n = 1
#I  computing Conway polynomial for p = 421 and n = 1
#I  computing Conway polynomial for p = 431 and n = 1
#I  computing Conway polynomial for p = 433 and n = 1
#I  computing Conway polynomial for p = 439 and n = 1
#I  computing Conway polynomial for p = 443 and n = 1
#I  computing Conway polynomial for p = 449 and n = 1
#I  computing Conway polynomial for p = 457 and n = 1
#I  computing Conway polynomial for p = 461 and n = 1
#I  computing Conway polynomial for p = 463 and n = 1
#I  computing Conway polynomial for p = 467 and n = 1
#I  computing Conway polynomial for p = 479 and n = 1
#I  computing Conway polynomial for p = 487 and n = 1
#I  computing Conway polynomial for p = 491 and n = 1
#I  computing Conway polynomial for p = 499 and n = 1
gap> Read("session-20120317.g");
#I  computing Conway polynomial for p = 503 and n = 1
#I  computing Conway polynomial for p = 509 and n = 1
#I  computing Conway polynomial for p = 521 and n = 1
#I  computing Conway polynomial for p = 523 and n = 1
#I  computing Conway polynomial for p = 541 and n = 1
#I  computing Conway polynomial for p = 547 and n = 1
#I  computing Conway polynomial for p = 557 and n = 1
#I  computing Conway polynomial for p = 563 and n = 1
#I  computing Conway polynomial for p = 569 and n = 1
#I  computing Conway polynomial for p = 571 and n = 1
#I  computing Conway polynomial for p = 577 and n = 1
#I  computing Conway polynomial for p = 587 and n = 1
#I  computing Conway polynomial for p = 593 and n = 1
#I  computing Conway polynomial for p = 599 and n = 1
#I  computing Conway polynomial for p = 601 and n = 1
#I  computing Conway polynomial for p = 607 and n = 1
#I  computing Conway polynomial for p = 613 and n = 1
#I  computing Conway polynomial for p = 617 and n = 1
#I  computing Conway polynomial for p = 619 and n = 1
#I  computing Conway polynomial for p = 631 and n = 1
#I  computing Conway polynomial for p = 641 and n = 1
#I  computing Conway polynomial for p = 643 and n = 1
#I  computing Conway polynomial for p = 647 and n = 1
#I  computing Conway polynomial for p = 653 and n = 1
#I  computing Conway polynomial for p = 659 and n = 1
#I  computing Conway polynomial for p = 661 and n = 1
#I  computing Conway polynomial for p = 673 and n = 1
#I  computing Conway polynomial for p = 677 and n = 1
#I  computing Conway polynomial for p = 683 and n = 1
#I  computing Conway polynomial for p = 691 and n = 1
#I  computing Conway polynomial for p = 701 and n = 1
#I  computing Conway polynomial for p = 709 and n = 1
#I  computing Conway polynomial for p = 719 and n = 1
#I  computing Conway polynomial for p = 727 and n = 1
#I  computing Conway polynomial for p = 733 and n = 1
#I  computing Conway polynomial for p = 739 and n = 1
#I  computing Conway polynomial for p = 743 and n = 1
#I  computing Conway polynomial for p = 751 and n = 1
#I  computing Conway polynomial for p = 757 and n = 1
#I  computing Conway polynomial for p = 761 and n = 1
#I  computing Conway polynomial for p = 769 and n = 1
#I  computing Conway polynomial for p = 773 and n = 1
#I  computing Conway polynomial for p = 787 and n = 1
#I  computing Conway polynomial for p = 797 and n = 1
#I  computing Conway polynomial for p = 809 and n = 1
#I  computing Conway polynomial for p = 811 and n = 1
#I  computing Conway polynomial for p = 821 and n = 1
#I  computing Conway polynomial for p = 823 and n = 1
#I  computing Conway polynomial for p = 827 and n = 1
#I  computing Conway polynomial for p = 829 and n = 1
#I  computing Conway polynomial for p = 839 and n = 1
#I  computing Conway polynomial for p = 853 and n = 1
#I  computing Conway polynomial for p = 857 and n = 1
#I  computing Conway polynomial for p = 859 and n = 1
#I  computing Conway polynomial for p = 863 and n = 1
#I  computing Conway polynomial for p = 877 and n = 1
#I  computing Conway polynomial for p = 881 and n = 1
#I  computing Conway polynomial for p = 883 and n = 1
#I  computing Conway polynomial for p = 887 and n = 1
#I  computing Conway polynomial for p = 907 and n = 1
#I  computing Conway polynomial for p = 911 and n = 1
#I  computing Conway polynomial for p = 919 and n = 1
#I  computing Conway polynomial for p = 929 and n = 1
#I  computing Conway polynomial for p = 937 and n = 1
#I  computing Conway polynomial for p = 941 and n = 1
#I  computing Conway polynomial for p = 947 and n = 1
#I  computing Conway polynomial for p = 953 and n = 1
#I  computing Conway polynomial for p = 967 and n = 1
#I  computing Conway polynomial for p = 971 and n = 1
#I  computing Conway polynomial for p = 977 and n = 1
#I  computing Conway polynomial for p = 983 and n = 1
#I  computing Conway polynomial for p = 991 and n = 1
#I  computing Conway polynomial for p = 997 and n = 1
#I  computing Conway polynomial for p = 1009 and n = 1
#I  computing Conway polynomial for p = 1013 and n = 1
#I  computing Conway polynomial for p = 1019 and n = 1
#I  computing Conway polynomial for p = 1021 and n = 1
#I  computing Conway polynomial for p = 1031 and n = 1
#I  computing Conway polynomial for p = 1033 and n = 1
#I  computing Conway polynomial for p = 1039 and n = 1
#I  computing Conway polynomial for p = 1049 and n = 1
#I  computing Conway polynomial for p = 1051 and n = 1
#I  computing Conway polynomial for p = 1061 and n = 1
#I  computing Conway polynomial for p = 1063 and n = 1
#I  computing Conway polynomial for p = 1069 and n = 1
#I  computing Conway polynomial for p = 1087 and n = 1
#I  computing Conway polynomial for p = 1091 and n = 1
#I  computing Conway polynomial for p = 1093 and n = 1
#I  computing Conway polynomial for p = 1097 and n = 1
#I  computing Conway polynomial for p = 1103 and n = 1
#I  computing Conway polynomial for p = 1109 and n = 1
#I  computing Conway polynomial for p = 1117 and n = 1
#I  computing Conway polynomial for p = 1123 and n = 1
#I  computing Conway polynomial for p = 1129 and n = 1
#I  computing Conway polynomial for p = 1151 and n = 1
#I  computing Conway polynomial for p = 1153 and n = 1
#I  computing Conway polynomial for p = 1163 and n = 1
#I  computing Conway polynomial for p = 1171 and n = 1
#I  computing Conway polynomial for p = 1181 and n = 1
#I  computing Conway polynomial for p = 1187 and n = 1
#I  computing Conway polynomial for p = 1193 and n = 1
#I  computing Conway polynomial for p = 1201 and n = 1
#I  computing Conway polynomial for p = 1213 and n = 1
#I  computing Conway polynomial for p = 1217 and n = 1
#I  computing Conway polynomial for p = 1223 and n = 1
#I  computing Conway polynomial for p = 1229 and n = 1
#I  computing Conway polynomial for p = 1231 and n = 1
#I  computing Conway polynomial for p = 1237 and n = 1
#I  computing Conway polynomial for p = 1249 and n = 1
#I  computing Conway polynomial for p = 1259 and n = 1
#I  computing Conway polynomial for p = 1277 and n = 1
#I  computing Conway polynomial for p = 1279 and n = 1
#I  computing Conway polynomial for p = 1283 and n = 1
#I  computing Conway polynomial for p = 1289 and n = 1
#I  computing Conway polynomial for p = 1291 and n = 1
#I  computing Conway polynomial for p = 1297 and n = 1
#I  computing Conway polynomial for p = 1301 and n = 1
#I  computing Conway polynomial for p = 1303 and n = 1
#I  computing Conway polynomial for p = 1307 and n = 1
#I  computing Conway polynomial for p = 1319 and n = 1
#I  computing Conway polynomial for p = 1321 and n = 1
#I  computing Conway polynomial for p = 1327 and n = 1
#I  computing Conway polynomial for p = 1361 and n = 1
#I  computing Conway polynomial for p = 1367 and n = 1
#I  computing Conway polynomial for p = 1373 and n = 1
#I  computing Conway polynomial for p = 1381 and n = 1
#I  computing Conway polynomial for p = 1399 and n = 1
#I  computing Conway polynomial for p = 1409 and n = 1
#I  computing Conway polynomial for p = 1423 and n = 1
#I  computing Conway polynomial for p = 1427 and n = 1
#I  computing Conway polynomial for p = 1429 and n = 1
#I  computing Conway polynomial for p = 1433 and n = 1
#I  computing Conway polynomial for p = 1439 and n = 1
#I  computing Conway polynomial for p = 1447 and n = 1
#I  computing Conway polynomial for p = 1451 and n = 1
#I  computing Conway polynomial for p = 1453 and n = 1
#I  computing Conway polynomial for p = 1459 and n = 1
#I  computing Conway polynomial for p = 1471 and n = 1
#I  computing Conway polynomial for p = 1481 and n = 1
#I  computing Conway polynomial for p = 1483 and n = 1
#I  computing Conway polynomial for p = 1487 and n = 1
#I  computing Conway polynomial for p = 1489 and n = 1
#I  computing Conway polynomial for p = 1493 and n = 1
#I  computing Conway polynomial for p = 1499 and n = 1
#I  computing Conway polynomial for p = 1511 and n = 1
#I  computing Conway polynomial for p = 1523 and n = 1
#I  computing Conway polynomial for p = 1531 and n = 1
#I  computing Conway polynomial for p = 1543 and n = 1
#I  computing Conway polynomial for p = 1549 and n = 1
#I  computing Conway polynomial for p = 1553 and n = 1
#I  computing Conway polynomial for p = 1559 and n = 1
#I  computing Conway polynomial for p = 1567 and n = 1
#I  computing Conway polynomial for p = 1571 and n = 1
#I  computing Conway polynomial for p = 1579 and n = 1
#I  computing Conway polynomial for p = 1583 and n = 1
#I  computing Conway polynomial for p = 1597 and n = 1
#I  computing Conway polynomial for p = 1601 and n = 1
#I  computing Conway polynomial for p = 1607 and n = 1
#I  computing Conway polynomial for p = 1609 and n = 1
#I  computing Conway polynomial for p = 1613 and n = 1
#I  computing Conway polynomial for p = 1619 and n = 1
#I  computing Conway polynomial for p = 1621 and n = 1
#I  computing Conway polynomial for p = 1627 and n = 1
#I  computing Conway polynomial for p = 1637 and n = 1
#I  computing Conway polynomial for p = 1657 and n = 1
#I  computing Conway polynomial for p = 1663 and n = 1
#I  computing Conway polynomial for p = 1667 and n = 1
#I  computing Conway polynomial for p = 1669 and n = 1
#I  computing Conway polynomial for p = 1693 and n = 1
#I  computing Conway polynomial for p = 1697 and n = 1
#I  computing Conway polynomial for p = 1699 and n = 1
#I  computing Conway polynomial for p = 1709 and n = 1
#I  computing Conway polynomial for p = 1721 and n = 1
#I  computing Conway polynomial for p = 1723 and n = 1
#I  computing Conway polynomial for p = 1733 and n = 1
#I  computing Conway polynomial for p = 1741 and n = 1
#I  computing Conway polynomial for p = 1747 and n = 1
#I  computing Conway polynomial for p = 1753 and n = 1
#I  computing Conway polynomial for p = 1759 and n = 1
#I  computing Conway polynomial for p = 1777 and n = 1
#I  computing Conway polynomial for p = 1783 and n = 1
#I  computing Conway polynomial for p = 1787 and n = 1
#I  computing Conway polynomial for p = 1789 and n = 1
#I  computing Conway polynomial for p = 1801 and n = 1
#I  computing Conway polynomial for p = 1811 and n = 1
#I  computing Conway polynomial for p = 1823 and n = 1
#I  computing Conway polynomial for p = 1831 and n = 1
#I  computing Conway polynomial for p = 1847 and n = 1
#I  computing Conway polynomial for p = 1861 and n = 1
#I  computing Conway polynomial for p = 1867 and n = 1
#I  computing Conway polynomial for p = 1871 and n = 1
#I  computing Conway polynomial for p = 1873 and n = 1
#I  computing Conway polynomial for p = 1877 and n = 1
#I  computing Conway polynomial for p = 1879 and n = 1
#I  computing Conway polynomial for p = 1889 and n = 1
#I  computing Conway polynomial for p = 1901 and n = 1
#I  computing Conway polynomial for p = 1907 and n = 1
#I  computing Conway polynomial for p = 1913 and n = 1
#I  computing Conway polynomial for p = 1931 and n = 1
#I  computing Conway polynomial for p = 1933 and n = 1
#I  computing Conway polynomial for p = 1949 and n = 1
#I  computing Conway polynomial for p = 1951 and n = 1
#I  computing Conway polynomial for p = 1973 and n = 1
#I  computing Conway polynomial for p = 1979 and n = 1
#I  computing Conway polynomial for p = 1987 and n = 1
#I  computing Conway polynomial for p = 1993 and n = 1
#I  computing Conway polynomial for p = 1997 and n = 1
#I  computing Conway polynomial for p = 1999 and n = 1
gap> Read("session-20120317.g");
#I  computing Conway polynomial for p = 2003 and n = 1
#I  computing Conway polynomial for p = 2011 and n = 1
#I  computing Conway polynomial for p = 2017 and n = 1
#I  computing Conway polynomial for p = 2027 and n = 1
#I  computing Conway polynomial for p = 2029 and n = 1
#I  computing Conway polynomial for p = 2039 and n = 1
#I  computing Conway polynomial for p = 2053 and n = 1
#I  computing Conway polynomial for p = 2063 and n = 1
#I  computing Conway polynomial for p = 2069 and n = 1
#I  computing Conway polynomial for p = 2081 and n = 1
#I  computing Conway polynomial for p = 2083 and n = 1
#I  computing Conway polynomial for p = 2087 and n = 1
#I  computing Conway polynomial for p = 2089 and n = 1
#I  computing Conway polynomial for p = 2099 and n = 1
#I  computing Conway polynomial for p = 2111 and n = 1
#I  computing Conway polynomial for p = 2113 and n = 1
#I  computing Conway polynomial for p = 2129 and n = 1
#I  computing Conway polynomial for p = 2131 and n = 1
#I  computing Conway polynomial for p = 2137 and n = 1
#I  computing Conway polynomial for p = 2141 and n = 1
#I  computing Conway polynomial for p = 2143 and n = 1
#I  computing Conway polynomial for p = 2153 and n = 1
#I  computing Conway polynomial for p = 2161 and n = 1
#I  computing Conway polynomial for p = 2179 and n = 1
#I  computing Conway polynomial for p = 2203 and n = 1
#I  computing Conway polynomial for p = 2207 and n = 1
#I  computing Conway polynomial for p = 2213 and n = 1
#I  computing Conway polynomial for p = 2221 and n = 1
#I  computing Conway polynomial for p = 2237 and n = 1
#I  computing Conway polynomial for p = 2239 and n = 1
#I  computing Conway polynomial for p = 2243 and n = 1
#I  computing Conway polynomial for p = 2251 and n = 1
#I  computing Conway polynomial for p = 2267 and n = 1
#I  computing Conway polynomial for p = 2269 and n = 1
#I  computing Conway polynomial for p = 2273 and n = 1
#I  computing Conway polynomial for p = 2281 and n = 1
#I  computing Conway polynomial for p = 2287 and n = 1
#I  computing Conway polynomial for p = 2293 and n = 1
#I  computing Conway polynomial for p = 2297 and n = 1
#I  computing Conway polynomial for p = 2309 and n = 1
#I  computing Conway polynomial for p = 2311 and n = 1
#I  computing Conway polynomial for p = 2333 and n = 1
#I  computing Conway polynomial for p = 2339 and n = 1
#I  computing Conway polynomial for p = 2341 and n = 1
#I  computing Conway polynomial for p = 2347 and n = 1
#I  computing Conway polynomial for p = 2351 and n = 1
#I  computing Conway polynomial for p = 2357 and n = 1
#I  computing Conway polynomial for p = 2371 and n = 1
#I  computing Conway polynomial for p = 2377 and n = 1
#I  computing Conway polynomial for p = 2381 and n = 1
#I  computing Conway polynomial for p = 2383 and n = 1
#I  computing Conway polynomial for p = 2389 and n = 1
#I  computing Conway polynomial for p = 2393 and n = 1
#I  computing Conway polynomial for p = 2399 and n = 1
#I  computing Conway polynomial for p = 2411 and n = 1
#I  computing Conway polynomial for p = 2417 and n = 1
#I  computing Conway polynomial for p = 2423 and n = 1
#I  computing Conway polynomial for p = 2437 and n = 1
#I  computing Conway polynomial for p = 2441 and n = 1
#I  computing Conway polynomial for p = 2447 and n = 1
#I  computing Conway polynomial for p = 2459 and n = 1
#I  computing Conway polynomial for p = 2467 and n = 1
#I  computing Conway polynomial for p = 2473 and n = 1
#I  computing Conway polynomial for p = 2477 and n = 1
gap> Read("session-20120317.g");
Error, Primitive groups of degree 2501 are not known! called from
PrimGrpLoad( deg ); called from
NrPrimitiveGroups( i ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> 
gap> 
gap> Order(AlternatingGroup(11));
19958400
gap> g:=PrimitiveGroup(11,7);
A(11)
gap> Order(g);
19958400
gap> Order(g);
19958400
gap> 
gap> 
gap> 60^6
> ;
46656000000
gap> 
gap> 
gap> G := Group([(2,3)(4,7)(5,9)(6,8), (1,3)(4,9)(5,8)(6,7), (1,4,7)(2,5,8)(3,6,9)]);
Group([ (2,3)(4,7)(5,9)(6,8), (1,3)(4,9)(5,8)(6,7), (1,4,7)(2,5,8)(3,6,9) ])
gap> StructureDescription(G);
"(C3 x C3) : C2"
gap> g := Group([(2,3)(4,7)(5,9)(6,8), (1,3)(4,9)(5,8)(6,7), (1,4,7)(2,5,8)(3,6,9)]);
Group([ (2,3)(4,7)(5,9)(6,8), (1,3)(4,9)(5,8)(6,7), (1,4,7)(2,5,8)(3,6,9) ])
gap> StructureDescription(g);
"(C3 x C3) : C2"
gap> LogTo("session20120320.gap");
#I  Already logging to ONanScott-20120317.g
gap> LogTo();
