---- MODULE find_cat ----
EXTENDS Integers

CONSTANTS Doors
VARIABLES CatDistr, LastDoor

Init ==
        /\ CatDistr = 0..Doors
        /\ LastDoor = -1

OpenDoor(n) == 
        /\ CatDistr' =
              0..Doors \intersect UNION { {x-1, x+1} : x \in CatDistr \ {n} }
        /\ LastDoor' = n

Next == \E door \in 0..Doors : OpenDoor(door)

CatWalk == CatDistr # {}

Spec == Init /\ [][Next]_<<CatDistr, LastDoor>>

====