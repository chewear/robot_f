*** Settings ***
Resource    ../Resources/App.resource
Resource    ../Resources/Task1.resource
Resource    ../Resources/Task2.resource
Resource    ../Resources/Task3.resource
Resource    ../Resources/Task4.resource
Library     ../Library/CustomLibrary.py

Suite Setup    Launch Browser

*** Test Cases ***

TC-00001 Add First 5 Customers
    [Documentation]    Add first 5 customers to the system
    Login Customer
    Sleep    3s
    Go To Customers Page
    Add Customers

TC-00002 Verify Table Display
    [Documentation]    Verify table display
    Go To Customers Page
    Verify User In Table

TC-00003 Modify User In Table
    [Documentation]    Modify user in table
    Modify User In Table
    
TC-00004 Log Table Data
    [Documentation]    Log table data
    Log Table Data
