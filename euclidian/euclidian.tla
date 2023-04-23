---- MODULE euclidian ----
EXTENDS Integers

p | q == \E d \in 1..q : q = p * d
Divisors(q) == {d \in 1..q : d | q}
Maximum(S) == CHOOSE x \in S : \A y \in S : x \geq y
GCD(p, q) == Maximum(Divisors(p) \cap Divisors(q))
Number == Nat \ {0}

CONSTANTS N, M
VARIABLES x, y

Init == (x = N) /\ (y = M)

Next ==
    \/
        /\ x = 0
        /\ x' = 0
        /\ y' = y
    \/
        /\ y = 0
        /\ y' = 0
        /\ x' = x
    \/ 
        /\ x < y
        /\ x > 0
        /\ y' = y % x
        /\ x' = x
    \/
        /\ y < x
        /\ y' = x
        /\ x' = y


ResultCorrect == (x = y) => x = GCD(N, M)

Spec == Init /\ [][Next]_<<x, y>> /\ <>(ResultCorrect)
====