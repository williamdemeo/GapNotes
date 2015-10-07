gap> SizeScreen([ 0089, 0049 ]);;
gap> SizeScreen([ 0088, 0049 ]);;
gap> SizeScreen([ 0086, 0049 ]);;
gap> SizeScreen([ 0084, 0049 ]);;
gap> SizeScreen([ 0083, 0049 ]);;
gap> SizeScreen([ 0082, 0049 ]);;
gap> SizeScreen([ 0080, 0049 ]);;
gap> SizeScreen([ 0078, 0049 ]);;
gap> SizeScreen([ 0077, 0049 ]);;
gap> SizeScreen([ 0076, 0049 ]);;
gap> SizeScreen([ 0075, 0049 ]);;
gap> SizeScreen([ 0074, 0049 ]);;
gap> SizeScreen([ 0073, 0049 ]);;
gap> SizeScreen([ 0072, 0049 ]);;
gap> SizeScreen([ 0071, 0049 ]);;
gap> SizeScreen([ 0070, 0049 ]);;
gap> SizeScreen([ 0069, 0049 ]);;
gap> SizeScreen([ 0068, 0049 ]);;
gap> SizeScreen([ 0067, 0049 ]);;
gap> SizeScreen([ 0068, 0049 ]);;
gap> SizeScreen([ 0069, 0049 ]);;
gap> SizeScreen([ 0070, 0049 ]);;
gap> SizeScreen([ 0071, 0049 ]);;
gap> SizeScreen([ 0072, 0049 ]);;
gap> g := Group((1,2,3), (1,2));
Group([ (1,2,3), (1,2) ])
gap> Size(g);
6
gap> Elements(g);
[ (), (2,3), (1,2), (1,2,3), (1,3,2), (1,3) ]
gap> SymmetricGroup(3);
Sym( [ 1 .. 3 ] )
gap> Elements(last);
[ (), (2,3), (1,2), (1,2,3), (1,3,2), (1,3) ]
gap> d:=DirectProduct(g,g);
Group([ (1,2,3), (1,2), (4,5,6), (4,5) ])
gap> GraphicSubgroupLattice(d);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 0, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1\
8,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41\
,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,G)
gap> e1:=Embedding(d,1);
1st embedding into Group([ (1,2,3), (1,2), (4,5,6), (4,5) ])
gap> ImageSource(e1);
Variable: 'ImageSource' must have a value

gap> ImagesSource(e1);
Group([ (1,2,3), (1,2) ])
gap> Range(e1);
Group([ (1,2,3), (1,2), (4,5,6), (4,5) ])
gap> Image(e1,(2,3));
(2,3)
gap> Image(e1,(1,2));
(1,2)
gap> Image(e1,(1,2,3));
(1,2,3)
gap> Image(e1,(1,3));
(1,3)
gap> Elements(d);
[ (), (5,6), (4,5), (4,5,6), (4,6,5), (4,6), (2,3), (2,3)(5,6), 
  (2,3)(4,5), (2,3)(4,5,6), (2,3)(4,6,5), (2,3)(4,6), (1,2), 
  (1,2)(5,6), (1,2)(4,5), (1,2)(4,5,6), (1,2)(4,6,5), (1,2)(4,6), 
  (1,2,3), (1,2,3)(5,6), (1,2,3)(4,5), (1,2,3)(4,5,6), 
  (1,2,3)(4,6,5), (1,2,3)(4,6), (1,3,2), (1,3,2)(5,6), (1,3,2)(4,5), 
  (1,3,2)(4,5,6), (1,3,2)(4,6,5), (1,3,2)(4,6), (1,3), (1,3)(5,6), 
  (1,3)(4,5), (1,3)(4,5,6), (1,3)(4,6,5), (1,3)(4,6) ]
gap> Size(g);
6
gap> Size(d);
36
gap> 6^3;
216
gap> a3:=AlternatingGroup(3);
Alt( [ 1 .. 3 ] )
gap> s3:=SymmetricGroup(3);
Sym( [ 1 .. 3 ] )
gap> a3s3 := DirectProduct(a3,s3);
Group([ (1,2,3), (4,5,6), (4,5) ])
gap> Size(a3);
3
gap> Size(s3);
6
gap> Size(a3s3);
18
gap> GraphicSubgroupLattice(a3s3);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 1, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,G)
gap> PointerButtonDown(1,405,348,1);
gap> PointerButtonDown(1,402,153,1);
gap> PointerButtonDown(1,381,351,1);
gap> PointerButtonDown(1,396,452,1);
gap> PointerButtonDown(1,195,351,1);
gap> GraphicSubgroupLattice(s3);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 2, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,G)
gap> PointerButtonDown(2,400,374,1);
gap> PointerButtonDown(2,401,222,1);
gap> PointerButtonDown(2,330,375,1);
gap> GraphicSubgroupLattice(a3);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 3, 2, 1 );
#I  All Subgroups (G) --> (1,G)
gap> MenuSelected( 3, 2, 1 );
#I  All Subgroups (G) --> (1,G)
gap> PointerButtonDown(1,420,381,1);
gap> PointerButtonDown(1,453,246,1);
gap> PointerButtonDown(1,366,390,1);
gap> PointerButtonDown(1,547,160,1);
gap> PointerButtonDown(1,603,346,1);
gap> PointerButtonDown(1,538,353,1);
gap> PointerButtonDown(1,617,154,1);
gap> PointerButtonDown(1,191,253,1);
gap> PointerButtonDown(1,396,380,1);
gap> PointerButtonDown(1,401,551,1);
gap> PointerButtonDown(1,285,486,1);
gap> PointerButtonDown(1,340,373,1);
gap> PointerButtonDown(1,504,351,1);
gap> PointerButtonDown(1,523,362,1);
gap> PointerButtonDown(1,583,357,1);
gap> PointerButtonDown(1,345,349,1);
gap> PointerButtonDown(1,579,148,1);
gap> PointerButtonDown(1,373,375,1);
gap> PointerButtonDown(1,443,237,1);
gap> PointerButtonDown(1,225,443,1);
gap> PointerButtonDown(1,145,249,1);
gap> PointerButtonDown(1,385,387,1);
gap> PointerButtonDown(1,404,382,1);
gap> PointerButtonDown(1,473,235,1);
gap> PointerButtonDown(1,610,163,1);
gap> PointerButtonDown(1,443,233,1);
gap> PointerButtonDown(1,660,345,1);
gap> PointerButtonDown(1,355,383,1);
gap> PointerButtonDown(1,253,436,1);
gap> PointerButtonDown(1,251,444,1);
gap> PointerButtonDown(1,183,238,1);
gap> PointerButtonDown(1,585,355,1);
gap> PointerButtonDown(1,578,356,1);
gap> PointerButtonDown(1,583,356,1);
gap> PointerButtonDown(1,397,55,1);
gap> MenuSelected( 1, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,G)
gap> PointerButtonDown(1,580,169,1);
gap> PointerButtonDown(1,552,354,1);
gap> PointerButtonDown(1,364,384,1);
gap> PointerButtonDown(1,261,431,1);
gap> s3;
Sym( [ 1 .. 3 ] )
gap> GraphicSubgroupLattice(s3);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 4, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,G)
gap> MenuSelected( 1, 0, 1 );
gap> MenuSelected( 1, 1, 7 );
gap> PointerButtonDown(1,684,796,1);
gap> PointerButtonDown(1,316,627,1);
gap> PointerButtonDown(1,276,336,1);
gap> PointerButtonDown(1,551,550,1);
gap> PointerButtonDown(1,600,336,1);
gap> PointerButtonDown(1,751,523,1);
gap> PointerButtonDown(1,920,507,1);
gap> PointerButtonDown(1,844,233,1);
gap> PointerButtonDown(1,465,375,1);
gap> PointerButtonDown(1,662,285,1);
gap> PointerButtonDown(1,573,73,1);
gap> PointerButtonDown(1,330,558,1);
gap> PointerButtonDown(1,667,560,1);
gap> PointerButtonDown(1,363,140,1);
gap> PointerButtonDown(1,446,391,1);
gap> PointerButtonDown(1,178,625,1);
gap> PointerButtonDown(1,332,542,1);
gap> PointerButtonDown(1,73,349,1);
gap> PointerButtonDown(1,618,273,1);
gap> PointerButtonDown(1,380,519,1);
gap> PointerButtonDown(1,475,396,1);
gap> PointerButtonDown(1,225,622,1);
gap> PointerButtonDown(1,479,379,1);
gap> PointerButtonDown(1,323,498,1);
gap> PointerButtonDown(1,622,227,1);
gap> PointerButtonDown(1,339,488,1);
gap> PointerButtonDown(1,451,790,1);
gap> PointerButtonDown(1,450,804,1);
gap> PointerButtonDown(1,405,134,1);
gap> PointerButtonDown(1,141,349,1);
gap> PointerButtonDown(1,576,220,1);
gap> PointerButtonDown(1,293,486,1);
gap> PointerButtonDown(1,312,496,1);
gap> PointerButtonDown(1,205,617,1);
gap> PointerButtonDown(1,411,137,1);
gap> MenuSelected( 1, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,G)
gap> PointerButtonDown(1,663,514,1);
gap> PointerButtonDown(1,677,510,1);
gap> PointerButtonDown(1,297,494,1);
gap> PointerButtonDown(1,316,487,1);
gap> PointerButtonDown(1,138,369,1);
gap> PointerButtonDown(1,232,637,1);
gap> PointerButtonDown(1,531,567,1);
gap> PointerButtonDown(1,530,500,1);
gap> MenuSelected( 1, 0, 1 );
gap> PointerButtonDown(1,305,480,1);
gap> PointerButtonDown(1,605,219,1);
gap> PointerButtonDown(1,328,489,1);
gap> PointerButtonDown(1,457,379,1);
gap> PointerButtonDown(1,239,632,1);
gap> PointerButtonDown(1,337,510,1);
gap> PointerButtonDown(1,620,259,1);
gap> PointerButtonDown(1,440,358,1);
gap> PointerButtonDown(1,159,626,1);
gap> PointerButtonDown(1,638,240,1);
gap> PointerButtonDown(1,608,227,1);
gap> PointerButtonDown(1,357,517,1);
gap> PointerButtonDown(1,348,519,1);
gap> PointerButtonDown(1,126,361,1);
gap> PointerButtonDown(1,128,346,1);
gap> MenuSelected( 1, 0, 1 );
gap> PointerButtonDown(1,406,135,1);
gap> PointerButtonDown(1,126,347,1);
gap> PointerButtonDown(1,89,355,1);
gap> PointerButtonDown(1,628,239,1);
gap> PointerButtonDown(1,96,335,1);
gap> PointerButtonDown(1,473,347,1);
gap> PointerButtonDown(1,485,346,1);
gap> PointerButtonDown(1,516,335,1);
gap> PointerButtonDown(1,199,608,1);
gap> PointerButtonDown(1,232,610,1);
gap> PointerButtonDown(1,469,339,1);
gap> PointerButtonDown(1,631,227,1);
gap> PointerButtonDown(1,86,338,1);
gap> PointerButtonDown(1,86,350,1);
gap> PointerButtonDown(1,356,525,1);
gap> PointerButtonDown(1,374,513,1);
gap> PointerButtonDown(1,203,645,1);
gap> PointerButtonDown(1,642,227,1);
gap> PointerButtonDown(1,655,225,1);
gap> PointerButtonDown(1,374,518,1);
gap> PointerButtonDown(1,546,507,1);
gap> MenuSelected( 1, 0, 1 );
gap> s3a3 := DirectProduct(s3,a3);
Group([ (1,2,3), (1,2), (4,5,6) ])
gap> GraphicSubgroupLattice(s3a3);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 5, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,G)
gap> PointerButtonDown(5,404,153,1);
gap> PointerButtonDown(5,400,252,1);
gap> PointerButtonDown(5,243,245,1);
gap> PointerButtonDown(5,189,348,1);
gap> PointerButtonDown(5,398,347,1);
gap> PointerButtonDown(5,390,452,1);
gap> PointerButtonDown(5,580,354,1);
gap> PointerButtonDown(5,494,191,1);
gap> PointerButtonDown(5,394,325,1);
gap> PointerButtonDown(5,561,286,1);
gap> PointerButtonDown(5,602,346,1);
gap> PointerButtonDown(5,687,239,1);
gap> PointerButtonDown(5,531,130,1);
gap> PointerButtonDown(5,105,235,1);
gap> PointerButtonDown(5,401,52,1);
gap> PointerButtonDown(5,456,324,1);
gap> PointerButtonDown(5,411,341,1);
gap> PointerButtonDown(5,626,262,1);
gap> PointerButtonDown(5,346,423,1);
gap> PointerButtonDown(5,415,158,1);
gap> PointerButtonDown(5,159,383,1);
gap> PointerButtonDown(5,436,174,1);
gap> PointerButtonDown(5,450,329,1);
gap> PointerButtonDown(5,421,330,1);
gap> PointerButtonDown(5,402,323,1);
gap> PointerButtonDown(5,627,374,1);
gap> PointerButtonDown(5,605,368,1);
gap> PointerButtonDown(5,623,250,1);
gap> PointerButtonDown(5,378,432,1);
gap> PointerButtonDown(5,321,444,1);
gap> PointerButtonDown(5,138,226,1);
gap> PointerButtonDown(5,406,32,1);
gap> PointerButtonDown(5,603,352,1);
gap> PointerButtonDown(5,615,348,1);
gap> PointerButtonDown(5,420,166,1);
gap> PointerButtonDown(5,169,363,1);
gap> PointerButtonDown(5,416,336,1);
gap> PointerButtonDown(5,433,331,1);
gap> PointerButtonDown(5,409,326,1);
gap> PointerButtonDown(5,413,325,1);
gap> PointerButtonDown(5,420,32,1);
gap> MenuSelected( 5, 1, 7 );
gap> PointerButtonDown(5,601,45,1);
gap> PointerButtonDown(5,601,225,1);
gap> PointerButtonDown(5,576,782,1);
gap> PointerButtonDown(5,480,631,1);
gap> PointerButtonDown(5,908,487,1);
gap> PointerButtonDown(5,808,345,1);
gap> PointerButtonDown(5,241,504,1);
gap> PointerButtonDown(5,604,465,1);
gap> PointerButtonDown(5,243,322,1);
gap> PointerButtonDown(5,237,502,1);
gap> PointerButtonDown(5,167,502,1);
gap> PointerButtonDown(5,135,334,1);
gap> PointerButtonDown(5,535,489,1);
gap> PointerButtonDown(5,707,495,1);
gap> PointerButtonDown(5,673,344,1);
gap> PointerButtonDown(5,491,770,1);
gap> PointerButtonDown(5,201,496,1);
gap> PointerButtonDown(5,715,498,1);
gap> PointerButtonDown(5,206,353,1);
gap> PointerButtonDown(5,719,345,1);
gap> PointerButtonDown(5,416,634,1);
gap> PointerButtonDown(5,475,495,1);
gap> PointerButtonDown(5,746,502,1);
gap> PointerButtonDown(5,180,502,1);
gap> PointerButtonDown(5,729,346,1);
gap> PointerButtonDown(5,488,502,1);
gap> MenuSelected( 5, 0, 1 );
gap> s3a3;
Group([ (1,2,3), (1,2), (4,5,6) ])
gap> a3s3;
Group([ (1,2,3), (4,5,6), (4,5) ])
gap> MenuSelected( 5, 1, 16 );
gap> MenuSelected( 5, 0, 1 );
gap> PointerButtonDown(5,477,213,1);
gap> MenuSelected( 5, 2, 19 );
#I  SelectedGroups to GAP (13)
gap> MenuSelected( 5, 2, 19 );
#I  SelectedGroups to GAP (13)
gap> PointerButtonDown(5,476,218,1);
gap> PointerButtonDown(5,476,218,2);
gap> ButtonSelected(0,2);
true
gap> PointerButtonDown(5,313,229,1);
gap> ConjugacyClassesSubgroups(s3a3);
[ Group( () )^G, Group( [ (2,3) ] )^G, Group( [ (1,2,3) ] )^G, 
  Group( [ (4,5,6) ] )^G, Group( [ (1,2,3)(4,5,6) ] )^G, 
  Group( [ (1,3,2), (1,2) ] )^G, Group( [ (4,5,6), (2,3) ] )^G, 
  Group( [ (1,3,2), (4,5,6) ] )^G, 
  Group( [ (1,3,2), (1,2), (4,5,6) ] )^G ]
gap> List(ConjugacyClassesSubgroups(s3a3), x-> Size(x));
[ 1, 3, 1, 1, 2, 1, 3, 1, 1 ]
gap> ccls := ConjugacyClassesSubgroups(s3a3);
[ Group( () )^G, Group( [ (2,3) ] )^G, Group( [ (1,2,3) ] )^G, 
  Group( [ (4,5,6) ] )^G, Group( [ (1,2,3)(4,5,6) ] )^G, 
  Group( [ (1,3,2), (1,2) ] )^G, Group( [ (4,5,6), (2,3) ] )^G, 
  Group( [ (1,3,2), (4,5,6) ] )^G, 
  Group( [ (1,3,2), (1,2), (4,5,6) ] )^G ]
gap> Order(Representative(ccls[8]));
9
gap> Representative(ccls[8]);
Group([ (1,3,2), (4,5,6) ])
gap> GraphicSubgroupLattice(Representative(ccls[8]));
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 6, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,G)
gap> a4;
Variable: 'a4' must have a value

gap> a4 := AlternatingGroup(4);
Alt( [ 1 .. 4 ] )
gap> a4a4 := DirectProduct(a4,a4);
Group([ (1,2,3), (2,3,4), (5,6,7), (6,7,8) ])
gap> Order(a4a4);
144
gap> GraphicSubgroupLattice(a4a4);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 7, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1\
8,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41\
,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,\
65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,8\
8,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108\
,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,1\
26,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143\
,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,1\
61,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178\
,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,1\
96,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213\
,214,215,G)
gap> a4a3 := DirectProduct(a4,a3);
Group([ (1,2,3), (2,3,4), (5,6,7) ])
gap> GraphicSubgroupLattice(a4a3);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 8, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1\
8,19,20,21,22,23,24,25,26,27,28,29,G)
gap> MenuSelected( 8, 1, 7 );
gap> PointerButtonDown(8,573,429,1);
gap> PointerButtonDown(8,424,235,1);
gap> PointerButtonDown(8,203,459,1);
gap> PointerButtonDown(8,277,617,1);
gap> PointerButtonDown(8,589,713,1);
gap> PointerButtonDown(8,577,518,1);
gap> PointerButtonDown(8,937,615,1);
gap> PointerButtonDown(8,654,608,1);
gap> PointerButtonDown(8,653,332,1);
gap> PointerButtonDown(8,787,322,1);
gap> PointerButtonDown(8,496,617,1);
gap> PointerButtonDown(8,759,592,1);
gap> PointerButtonDown(8,328,550,1);
gap> PointerButtonDown(8,328,550,1);
gap> PointerButtonDown(8,577,235,1);
gap> PointerButtonDown(8,282,241,1);
gap> PointerButtonDown(8,106,275,1);
gap> PointerButtonDown(8,597,242,1);
gap> PointerButtonDown(8,844,588,1);
gap> PointerButtonDown(8,372,343,1);
gap> PointerButtonDown(8,417,706,1);
gap> GraphicSubgroupLattice(a4);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 9, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,G)
gap> PointerButtonDown(9,397,253,1);
gap> PointerButtonDown(9,397,451,1);
gap> PointerButtonDown(8,949,497,1);
gap> PointerButtonDown(8,446,262,1);
gap> PointerButtonDown(8,306,301,1);
gap> PointerButtonDown(8,187,208,1);
gap> PointerButtonDown(8,234,229,1);
gap> PointerButtonDown(8,234,229,1);
gap> PointerButtonDown(8,875,242,1);
gap> PointerButtonDown(8,923,495,1);
gap> PointerButtonDown(8,651,247,1);
gap> GraphicSubgroupLattice(a3);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 10, 2, 1 );
#I  All Subgroups (G) --> (1,G)
gap> PointerButtonDown(8,821,586,1);
gap> MenuSelected( 8, 1, 8 );
gap> PointerButtonDown(8,406,552,1);
gap> PointerButtonDown(8,405,31,1);
gap> PointerButtonDown(8,469,336,1);
gap> PointerButtonDown(8,514,157,1);
gap> PointerButtonDown(8,401,168,1);
gap> PointerButtonDown(8,326,225,1);
gap> PointerButtonDown(8,361,228,1);
gap> PointerButtonDown(8,549,216,1);
gap> PointerButtonDown(8,578,150,1);
gap> PointerButtonDown(8,406,178,1);
gap> PointerButtonDown(8,454,176,1);
gap> PointerButtonDown(8,676,162,1);
gap> PointerButtonDown(8,520,209,1);
gap> PointerButtonDown(8,288,179,1);
gap> PointerButtonDown(8,477,183,1);
gap> PointerButtonDown(8,388,185,1);
gap> PointerButtonDown(8,421,179,1);
gap> PointerButtonDown(8,400,337,1);
gap> PointerButtonDown(8,619,394,1);
gap> PointerButtonDown(8,479,408,1);
gap> PointerButtonDown(8,517,345,1);
gap> PointerButtonDown(8,404,573,1);
gap> PointerButtonDown(8,613,405,1);
gap> PointerButtonDown(8,406,354,1);
gap> CyclicGroup(2);
<pc group of size 2 with 1 generators>
gap> c2 := CyclicGroup(2);
<pc group of size 2 with 1 generators>
gap> a4c2 := DirectProduct(a4,c2);
<group of size 24 with 3 generators>
gap> GraphicSubgroupLattice(a4c2);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 11, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1\
8,19,20,21,22,23,24,25,G)
gap> PointerButtonDown(11,396,191,1);
gap> PointerButtonDown(11,192,337,1);
gap> PointerButtonDown(11,398,334,1);
gap> PointerButtonDown(11,400,111,1);
gap> PointerButtonDown(11,395,483,1);
gap> PointerButtonDown(11,247,341,1);
gap> PointerButtonDown(11,520,113,1);
gap> PointerButtonDown(11,332,312,1);
gap> PointerButtonDown(11,406,412,1);
gap> PointerButtonDown(11,191,168,1);
gap> PointerButtonDown(11,366,485,1);
gap> PointerButtonDown(11,188,331,1);
gap> PointerButtonDown(11,211,161,1);
gap> PointerButtonDown(11,44,119,1);
gap> PointerButtonDown(11,368,170,1);
gap> PointerButtonDown(11,310,181,1);
gap> PointerButtonDown(11,584,461,1);
gap> PointerButtonDown(11,609,341,1);
gap> PointerButtonDown(11,603,489,1);
gap> PointerButtonDown(11,419,315,1);
gap> PointerButtonDown(11,478,332,1);
gap> PointerButtonDown(11,613,309,1);
gap> PointerButtonDown(11,485,259,1);
gap> PointerButtonDown(11,414,313,1);
gap> PointerButtonDown(11,569,167,1);
gap> PointerButtonDown(11,615,160,1);
gap> PointerButtonDown(11,520,260,1);
gap> PointerButtonDown(11,251,483,1);
gap> PointerButtonDown(11,62,342,1);
gap> PointerButtonDown(11,282,394,1);
gap> PointerButtonDown(11,360,457,1);
gap> PointerButtonDown(11,126,426,1);
gap> PointerButtonDown(11,148,137,1);
gap> PointerButtonDown(11,77,122,1);
gap> PointerButtonDown(11,279,308,1);
gap> PointerButtonDown(11,510,192,1);
gap> PointerButtonDown(11,508,180,1);
gap> PointerButtonDown(11,661,311,1);
gap> PointerButtonDown(11,514,260,1);
gap> PointerButtonDown(11,453,265,1);
gap> PointerButtonDown(11,454,332,1);
gap> PointerButtonDown(11,407,342,1);
gap> PointerButtonDown(11,679,482,1);
gap> PointerButtonDown(11,258,307,1);
gap> PointerButtonDown(11,441,349,1);
gap> PointerButtonDown(11,597,186,1);
gap> PointerButtonDown(11,398,37,1);
gap> PointerButtonDown(11,593,182,1);
gap> PointerButtonDown(11,716,473,1);
gap> PointerButtonDown(11,398,563,1);
gap> PointerButtonDown(11,262,315,1);
gap> PointerButtonDown(11,485,262,1);
gap> PointerButtonDown(11,469,350,1);
gap> PointerButtonDown(11,493,352,1);
gap> PointerButtonDown(11,526,470,1);
gap> PointerButtonDown(11,510,358,1);
gap> PointerButtonDown(11,108,138,1);
gap> PointerButtonDown(11,389,18,1);
gap> MenuSelected( 11, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1\
8,19,20,21,22,23,24,25,G)
gap> MenuSelected( 11, 1, 16 );
gap> PointerButtonDown(11,258,132,1);
gap> PointerButtonDown(11,395,11,1);
gap> PointerButtonDown(11,394,15,1);
gap> PointerButtonDown(11,476,264,1);
gap> PointerButtonDown(11,448,265,1);
gap> PointerButtonDown(11,387,14,1);
gap> MenuSelected( 11, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1\
8,19,20,21,22,23,24,25,G)
gap> MenuSelected( 11, 1, 7 );
gap> MenuSelected( 11, 1, 8 );
gap> MenuSelected( 11, 0, 1 );
gap> PointerButtonDown(8,440,350,1);
gap> PointerButtonDown(8,471,176,1);
gap> PointerButtonDown(8,475,352,1);
gap> PointerButtonDown(8,464,407,1);
gap> PointerButtonDown(8,442,350,1);
gap> PointerButtonDown(8,438,476,1);
gap> PointerButtonDown(8,269,402,1);
gap> PointerButtonDown(8,384,404,1);
gap> PointerButtonDown(8,531,347,1);
gap> PointerButtonDown(8,646,177,1);
gap> PointerButtonDown(8,693,162,1);
gap> PointerButtonDown(8,522,336,1);
gap> PointerButtonDown(8,394,190,1);
gap> PointerButtonDown(8,720,164,1);
gap> PointerButtonDown(8,491,347,1);
gap> PointerButtonDown(8,422,475,1);
gap> PointerButtonDown(8,585,402,1);
gap> PointerButtonDown(8,134,140,1);
gap> PointerButtonDown(8,53,339,1);
gap> PointerButtonDown(8,97,427,1);
gap> PointerButtonDown(8,104,291,1);
gap> PointerButtonDown(8,541,181,1);
gap> PointerButtonDown(8,69,341,1);
gap> PointerButtonDown(8,358,401,1);
gap> PointerButtonDown(8,319,400,1);
gap> PointerButtonDown(8,217,407,1);
gap> PointerButtonDown(8,186,407,1);
gap> PointerButtonDown(8,418,182,1);
gap> PointerButtonDown(8,325,204,1);
gap> PointerButtonDown(8,465,410,1);
gap> PointerButtonDown(8,308,438,1);
gap> PointerButtonDown(8,481,413,1);
gap> PointerButtonDown(8,152,153,1);
gap> PointerButtonDown(8,570,424,1);
gap> PointerButtonDown(8,324,315,1);
gap> PointerButtonDown(8,446,177,1);
gap> PointerButtonDown(8,214,176,1);
gap> PointerButtonDown(11,187,415,1);
gap> PointerButtonDown(11,293,466,1);
gap> PointerButtonDown(11,255,330,1);
gap> PointerButtonDown(11,285,389,1);
gap> PointerButtonDown(11,570,185,1);
gap> PointerButtonDown(11,624,310,1);
gap> PointerButtonDown(11,506,267,1);
gap> PointerButtonDown(11,448,355,1);
gap> PointerButtonDown(11,481,343,1);
gap> PointerButtonDown(11,452,360,1);
gap> PointerButtonDown(11,491,470,1);
gap> PointerButtonDown(11,75,116,1);
gap> PointerButtonDown(11,100,127,1);
gap> PointerButtonDown(11,72,357,1);
gap> PointerButtonDown(11,375,212,1);
gap> PointerButtonDown(11,388,210,1);
gap> PointerButtonDown(11,428,476,1);
gap> PointerButtonDown(11,169,481,1);
gap> PointerButtonDown(11,204,469,1);
gap> MenuSelected( 11, 0, 1 );
gap> PointerButtonDown(11,650,484,1);
gap> MenuSelected( 8, 1, 16 );
gap> PointerButtonDown(8,388,20,1);
gap> MenuSelected( 8, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1\
8,19,20,21,22,23,24,25,26,27,28,29,G)
gap> MenuSelected( 8, 0, 1 );
gap> MenuSelected( 5, 0, 1 );
gap> a4a3;
Group([ (1,2,3), (2,3,4), (5,6,7) ])
gap> GraphicSubgroupLattice(a4a3);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 12, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1\
8,19,20,21,22,23,24,25,26,27,28,29,G)
gap> PointerButtonDown(12,193,423,1);
gap> PointerButtonDown(12,396,297,1);
gap> PointerButtonDown(12,296,165,1);
gap> GraphicSubgroupLattice(a4c2);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 13, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1\
8,19,20,21,22,23,24,25,G)
gap> PointerButtonDown(13,399,341,1);
gap> PointerButtonDown(13,397,109,1);
gap> PointerButtonDown(13,393,406,1);
gap> PointerButtonDown(13,394,187,1);
gap> PointerButtonDown(13,647,163,1);
gap> PointerButtonDown(13,488,260,1);
gap> PointerButtonDown(13,246,336,1);
gap> PointerButtonDown(13,400,482,1);
gap> PointerButtonDown(13,603,337,1);
gap> PointerButtonDown(13,614,483,1);
gap> PointerButtonDown(13,449,312,1);
gap> PointerButtonDown(13,442,479,1);
gap> PointerButtonDown(13,434,189,1);
gap> PointerButtonDown(13,108,363,1);
gap> GraphicSubgroupLattice(DirectProduct(a3,c2));
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 14, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,G)
gap> PointerButtonDown(14,402,224,1);
gap> PointerButtonDown(14,399,376,1);
gap> PointerButtonDown(13,447,184,1);
gap> ConjugacyClassesSubgroups(a4);
[ Group( () )^G, Group( [ (1,2)(3,4) ] )^G, Group( [ (2,4,3) ] )^G, 
  Group( [ (1,3)(2,4), (1,2)(3,4) ] )^G, 
  Group( [ (1,3)(2,4), (1,2)(3,4), (2,4,3) ] )^G ]
gap> Representatives(ConjugacyClassesSubgroups(a4));
Variable: 'Representatives' must have a value

gap> Representative(ConjugacyClassesSubgroups(a4));
Group( () )^G
gap> cclsa4 := ConjugacyClassesSubgroups(a4);
[ Group( () )^G, Group( [ (1,2)(3,4) ] )^G, Group( [ (2,4,3) ] )^G, 
  Group( [ (1,3)(2,4), (1,2)(3,4) ] )^G, 
  Group( [ (1,3)(2,4), (1,2)(3,4), (2,4,3) ] )^G ]
gap> Representative(cclsa4[2]);
Group([ (1,2)(3,4) ])
gap> v4 := Representative(cclsa4[2]);
Group([ (1,2)(3,4) ])
gap> v4c2 := DirectProduct(v4,c2);
<group of size 4 with 2 generators>
gap> GraphicSubgroupLattice(v4c3);
Variable: 'v4c3' must have a value

gap> GraphicSubgroupLattice(v4c2);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 15, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,G)
gap> PointerButtonDown(13,392,215,1);
gap> PointerButtonDown(13,392,215,2);
gap> ButtonSelected(0,2);
true
gap> c2;
<pc group of size 2 with 1 generators>
gap> Size(v4);
2
gap> cclsa4 := ConjugacyClassesSubgroups(a4);
[ Group( () )^G, Group( [ (1,2)(3,4) ] )^G, Group( [ (2,4,3) ] )^G, 
  Group( [ (1,3)(2,4), (1,2)(3,4) ] )^G, 
  Group( [ (1,3)(2,4), (1,2)(3,4), (2,4,3) ] )^G ]
gap> v4 := Representative(cclsa4[4]);
Group([ (1,3)(2,4), (1,2)(3,4) ])
gap> Size(v4);
4
gap> v4c2 := DirectProduct(v4,c2);
<group of size 8 with 3 generators>
gap> GraphicSubgroupLattice(v4c2);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 16, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,G)
gap> PointerButtonDown(16,708,369,1);
gap> PointerButtonDown(13,394,350,1);
gap> PointerButtonDown(13,532,314,1);
gap> PointerButtonDown(13,468,482,1);
gap> PointerButtonDown(13,474,481,1);
gap> PointerButtonDown(13,385,336,1);
gap> PointerButtonDown(13,343,413,1);
gap> PointerButtonDown(13,360,414,1);
gap> PointerButtonDown(13,42,134,1);
gap> PointerButtonDown(13,60,135,1);
gap> PointerButtonDown(16,398,80,1);
gap> MenuSelected( 16, 1, 16 );
gap> MenuSelected( 16, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,G)
gap> MenuSelected( 16, 0, 1 );
gap> quit
> ;
