*** Settings ***
Variables    ../Variables/customerpage.py
Library     ../Library/CustomLibrary.py

*** Keywords ***
Verify User In Table
    ${customers_to_be_verified}=    Get Random Users
    ${reversed_users}=    Reverse List    ${customers_to_be_verified}

    ${row}=    Set Variable    1
    FOR    ${user}    IN    @{reversed_users}
        ${user_in_table}=    Get Text    ((${table})[${row}]//td)[2]
        Should Be Equal    ${user_in_table}    ${user["name"]}
        ${row}=    Evaluate    ${row}+1
        Log To Console    Found user in table: ${user_in_table}
    END





