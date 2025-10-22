(define (problem lunar-mission-1)
    (:domain lunar)

    (:objects
        wp1 - waypoint
        wp2 - waypoint
        wp3 - waypoint
        wp4 - waypoint
        wp5 - waypoint
        r - robot
        l - lander
    )

    (:init
        ;define the map 
        (connectedpos wp1 wp2)
        (connectedpos wp1 wp4)
        (connectedpos wp2 wp3)
        (connectedpos wp3 wp5)
        (connectedpos wp4 wp3)
        (connectedpos wp5 wp1)
        ;define the storage at the start for the robot 
        (physicalStorage r)
        (storageEpmty r)
        ;lander and robot relation 
        (landerAssociatedRobot  r l)

        ; we start with the robot and lander undeployed 
        (undeployedLanader l)
       


    )

    (:goal
        (and
            ;mission objectives as specified in the coursework
            

            (collectSample wp1) 
            (scaned  wp3)
            (pictureCaptured wp5)

            

            ;The storgae of the robot is empty 
            (storageEpmty r)
            (physicalStorage r)
           ;we must also make sure the robot returns back to the the landing site 
            (atLandingsite r)
        )
    )
)