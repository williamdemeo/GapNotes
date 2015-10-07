# Start with some excerpts from file: session20110331.g.
#
## Example: interval above HxK
G := Group([(1,2,3,4),(1,2)]);;  # S_4
H := Subgroup(G, [(1,2)]);       # a subgroup of index 12
K := Subgroup(G, [(1,2,3,4)]);   # a subgroup of index 6

omega:=Concatenation(RightCosets(G,H), RightCosets(G,K));;
Gact:=Action(G, omega, OnRight);
Read("gap2uacalc.g");
gset2uacalc([Gact, "intransS4HK"]);
# This produces a file called intransS4HK.ua which can be read into uacalc,
# producing an algebra called intransS4HK with two unary operations g1 and g2.


G := Group([(1,2,3,4),(1,2)]);;  # S_4
H := Group([Identity(G)]);
K := Group([Identity(G)]);
omega:=Concatenation(RightCosets(G,H), RightCosets(G,K));;
Gact:=Action(G, omega, OnRight);
Read("gap2uacalc.g");
gset2uacalc([Gact, "S4ActOnS4unionS4"]);
