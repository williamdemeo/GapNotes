gap> a3 := AlternatingGroup(3);
Alt( [ 1 .. 3 ] )
gap> Elements(a3);
[ (), (1,2,3), (1,3,2) ]
gap> Generators(a3);
Variable: 'Generators' must have a value

gap> GeneratorsOfGroup(a3);
[ (1,2,3) ]
gap> IsCyclic(a3);
true
gap> Order(a3);
3
gap> s3 := SymmetricGroup(3);
Sym( [ 1 .. 3 ] )
gap> d3 := DihedralGroup(3);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 2nd choice method found for `DihedralGroupCons' on 2 arguments called \
from
DihedralGroupCons( IsPcGroup, arg[1] ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> d6 := DihedralGroup(6);
<pc group of size 6 with 2 generators>
gap> GeneratorsOfGroup(s3);
[ (1,2,3), (1,2) ]
gap> GeneratorsOfGroup(d6);
[ f1, f2 ]
gap> IsDihedralGroup(s3);
true
gap> Elements(a3);
[ (), (1,2,3), (1,3,2) ]
gap> w := WreathProduct(s3,a3);
Group([ (1,2,3), (1,2), (4,5,6), (4,5), (7,8,9), (7,8), (1,4,7)(2,5,8)(3,6,9) ])
gap> Order(w);
648
gap> quit;
