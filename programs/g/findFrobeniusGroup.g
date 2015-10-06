# The following finds and prints the GAP ID of 
# the Frobenius group of order 72.
#
# Author: William DeMeo <williamdemeo@gmail.com>
# Date: 2010.07.28

for i in [1..50] do
    G := SmallGroup(72, i);
    nrcc := NrConjugacyClasses(G);
    if nrcc = 6 then
        Print("\nThe Frobenius group of order 72 has GAP ID [72, ", i, "]\n");
    fi;
od;