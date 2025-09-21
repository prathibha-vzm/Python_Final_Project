*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/appln_launching_variables.robot
Documentation    This is a Base Page that Naviagte to Swag labs

*** Keywords ***
Launch Browser
    [Documentation]    This keyword Open Browser and Navigate to Swag Labs Application
    Open browser    ${URL}    ${BROWSER}

Close the Browser
    [Documentation]    This Keyword Close the Browser after the test
    Close browser

Validate Url
    [Documentation]    This Keyword Verifies the Landed Url is same as Expected Page
    TRY
        ${ACTUAL_URL}=    Get location
        Should be equal    ${ACTUAL_URL}    ${URL}
        Log    Landed on Sauce Demo Page
        Log    Actual: ${ACTUAL_URL}, Expected: ${URL}
        Capture page screenshot    screenshots/Login_Page.png
    EXCEPT
        Log    Landed on Wrong Page
        Log    Actual: ${ACTUAL_URL}, Expected: ${URL}
    END
