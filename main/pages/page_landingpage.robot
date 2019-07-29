*** Keywords ***

Get Total Records of Display Lists
    ${total_records}=   Get Element Attribute                 className=androidx.recyclerview.widget.RecyclerView       element=childCount
    [Return]                                                  ${total_records}

Check Maximum Records when First Open
    [Arguments]                                               ${actual_total_records}       ${expected_total_records}
    Should Be True                                            ${actual_total_records}<=${expected_total_records}

Scrolling Up the delivery List
    ${total_records}=    Retrieve items to list               androidx.recyclerview.widget.RecyclerView

    [Return]                                                  ${total_records}

Get Title from Delivery Service List
    [Arguments]                                               ${locator}
    ${grand_child}=   Get Child                               parent=${locator}    index=1
    ${title}=     Get Text                                    locator=${grand_child}

    [Return]                                                  ${title}

Get Title from Detail Delivery Detail
    ${parent}=   Get Locator                                 className=android.view.ViewGroup   index=2
    ${child}=    Get Child                                   parent=${parent}   index=1
    ${title}=   Get Text                                     locator=${child}

    [Return]                                                  ${title}


Get Address from Delivery Service List
    [Arguments]                                                   ${locator}
    ${grand_child}=   Get Child                                   parent=${locator}    index=3
    ${title}=     Get Text                                        locator=${grand_child}

    [Return]                                                      ${title}

Get Address from Detail Delivery Detail
    ${parent}=   Get Locator                                      className=android.view.ViewGroup   index=2
    ${child}=    Get Child                                        parent=${parent}   index=3
    ${address}=   Get Text                                        locator=${child}

    [Return]                                                      ${address}

Go to Delivery List Page
    Press Keycode                                               Back

Check Title Delivery Service List and Delivery Service Detail
    [Arguments]                                                   ${title}     ${title_detail}
    Should Be Equal As Strings                                    ${title}    ${title_detail}

Check Address Delivery Service List and Delivery Service Detail
    [Arguments]                                                   ${address}      ${address_detail}
    Should Be Equal As Strings                                    ${address}      ${address_detail}

Click and Check Items on Delivery Service and Detail
    ${total_list}=    Get Element Attribute                       className=androidx.recyclerview.widget.RecyclerView       element=childCount
    Logic Click and Check Items on Delivery Service and Detail    ${total_list}

Scrolling Down Until Bottom Page
    Logic Scrolling Down Until Bottom Page
    Go to Delivery List Page

Get Map Icon Element
    ${parent}=    Get Locator                                     descriptionContains=Google Map
    ${child}=     Get Child                                       parent=${parent}

    [Return]                                                      ${child}

Click Delivery List
    [Arguments]                                                  ${INDEX}
    ${parent}=    Get Locator     className=androidx.recyclerview.widget.RecyclerView
    ${child}=   Get Child        parent=${parent}   index=${INDEX}
    ${grand_child}=   Get Child   parent=${child}
    Click Element     locator=${grand_child}

Get Map Icon Bounds
    ${locator}=     Get Map Icon Element
    ${bounds}=      Get Element Attribute                        locator=${locator}     element=bounds

    [Return]                                                      ${bounds}

Get Left Bounds and Check
    ${bounds}=    Get Map Icon Bounds
    ${left}=       Get From Dictionary                           ${bounds}     left

    [Return]                                                      ${left}

Get Right Bounds and Check
    ${bounds}=    Get Map Icon Bounds
    ${right}=       Get From Dictionary                           ${bounds}     right

    [Return]                                                      ${right}

Get Bottom Bounds and Check
    ${bounds}=    Get Map Icon Bounds
    ${bottom}=       Get From Dictionary                           ${bounds}     bottom

    [Return]                                                      ${bottom}

Get Top Bounds and Check
    ${bounds}=    Get Map Icon Bounds
    ${top}=       Get From Dictionary                           ${bounds}     top

    [Return]                                                      ${top}

Click The 14th Record of Delivery List
    Click Delivery List                                         13

Show and Check Page Should Containt Gale of Storm Text
    Check Element Visible                                     Gale or storm force wind is expected or blowing generally in Hong Kong near sea level, with a sustained wind speed of 63–117 km/h from the quarter indicated and gusts which may exceed 180 km/h, and the wind condition is expected to persist.
    Go to Delivery List Page

Check Maps Position
    ${width_actual_size}=   Get Actual Width Device
    ${get_left_position}=    Get Left Bounds and Check
    ${get_right_position}=    Get Right Bounds and Check
    ${result} =	Evaluate	${width_actual_size}-${get_left_position}

    Should Be Equal As Integers    ${result}    ${get_right_position}

Get All Title and Address from Delivery List
     Show Data Match With
