# Groups of order 288;

# The prime factorization of 288 is given in GAP as:

FactorsInt(288);  # which shows 288 = 2^5*3^2;

L := AllGroups(Size, 288);;
Size(L);                        # returns 1045
Lna := AllGroups(Size, 288);;
Size(Lna);                      # returns 1031

# If S is a Sylow p-subgroup, then the
# number of Sylow p-subgroups of G is 
# |G : N_G(S)| or
# Size(G)/Size(Normalizer(G,S))
# Since SylowSubgroup(G,p) returns a Sylow p-subgroup of G, 
# a function which counts the number of Sylow p-subgroups is

NSP := function(G, p)
    return Size(G)/Size(Normalizer(G,SylowSubgroup(G,p)));
end;

# This function can be used to eliminate from L those groups
# with only one Sylow 3-subgroup.  The remaining groups are:

L3 := Filtered(L, G -> NSP(G,3) > 1);;

Size(L3);  # reports that there are 131 groups in L that 
           # do not have a normal Sylow 3-subgroup.

# From these, let's elminate those with a normal Sylow 2-subgroup:

L32 := Filtered(L3, G -> NSP(G,2) > 1);;
Size(L32);
  
# Recall the basic result:
# If G is a simple group and S a Sylow p-subgroup and 
# if |G| does not divide k!, then |G : N_G(S)| > k.

# In gap, we compute: 
# Factorial(3)/288 = 1/48
# Factorial(4)/288 = 1/12
# Factorial(5)/288 = 5/12
# Factorial(6)/288 = 5/2
# Factorial(7)/288 = 35/2
# Factorial(8)/288 = 140

# So, by the result above, for each prime p
# dividing |G|=288 (namely p=2 and p=3), there are 
# at least 7 Sylow p-subgroups, if G is simple.

L323 := Filtered(L32, G -> NSP(G,3) > 7);;
Size(L323);    # reports 14 groups in L323

L3232 := Filtered(L323, G -> NSP(G,2) > 7);;
Size(L3232);   # reports 5 groups in L323

# We now show how to find a normal subgroup in 
# 4 out of the 5 remaining groups.

# Take the first group, a Sylow 3-subgroup, and its conjugacy class:
G := L3232[1];
S := SylowSubgroup(G,3);
CLASS := ConjugacyClassSubgroups(G,S);

# By Sylow theorems, CLASS contains all Sylow 3-subgroups of G.
# We compute the maximal intersection(s) S \cap T where
# S and T are Sylow 3-subgroups in CLASS, and check that such 
# an intersection is a normal subgroup of G:

List(CLASS, T -> Size(Intersection(T, S)));
D := Intersection(CLASS[2],S);
Size(Normalizer(G,D));    # returns 288 which proves 
                          # that D is a normal subgroup of G

# We follow the same procedure (with similar results) for 
G := L3232[2]; G := L3232[3]; G := L3232[5];

# Actually, we will end up showing that L3232[4] is also not simple.
# This pisses me off because I thought the whole point was to find 
# a simple group of order 288, and that's what I wanted to see.  
# Apparently there are none!




