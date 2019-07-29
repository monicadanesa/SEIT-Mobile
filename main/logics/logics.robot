*** Keywords ***
Logic Click and Check Items on Delivery Service and Detail
  [Arguments]                                                               ${total_list}
  :FOR    ${INDEX}    IN RANGE    1  ${total_list}
  \       ${parent}=    Get Locator     className=androidx.recyclerview.widget.RecyclerView
  \       ${child}=   Get Child        parent=${parent}   index=${INDEX}
  \       ${grand_child}=   Get Child   parent=${child}

  \       ${title_child}=    Get Child   parent=${child}    index=1
  \       ${title}=    Get Element Attribute      locator=${title_child}      element=text
  \       ${address_child}=    Get Child   parent=${child}    index=3
  \       ${address}=    Get Element Attribute      locator=${address_child}      element=text
  \       Click Element     locator=${grand_child}
  \       ${title_detail}=   Get Title from Detail Delivery Detail
  \       ${address_detail}=    Get Address from Detail Delivery Detail
  \       Check Title Delivery Service List and Delivery Service Detail    ${title}    ${title_detail}
  \       Check Address Delivery Service List and Delivery Service Detail    ${address}    ${address_detail}
  \       Click Element   className=android.widget.ImageButton

Logic Scrolling Down Until Bottom Page
  : FOR    ${INDEX}    IN RANGE    1  5
  \         Click and Check Items on Delivery Service and Detail
  \         Scroll     max_swipes=${INDEX}
