*** Keywords ***
Get Total Records Page and Check Maximum Records
    [Arguments]                         ${expected_total_records}
    ${total_records_landingpage}=       Get Total Records of Display Lists
    ${total_records_landingpage}=       Convert To Integer    ${total_records_landingpage}
    Check Maximum Records when First Open   ${total_records_landingpage}     ${expected_total_records}

Check Map Icon is Visible
    ${locator}=   Get Map Icon Element
    ${result}=    Check Element Visible                             locator=${locator}
    Get Map Icon Bounds
    Should Be True    ${result}

Check Position and Visible of the Pin Maps
    Check Map Icon is Visible
    Check Maps Position
    Go to Delivery List Page
