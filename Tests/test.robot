*** Settings ***
Resource    ../Resources/App.resource
Resource    ../Resources/Task1.resource
Library     ../Library/CustomLibrary.py

Suite Setup    Launch Browser

*** Test Cases ***

TC-00001 Add First 5 Customers
    [Documentation]    Add first 5 customers to the system
    Login Customer
    Go To Customers Page
    Add Customers

    
*** Keywords ***