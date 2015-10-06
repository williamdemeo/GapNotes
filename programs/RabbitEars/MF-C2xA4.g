# Gap commands which generated the file MF-C2xA4-0-2-6.ua
gap> G:=Group( [ (2,8)(3,9)(4,10)(5,11), (1,7)(2,8)(3,9)(6,12), (1,5,9)(2,6,10)(3,7,11)(4,8,12), ( 1,12)( 2, 3)( 4, 5)( 6, 7)( 8, 9)(10,11) ] );;
gap> H:=Stabilizer(G,1);;
gap> act:=Action(G,RightCosets(G,H), OnRight);;
gap> for b in AllBlocks(act) do Print(Orbit(act,b,OnSets), "\n"); od;
[ [ 1, 2 ], [ 7, 9 ], [ 4, 6 ], [ 3, 5 ], [ 11, 12 ], [ 8, 10 ] ]
[ [ 1, 2, 3, 5, 7, 9 ], [ 4, 6, 8, 10, 11, 12 ] ]
[ [ 1, 2, 4, 6 ], [ 7, 9, 11, 12 ], [ 3, 5, 8, 10 ] ]
[ [ 1, 4 ], [ 2, 6 ], [ 7, 11 ], [ 9, 12 ], [ 3, 8 ], [ 5, 10 ] ]
[ [ 1, 6 ], [ 2, 4 ], [ 7, 12 ], [ 9, 11 ], [ 3, 10 ], [ 5, 8 ] ]
gap> Read("RabbitEars.g");
gap> Manifoil([act, [1,3,7], "C2xA4"]);
<!--
# Gap commands which generated the file MF-C2xA4-0-2-6.ua
gap> G:=Group( [ (2,8)(3,9)(4,10)(5,11), (1,7)(2,8)(3,9)(6,12), (1,5,9)(2,6,10)(3,7,11)(4,8,12), ( 1,12)( 2, 3)( 4, 5)( 6, 7)( 8, 9)(10,11) ] );;
gap> H:=Stabilizer(G,1);;
gap> act:=Action(G,RightCosets(G,H), OnRight);;
gap> for b in AllBlocks(act) do Print(Orbit(act,b,OnSets), "\n"); od;
[ [ 1, 2 ], [ 7, 9 ], [ 4, 6 ], [ 3, 5 ], [ 11, 12 ], [ 8, 10 ] ]
[ [ 1, 2, 3, 5, 7, 9 ], [ 4, 6, 8, 10, 11, 12 ] ]
[ [ 1, 2, 4, 6 ], [ 7, 9, 11, 12 ], [ 3, 5, 8, 10 ] ]
[ [ 1, 4 ], [ 2, 6 ], [ 7, 11 ], [ 9, 12 ], [ 3, 8 ], [ 5, 10 ] ]
[ [ 1, 6 ], [ 2, 4 ], [ 7, 12 ], [ 9, 11 ], [ 3, 10 ], [ 5, 8 ] ]
gap> Read("RabbitEars.g");
gap> Manifoil([act, [1,3,7], "C2xA4"]);
-->
