#############################################################################
##
#F  DotFileLatticeSubgroups(<L>,<filename>)

DotFileLatticeSubgroups:=function(L,file)
local cls, len, sz, max, rep, z, t, i, j, k;
   cls:=ConjugacyClassesSubgroups(L);
   len:=[];
   sz:=[];
   for i in cls do
     Add(len,Size(i));
     AddSet(sz,Size(Representative(i)));
   od;

   PrintTo(file,"digraph lattice {\nsize = \"6,6\";\n");
   # sizes and arrangement
   for i in sz do
     AppendTo(file,"\"s",i,"\" [label=\"",i,"\", color=white];\n");
   od;
   sz:=Reversed(sz);
   for i in [2..Length(sz)] do
     AppendTo(file,"\"s",sz[i-1],"\"->\"s",sz[i],
       "\" [color=white,arrowhead=none];\n");
   od;

   # subgroup nodes, also acccording to size
   for i in [1..Length(cls)] do
     for j in [1..len[i]] do
       if len[i]=1 then
	AppendTo(file,"\"",i,"x",j,"\" [label=\"",i,"\", shape=box];\n");
       else
	AppendTo(file,"\"",i,"x",j,"\" [label=\"",i,"-",j,"\", shape=circle]; \n");
       fi;
     od;
     AppendTo(file,"{ rank=same;  \"s",Size(Representative(cls[i])),"\"");
     for j in [1..len[i]] do
       AppendTo(file," \"",i,"x",j,"\"");
     od;
     AppendTo(file,";}\n");
   od;

   max:=MaximalSubgroupsLattice(L);
   for i in [1..Length(cls)] do
     for j in max[i] do
       rep:=ClassElementLattice(cls[i],1);
       for k in [1..len[i]] do
	if k=1 then
	  z:=j[2];
	else
	  t:=cls[i]!.normalizerTransversal[k];
	  z:=ClassElementLattice(cls[j[1]],1); # force computation of transv.
	  z:=cls[j[1]]!.normalizerTransversal[j[2]]*t;
	  z:=PositionCanonical(cls[j[1]]!.normalizerTransversal,z);
	fi;
	AppendTo(file,"\"",i,"x",k,"\" -> \"",j[1],"x",z,
	         "\" [arrowhead=none];\n");
       od;
     od;
   od;
   AppendTo(file,"}\n");
end;


