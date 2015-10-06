# version of 4/4/11
BlocksImprimitive:=function(G)
local orb,b,c,i,j,k,f,fix,co,nb;
  orb:=List(Orbits(G,MovedPoints(G)),Set);
  b:=AllBlocks(Action(G,orb[1]));
  b:=Concatenation([[1]],b); # also trivial blocks
  b:=List(b,x->orb[1]{x});
  b:=List(b,x->[x,Stabilizer(G,x,OnSets),Length(orb[1])/Length(x)]);
  for i in [2..Length(orb)] do
    c:=AllBlocks(Action(G,orb[i]));
    c:=Concatenation([[1]],c); # also trivial blocks
    c:=List(c,x->orb[i]{x});
    co:=[];
    nb:=[];
    for j in [1..Length(b)] do
      for k in [1..Length(c)] do
        if Length(orb[i])/Length(c[k])=b[j][3] then
	  if not IsBound(co[k]) then
	    co[k]:=Orbit(G,c[k],OnSets);
	  fi;
	  # these are the possible combinees -- they are fixed and have the
	  # same orbit length, so they have the same stabilizer
	  fix:=Filtered(co[k],x->ForAll(SmallGeneratingSet(b[j][2]),
	                         y->OnSets(x,y)=x));
	  for f in fix do
	    Add(nb,[Union(b[j][1],f),b[j][2],b[j][3]]);
	  od;
	fi;
      od;
    od;
    b:=nb;
  od;
  return List(b,x->x[1]);
end;

