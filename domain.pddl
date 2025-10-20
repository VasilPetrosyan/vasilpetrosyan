(define (domain lunar)
    (:requirements :strips :typing)
    
    ; -------------------------------
    ; Types
    ; -------------------------------

    ; EXAMPLE

    ; (:types
    ;     parent_type
    ;     child_type - parent_type

    ; )
    (:types
        robot
        lander
        waypoint
    )

    ; -------------------------------
    ; Predicates
    ; -------------------------------

    ; EXAMPLE

    ; (:predicates
    ;     (no_arity_predicate)
    ;     (one_arity_predicate ?p - parameter_type)
    ; )

    (:predicates
        (pos ?x - waypoint ?r - robot)
        (posland ?x - waypoint ?la - lander) 

        (undeployed ?l - lander); predicte

        
        (connectedpos ?x - waypoint ?y - waypoint) 
        (dataTransmited  ?r - robot)
        (dataCapture  ?l-waypoint)
        (scan ?l-waypoint)  
        (collectSample ?x - waypoint)
        (landerRobot  ?r - robot ?l - lander)

        (deployed ?r - robot)

        (storageEpmty ?r - robot)
        (physicalStorage ?r - robot)

        (atLandingsite ?r)

        (movedawy)

        ;(robotAtpos ?x)
        ;)
    )

    
    (:action move
        :parameters (?x - waypoint  ?y - waypoint ?r - robot )
        :precondition (and
            (pos ?x ?r)
            (connectedpos ?x ?y)
            (deployed ?r)
            (atLandingsite ?r)
            ;(posland ?x ?la)
           ; (not (atLandingsite ?r))
           ; (robotAtpos ?x)
        )
        :effect (and
            (not (pos ?x ?r))
            (pos ?y ?r)
            (not (atLandingsite ?r))
            (movedawy)
           ; (not(robotAtpos ?x))
           ; (robotAtpos ?y)
        )
    )
    
    (:action movegen
        :parameters (?x - waypoint  ?y - waypoint ?r - robot)
        :precondition (and
            (pos ?x ?r)
            (connectedpos ?x ?y)
            (deployed ?r)
            (movedawy)
            ;(atLandingsite ?r)
           ; (not (atLandingsite ?r))
           ; (robotAtpos ?x)
        )
        :effect (and
            (not (pos ?x ?r))
            (pos ?y ?r)
            ;(not (atLandingsite ?r))
           ; (not(robotAtpos ?x))
           ; (robotAtpos ?y)
        )
    )
   
    (:action moveerop
        :parameters (?x - waypoint  ?y - waypoint ?r - robot ?la - lander)
        :precondition (and
            (pos ?x ?r)
            (connectedpos ?x ?y)
            (deployed ?r)
            (landerRobot  ?r ?la)
            (posland ?y ?la)
            
        )
        :effect (and
            (not (pos ?x ?r))
            (pos ?y ?r)
            ;(not (atLandingsite ?r))
            (atLandingsite ?r)
           
        )
    )

    (:action deploy
        :parameters (?x - waypoint  ?r - robot ?l - lander)
        :precondition (and
            ;(not(deployed ?r))
            ;(landerRobot ?l ?r)
            ;(not )
            (undeployed ?l)
            ;(landerRobot ?l ?r)
            
        )
        :effect (and
            (deployed ?r)
            (pos ?x ?r)
            (landerRobot ?l ?r)
            (posland ?x ?l)
            (not (undeployed ?l))
            (atLandingsite ?r)
            ;(not(robotAtpos ?x))
            ;(robotAtpos ?x)
            ;(robotlander ?r ?l)
        )
    )
    
     (:action capture
        :parameters (?x - waypoint  ?r - robot )
        :precondition (and
            (pos ?x ?r)
            (storageEpmty ?r)
            (deployed ?r)
            ;(robotAtpos ?x)
            ;(not(dataCapture ?x))
        )
        :effect (and
            
            (dataCapture ?x)
            (not(storageEpmty ?r))
        )
    )
    (:action scaner
        :parameters (?x - waypoint  ?r - robot )
        :precondition (and
           
            (pos ?x ?r)
            (storageEpmty ?r)
            (deployed ?r)
            ;(not (scan  ?x))
        )
        :effect (and
            
            (scan  ?x)
            (not(storageEpmty ?r))
        )
    )

    (:action transmit
        :parameters (?r - robot )
        :precondition (and
           ;( not(storageEpmty ?r) )
           (deployed ?r)
        )
        :effect (and
            
            (dataTransmited ?r)
            (storageEpmty ?r)
        )
    )

    (:action sampleCollecton
        :parameters (?x - waypoint  ?r - robot )
        :precondition (and
            
           (pos ?x ?r)
           (physicalStorage ?r)
           (deployed ?r) 
           ;(not (collectSample ?x))
        )
        :effect (and
            
            (collectSample ?x)
            (not (physicalStorage ?r))
        )
    )

      (:action dropoffsample
        :parameters (?x - waypoint  ?r - robot ?la - lander)
        :precondition (and
            ;(not (physicalStorage ?r))
            (deployed ?r)
            (pos ?x ?r)
            (posland ?x ?la)
            (landerRobot ?la ?r)
        )
        :effect (and
            (physicalStorage ?r)
            ;(landingSite ?r ?la)
            (atLandingsite ?r)
        )
    )

    

)