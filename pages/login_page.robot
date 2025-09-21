*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/home_page_variables.robot
Documentation    This Page contains the Login Page Elements Action

*** Keywords ***
Validate Username and Password Fields Visibility
    [Documentation]    This Keyword verifies the Username and Password Fields Visibility
    ${USERNAME_FIELD_STATUS}    Run keyword and return status    Wait until element is visible    ${USERNAME_FIELD}
    ${PASSWORD_FIELD_STATUS}    Run keyword and return status    Wait until element is visible    ${PASSWORD_FIELD}
    IF    $USERNAME_FIELD_STATUS and $PASSWORD_FIELD_STATUS
        Log    Username and Password Fields are Visible
    ELSE IF    not $USERNAME_FIELD_STATUS
        Log    Username Field not Visible
    ELSE IF    not $PASSWORD_FIELD_STATUS
        Log    Password Field not Visible
    END

Enter Credentials
    [Documentation]    This Keyword Clears the Field and Enter the Value
    [Arguments]    ${username}    ${password}
    TRY
        IF    $username and $password
            Clear element text    ${USERNAME_FIELD}
            Input text    ${USERNAME_FIELD}    ${username}
            Clear element text    ${PASSWORD_FIELD}
            Input text    ${PASSWORD_FIELD}    ${password}
        ELSE IF    not $username
            Log    Username Value is None
        ELSE IF    not $password
            Log    Password Value is None
        END
    EXCEPT    TimeOutError
        Log    Username or Password Not Found in 5s
    END

Error Message Validation
    [Documentation]    This Keyword Verifies the Error Message and Print on the Log
    ${ERROR_MESSAGE_LOCATOR_STATUS}    Run keyword and return status    Wait until element is visible    ${ERROR_MESSAGE_LOCATOR}
    IF    ${ERROR_MESSAGE_LOCATOR_STATUS}
        ${ERROR_MESSAGE}    Get text    ${ERROR_MESSAGE_LOCATOR}
        Log    Invalid Credentials
        Log    Text: ${ERROR_MESSAGE}
    ELSE
        Log    No Error Message Found
    END

Click On Login Button
    [Documentation]    This Keyword Click on Login Button
    ${LOGIN_BUTTON_STATUS}    Run keyword and return status    Wait until element is visible    ${LOGIN_BUTTON}
    IF    ${LOGIN_BUTTON_STATUS}
        Wait until element is enabled    ${LOGIN_BUTTON}
        Log     Login Button is clickable
        Click button    ${LOGIN_BUTTON}
    ELSE
        Log    Login Button is Invisible
    END
