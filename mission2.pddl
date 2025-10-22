(define (problem lunar-mission-2)
    (:domain lunar)

    (:objects
        wp0 - waypoint
        wp1 - waypoint
        wp2 - waypoint
        wp3 - waypoint
        wp4 - waypoint
        wp5 - waypoint
        wp6 - waypoint

        r1 - robot
        r2 - robot

        l1 - lander
        l2 - lander
    )

    (:init
    ;defining the map
       
        (connectedpos wp1 wp2)
        (connectedpos wp2 wp1)
        (connectedpos wp2 wp4)
        (connectedpos wp4 wp2)
        (connectedpos wp2 wp3)
        (connectedpos wp3 wp5)
        (connectedpos wp5 wp3)
        (connectedpos wp5 wp6)
        (connectedpos wp6 wp4)
        
     ;physical and hard drive storgae is empty at the start
        (physicalStorage r1)
        (physicalStorage r2)

        (storageEpmty r1)
        (storageEpmty r2)
        
        ;the association between lander and rover 
        (landerAssociatedRobot  r1 l1)
        (landerAssociatedRobot  r2 l2)

    
        ;the robot 2 and its lander 2 are undeployed at the start     
        (undeployedLanader l2)
        
        
      
        ;the robot 1 and its lander are deployed at WP2
        (deployedrob r1)
        (atLandingsite r1)

        (posrobot wp2 r1)
        (posland wp2 l1)
        
    )

    (:goal
        (and
            
            ; we must deploy r2
            (deployedrob r2)
            
           
            ;mission aims 
            (pictureCaptured  wp3)
            (scaned wp4)
           
            (pictureCaptured wp2)

            (scaned wp6)
         
            (collectSample wp5)
           
           
            (collectSample wp1)
            (physicalStorage r1)
            (physicalStorage r2)

            ; at the end of the mission the robots must have empty storge and be at the landning site 

            (atLandingsite r1)
            (atLandingsite r2)

            (storageEpmty r1)
            (storageEpmty r2)

           
            
            
            
        )
    )
)