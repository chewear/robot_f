*** Settings ***
Resource    ../Resources/App.resource
Resource    ../Resources/Task1.resource
Resource    ../Resources/Task2.resource
Library     ../Library/CustomLibrary.py

Suite Setup    Launch Browser

*** Test Cases ***

TC-00001 Add First 5 Customers
    [Documentation]    Add first 5 customers to the system
    Login Customer
    Go To Customers Page
    Add Customers

TC-00002 Verify Table Display
    [Documentation]    Verify table display
    Go To Customers Page
    Verify User In Table
    
*** Keywords ***