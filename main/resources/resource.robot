*** Settings ***
Resource                			../config/environment.robot
*** Keywords ***
Open Apps
	[Documentation]							This keyword for default open apps for the first time.
	[Tags]									    Global
	Open App                    ${devices}				          ${app_package}

Close Apps
	Close App

Set Test ID
	[Arguments]                 ${test_id}
	Set Test Variable  		    	${TEST_ID}  				${test_id}
