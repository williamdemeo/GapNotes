g:=DihedralGroup(22);
G:=Action(g,g,OnRight);
#Read("gap2uacalc.g");
#gset2uacalc([G]);
Read("Overalgebras.g");
Overalgebra([G, [0,1,2,3,4,5,6,7]]);

