
f:=FreeGroup(3);
G:= f/[f.1^3, f.2^3, f.3^3, (f.1*f.3)/(f.3*f.1), (f.2*f.3)/(f.3*f.2), (f.1*f.2*f.1^-1*f.2^-1)/f.3];
GraphicSubgroupLattice(G);
Order(G);  # returns 27
StructureDescription(G);   # returns "(C3 x C3) : C3"


m1:=[[Z(3)^0, Z(3)^0, 0*Z(3)],[0*Z(3), Z(3)^0, 0*Z(3)],[0*Z(3), 0*Z(3), Z(3)^0]];
m2:=[[Z(3)^0, Z(3)^0, 0*Z(3)],[0*Z(3), Z(3)^0, 0*Z(3)],[0*Z(3), 0*Z(3), Z(3)^0]];

g:=Group(m1,m2);
