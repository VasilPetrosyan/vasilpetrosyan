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
        ;define the 
        (physicalStorage r)
        (storageEpmty r)

        (landerRobot  r l)

        (undeployed l)
        (not (deployed r))


    )

    (:goal
        (and
            (deployed r)

            (collectSample wp1)
            (scan  wp3)
            (dataCapture wp5)

            ;(dataTransmited  r)


            (storageEpmty r)
            (physicalStorage r)

            (atLandingsite r)
        )
    )
)