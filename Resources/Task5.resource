*** Settings ***
Resource    ../Resources/App.resource
Variables    ../Variables/customerpage.py

*** Variables ***
${row}    1

*** Keywords ***
Analyze User Spending
    Log to Console    \n
    Go To Customers Page
    ${table_rows}    Get Element Count    ${table}
    Display User Spending    ${row}     ${table_rows}
    Calculate Total Spending    ${row}    ${table_rows}
    

Display User Spending
    [Arguments]    ${index}    ${table_rows}
    ${display_row_count}    Set Variable    1
    FOR    ${index}    IN RANGE    ${table_rows}
        ${name}    Get Text    ((${table})[${row}]//td)[2]
        ${total_spent}    Get Text    ((${table})[${row}]//td)[5]
        
        IF    "\\n" in """${name}"""
            ${name}    Evaluate    """${name}""".replace("\\n", " ")[1:]
        END
        
        IF    '${total_spent}' != '$0.00'
            Log To Console    ${display_row_count}. ${name}: ${total_spent}
            ${display_row_count}=    Evaluate    ${display_row_count}+1
        END

        ${row}    Evaluate    ${row}+1
    END

Calculate Total Spending
    [Arguments]    ${index}    ${table_rows}
    ${total_spent_amount}    Set Variable    0.0
    FOR    ${index}    IN RANGE    ${table_rows}
        ${total_spent}    Get Text    ((${table})[${row}]//td)[5]
        ${amount}=    Evaluate    float(${total_spent.replace('$','').replace(',','')})
        ${total_spent_amount}=    Evaluate    ${total_spent_amount}+${amount}
        ${row}    Evaluate    ${row}+1
    END
    Log To Console    \n=========================
    Log To Console    Total Customers Spending: $${total_spent_amount}
    Log To Console    =========================
    Validate Total Spending    ${total_spent_amount}

Validate Total Spending
    [Arguments]    ${total_spent_to_validate}
    ${total_spent_num}=    Convert To Number    ${total_spent_to_validate}
    IF    ${total_spent_num} < 3500
        Log To Console    \n
        Log To Console    FAIL: Total spending (${total_spent_to_validate}) is less than $3500
        Fail    Total spending is less than $3500
    ELSE
        Log To Console    \n
        Log To Console    PASS: Total spending (${total_spent_to_validate}) meets minimum threshold of $3500
    END
