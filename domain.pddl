(define (domain project)
(:requirements :typing :adl)

(:types xpos ypos num - object)

(:predicates (increment ?n1 ?n2 - num)
            (adjacent ?x - xpos ?y - ypos ?x2 - xpos ?y2 - ypos)
            (right ?x1 ?x2 - xpos)
            (below ?y1 ?y2 - ypos)
            (lit ?x - xpos ?y - ypos)
            (black ?x - xpos ?y - ypos)
            (surrounded ?x - xpos ?y - ypos ?n - num)
)

(:action place_blub
    :parameters (?x1 - xpos ?y1 - ypos)
    :precondition (and(not(black ?x1 ?y1)) (not(lit ?x1 ?y1)))
    :effect (
        and
            ;lit horizontal -->

            (forall (?x2 - xpos) (when
                (and (right ?x1 ?x2) 
                (not(exists (?x3 - xpos) (and (right ?x3 ?x2) (right ?x1 ?x3) (black ?x3 ?y1)) )) 
                (not(lit ?x2 ?y1)) (not(black ?x2 ?y1)) 
                )
                
                (lit ?x2 ?y1))

            )
            ; lit <--
            (forall (?x2 - xpos) (when
                (and (right ?x2 ?x1) (not(exists (?x3 - xpos) (and (right ?x2 ?x3) (right ?x3 ?x1) (black ?x3 ?y1))))
                (not(lit ?x2 ?y1)) (not(black ?x2 ?y1))
                )
                (lit ?x2 ?y1))

            )

            ;lit vertical down
            (forall (?y2 - ypos) (when
                (and (below ?y1 ?y2) (not(exists (?y3 - ypos) (and (below ?y3 ?y2) (below ?y1 ?y3) (black ?x1 ?y3))))
                (not(lit ?x1 ?y2)) (not(black ?x1 ?y2))
                )
                (lit ?x1 ?y2))

            )
            ;lit vertical up
            (forall (?y2 - ypos) (when
                (and (below ?y2 ?y1) (not(exists (?y3 - ypos) (and (below ?y2 ?y3) (below ?y3 ?y1) (black ?x1 ?y3))))
                (not(lit ?x1 ?y2)) (not(black ?x1 ?y2))
                )
                (lit ?x1 ?y2))

            )


            ;update surrounded
            (forall (?x2 - xpos ?y2 - ypos ?n1 ?n2 - num) (when
                    (and
                        ;(black ?x2 ?y2)
                        (or (adjacent ?x1 ?y1 ?x2 ?y2) (adjacent ?x2 ?y2 ?x1 ?y1) )
                        (surrounded ?x2 ?y2 ?n1)
                        (increment ?n1 ?n2)
                    )
                    (and
                        (surrounded ?x2 ?y2 ?n2)
                        (not (surrounded ?x2 ?y2 ?n1))
                    )
                )
            )
            
            (lit ?x1 ?y1)

    )
))
