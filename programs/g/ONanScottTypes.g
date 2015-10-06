# See page 419 of the manual.
g:=AlternatingGroup(5);;
h:=DirectProduct(g,g);;
p:=List([1,2],i->Projection(h,i));;
# Define a custom action:
ac:=Action(h,AsList(g), function(g,h) return Image(p[1],h)^-1*g*Image(p[2],h);end);;
Size(ac);NrMovedPoints(ac);IsPrimitive(ac,[1..60]);
ONanScottType(ac);
SocleTypePrimitiveGroup(ac);
