---- MODULE die_hard ----
EXTENDS Naturals

VARIABLES big, small

Ok ==
    /\ small \in 0..3
    /\ big \in 0..5

Init ==
    /\ big = 0
    /\ small = 0

FillSmall ==
    /\ small' = 3
    /\ big' = big

FillBig ==
    /\ big' = 5
    /\ small' = small

EmptySmall ==
    /\ small' = 0
    /\ big' = big

EmptyBig ==
    /\ big' = 0
    /\ small' = small


Min(a, b) == IF a < b THEN a ELSE b

SmallToBig ==
    /\ big' = Min(big + small, 5)
    /\ small' = small - (big' - big)

BigToSmall ==
    /\ small' = Min(big + small, 3)
    /\ big' = big - (small' - small)

Next ==
    \/ FillSmall
    \/ FillBig
    \/ EmptySmall
    \/ EmptyBig
    \/ BigToSmall
    \/ SmallToBig

Spec == Init /\ [][Next]_<<big, small>>

NotSolved == big # 4

====