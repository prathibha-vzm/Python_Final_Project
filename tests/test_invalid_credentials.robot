*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    ../data/test_invalid_credentials_data.csv
Resource    ../pages/base_page.robot
Resource    ../pages/login_page.robot
Resource    ../keywords/invalid_credentials.robot
Test Template    Login with Invalid Credentials
Suite Setup    Launch Browser
Suite Teardown    Close the Browser
Documentation    This Test Verifies Attempt to log in using non-standard credentials and validate the response.

*** Test Cases ***
Login with Invalid Credentials${INVALID_USERNAME} and ${INVALID_PASSWORD}
    [Documentation]    Invalid Credentials with CSV- DataDriven

*** Keywords ***
Login with Invalid Credentials
        [Arguments]   ${INVALID_USERNAME}    ${INVALID_PASSWORD}
        Log    Credentials are ${INVALID_USERNAME} and ${INVALID_PASSWORD}
        Validate Url
        Validate Username and Password Fields Visibility
        Enter Invalid Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
        Click On Login Button
        Error Message Validation
