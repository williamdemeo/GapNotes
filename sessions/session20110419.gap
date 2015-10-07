# Let's look for examples of the gluing construction.

# Example: M_{3,3}
G := SmallGroup(8,2);
act:=Action(G, G, OnRight);
Con:=GsetCongruences(act);
# returns 
# [ [ 1, 2, 3, 4, 5, 6, 7, 8 ], [ [ 1, 2, 5, 6 ], [ 3, 4, 7, 8 ] ], 
#   [ [ 1, 3 ], [ 5, 7 ], [ 2, 4 ], [ 6, 8 ] ], [ [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ] ], 
#   [ [ 1, 2 ], [ 5, 6 ], [ 3, 4 ], [ 7, 8 ] ], [ [ 1, 2, 7, 8 ], [ 3, 4, 5, 6 ] ], 
#   [ [ 1, 4 ], [ 5, 8 ], [ 2, 3 ], [ 6, 7 ] ], 
#   [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ], [ 6 ], [ 7 ], [ 8 ] ] ]

# This suggests that the following might be a closed glueing of pentagons:
n=8;
gam1='|0,2|1|3|4|5|6|7|';
gam2='|0,2|1,3|4|5|6|7|';
gam3='|0,1,2,3|4,5|6,7|';
gam4='|0,1,2,3|4,5,6,7|';
gam5='|0,1,4,5|2,3,6,7|';
gammas=[gam1;gam2;gam3;gam4;gam5];
[lambda, rho] = displayClosure(gammas, n, 0, 0, 1, 0);
# Yes, it's closed.

n=8;
gam1='|0,2|1,3|4|5|6|7|';
gam2='|0,1|2|3|4,5|6,7|';
gam3='|0,1,2,3|4,5|6,7|';
gam4='|0,1,2,3|4,5,6,7|';
gam5='|0,1,4,5|2,3,6,7|';
gammas=[gam1;gam2;gam3;gam4;gam5];
[lambda, rho] = displayClosure(gammas, n, 0, 0, 1, 0);
# Yes, it's closed.

# Example: 
G := SmallGroup(24,13);
ccsg:=ConjugacyClassesSubgroups(G);
List(ccsg, x->Index(G,Representative(x)));
# returns [ 24, 12, 12, 12, 8, 6, 6, 6, 4, 3, 2, 1 ]
H:=Representative(ccsg[2]);
act:=Action(G, RightCosets(G,H), OnRight);
Con:=GsetCongruences(act);
# returns 
# [ [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], 
#   [ [ 1, 2 ], [ 3, 5 ], [ 4, 6 ], [ 7, 9 ], [ 8, 10 ], [ 11, 12 ] ], 
#   [ [ 1, 2, 4, 6 ], [ 3, 5, 8, 10 ], [ 7, 9, 11, 12 ] ], 
#   [ [ 1, 3, 4, 7, 8, 11 ], [ 2, 5, 6, 9, 10, 12 ] ], 
#   [ [ 1, 4 ], [ 2, 6 ], [ 3, 8 ], [ 5, 10 ], [ 7, 11 ], [ 9, 12 ] ], 
#   [ [ 1, 6 ], [ 2, 4 ], [ 3, 10 ], [ 5, 8 ], [ 7, 12 ], [ 9, 11 ] ], 
#   [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ], [ 6 ], [ 7 ], [ 8 ], [ 9 ], [ 10 ], [ 11 ], [ 12 ] ] ];

# Let's check if a variant of this is closed:
n=12;
gam1 = '|1,2,3,4|5,6,7,8|9,10,11,12|';
gam2 = '|1,2,5,6,9,10|3,4,7,8,11,12|';
gam3 = '|1,3|2,4|5,7|6,8|9,11|10,12|';
gam4 = '|1,4|2,3|5,8|6,7|9,12|10,11|';
gammas=[gam1;gam2;gam3;gam4];
[lambda, rho] = displayClosure(gammas, n, 0, 0, 1, 1);
# Yes, it's closed.

# let's make sure the sublattices are closed in their respective subrepresentations:
n=4;
gam1 = '|1,2|3,4|';
gam2 = '|1,3|2,4|';
gam3 = '|1,4|2,3|';
gammas=[gam1;gam2;gam3];
[lambda, rho] = displayClosure(gammas, n, 0, 0, 1, 1);
# yes, it's closed.  Obviously the 2x2 is also closed (it's distributive).