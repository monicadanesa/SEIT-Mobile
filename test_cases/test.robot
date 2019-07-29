*** Settings ***
Resource            ../all_library.robot
Suite Setup					Open Apps
Suite Teardown			Close Apps

*** Test Cases ***
Check Maximum Total Records on Landing Page
    [Documentation]                                     Landing page of the app shows Delivery List with maximum 20 records when first opened.
    [Tags]                                              staging test
    Set Test ID                                         0001
    Get Total Records Page and Check Maximum Records    20

Show Data that Containt Parcel are Leviero and documents are for Andrio
    [Documentation]                                     Shows icon, description and location. Parcels are for Leviero and documents are for Andrio.
    [Tags]                                              staging test
    Set Test ID                                         0002
    Get All Title and Address from Delivery List

Shows when clicking the 14th record from Delivery List.
    [Documentation]                                     Shows when clicking the 14th record from Delivery List.
    [Tags]                                              staging test
    Set Test ID                                         0003
    Click The 14th Record of Delivery List
    Show and Check Page Should Containt Gale of Storm Text

Check Maps shows and centered to that pin Delivery
    [Documentation]                                     Map pin shows and centred to that pin for that delivery..
    [Tags]                                              staging test
    Set Test ID                                         0004
    Click Delivery List                                 2
    Check Position and Visible of the Pin Maps

Retrieve items and put into list
    [Documentation]                                     Scrolling up will retrieve more items, each time 20 records are appended at the end of the list.
    [Tags]                                              staging test
    Set Test ID                                         0005
    Scrolling Up the delivery List

Click any Items from Delivery Service
    [Documentation]                                     Click any item from Delivery List and Delivery Details page shows and check information should be shown correctly based on the item details.
    [Tags]                                              staging test
    Set Test ID                                         0006
    Scrolling Down Until Bottom Page
