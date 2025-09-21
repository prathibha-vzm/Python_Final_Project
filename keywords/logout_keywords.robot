*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/products_page.robot
Documentation    This Keywords contains the Functionality to Logout

*** Keywords ***
Logout
     [Documentation]    This Keyword runs the steps to Logout
     Click on Open Menu
     Click On LogOut

Validate Logout
    [Documentation]   This Keyword verifies the Logout Functionality by Asserting URL
    ${EXPECTED_URL}=   Set variable    ${URL}
    ${ACTUAL_URL}=    Get location
    TRY
       Should match    ${ACTUAL_URL}    ${EXPECTED_URL}
       Set test message    Logout successful: Landed on ${ACTUAL_URL}\nExpected${EXPECTED_URL} MATCHES Actual${ACTUAL_URL}
    EXCEPT
       Log    Landed on Wrong Page
       Set test message    ${EXPECTED_URL} NOT MATCHES ${ACTUAL_URL}
    END

Click On LogOut
    [Documentation]    This Keyword Clicks on Logout
    TRY
        ${LOGOUT_ELEMENT_STATUS}    Run keyword and return status    Wait until element is visible    ${LOGOUT_ELEMENT}
        IF    ${LOGOUT_ELEMENT_STATUS}
            Log    Found the Logout Element
            Click element    ${LOGOUT_ELEMENT}
            Log    Clicked on Logout Element

        ELSE
            Log    Logout Element is not Clickable
        END
    EXCEPT    TimeOutError
        Log    Logout Element Not Found in 5s
    END