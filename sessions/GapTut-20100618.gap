gap> s8 := Group( (1,2), (1,2,3,4,5,6,7,8));
Group([ (1,2), (1,2,3,4,5,6,7,8) ])
gap> SizeScreen([ 0075, 0049 ]);;
gap> SizeScreen([ 0071, 0049 ]);;
gap> SizeScreen([ 0074, 0049 ]);;
gap> SizeScreen([ 0072, 0049 ]);;
gap> SizeScreen([ 0073, 0049 ]);;
gap> a8 := DerivedSubgroup( s8 );
Group([ (1,2,3), (2,3,4), (2,4)(3,5), (2,6,4), (2,4)(5,7), 
  (2,8,6,4)(3,5) ])
gap> Size( a8 ); IsAbelian( a8 ); IsPerfect( a8 );
20160
false
true
gap> 8!/2;
Syntax error: ; expected
8!/2;
 ^
gap> Factorial(8)/2;
20160
gap> LogTo();
