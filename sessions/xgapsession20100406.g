# Define some basic groups:
s4 := SymmetricGroup(4);;
A4 := AlternatingGroup(4);;
d8 := DihedralGroup(8);;

# Note: a single semicolon is required after a gap command;
#       a double semicolon suppresses output.

# Other groups that may not be built-in can be defined 
# in various ways; e.g., the Klein 4 group is:
v4 := Group([(1,2)(3,4), (1,3)(2,4)]);;

# You can check that this is a group of order 4 with
Order(v4); #  or
Size(v4);

# You can name the groups (as yet, I don't see why):
SetName(s4,"s4");
SetName(a4,"a4");
SetName(v4,"v4");
SetName(d8,"d8");

# Create the graphics object for drawing 
# the Hasse diagram of Sub[s4] with
s := GraphicSubgroupLattice(s4);

# Note: the last command doesn't draw the full lattice; 
# before doing so, you might compute the size of Sub[s4] with
latsize := Sum( List( ConjugacyClassesSubgroups(s4), Size ) );

# Then if latsize isn't too big, you can use the Subgroups 
# pulldown menu and select "All Subgroups" to see the full 
# Hasse diagram.  Thus, apparently, you can invoke
# GraphicSubgroupLattice(G);
# on some group G that might have a huge subgroup lattice,
# and use the menus to show only sublattices.


