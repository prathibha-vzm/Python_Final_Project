*** Settings ***
Library    DataDriver    file=../data/test_data.csv
Resource    ../pages/base_page.robot
Resource    ../pages/login_page.robot
Resource    ../pages/products_page.robot
Resource    ../keywords/logout_keywords.robot

Test Template    Login Functionality
Suite Setup    Launch Browser
Suite Teardown    Close the Browser
Documentation    This Test Login with different predefined usernames (e.g., standard user, performance glitch user, locked-out user, etc.) and verify login behavior
...              Used CSV- DATA DRIVER to process the Data

*** Test Cases ***
Login Functionality ${username} and ${password}

*** Keywords ***
Login Functionality
    [Arguments]    ${username}    ${password}
    Validate Url
    Validate Username and Password Fields Visibility
    Enter Credentials    ${username}    ${password}
    Click On Login Button
    Error Message Validation
    Read the Page Title
    Click on Open Menu
    Click On LogOut
