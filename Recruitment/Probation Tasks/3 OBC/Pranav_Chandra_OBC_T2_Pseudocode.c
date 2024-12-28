IF(current_state = 0) THEN //moving to idle
    IF(input_signal = 1) THEN
        current_state = 1
        initialize subsystems
    END IF
ELSE IF(current_state = 1) THEN //moving from idle 
    IF(input_signal = 2) THEN //testing
        current_state = 2

        test camera and check mock data
        test sensors and check mock data
        
        send signal bit = 1 //SIGNAL TRANSMISSION TEST
        IF(recieved signal bit = 1) THEN //SIGNAL RECIEVING TEST
            send READY_MESSAGE to ground control
            current_state = 1
        END IF
    ELSE IF(input_signal = 3) THEN //launch
        current_state = 3
        beacon ON
        WHILE(TRUE) THEN
            altitude_before = altitude_now
            altitude_now = update_values(altitude)
            IF(altitude_before > altitude_now)
                input_signal = 4
                BREAK
            END IF
        END WHILE
    END IF
ELSE IF(current_state = 3) THEN //moving from launch
    IF(input_signal = 4) THEN //operational
        current_state = 4
        camera on
        save camera_data to SD card

        all sensors on
        transmit sensors_readings
        save sensors_reeadings to SD card
    END IF
ELSE IF(current_state = 4) THEN //moving from operational 
    WHILE((altitude_now=update_values(altitude))) THEN //constanlty querying values to get the alt
        IF(altitude_now < 200) THEN
            input_signal = 6
            BREAK
        END IF
    END WHILE

    IF(input_signal = 6) THEN //moving to recovery-I
        DEPLOY parachute
        current_state = 5
    END IF
ELSE IF(current_state = 5) THEN //moving from recovery-I
    WHILE((altitude_now=update_values(altitude))) THEN //constanlty querying values to get the alt
        IF(altitude_now = 0) THEN
            input_signal = 7
            BREAK
        END IF
    END WHILE

    IF(input_signal = 7) THEN //moving to recovery-II
        current_state = 6 
        instrumentation OFF
        cameras OFF
        location beacon ON
    END IF
ELSE IF(current_state = 6) THEN //shutting down upon being recovered
    IF(input_signal = 8) THEN
        current_state = 0
    END IF 
    
    


            
    

