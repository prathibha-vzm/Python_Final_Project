*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/home_page_variables.robot
Documentation    This Keyword Clear the Fields and Enter the Invalid Credentials

*** Keywords ***
Enter Invalid Credentials
    [Documentation]    This Keyword Clear the Fields and Enter the Invalid Credentials
    [Arguments]    ${username}    ${password}
    TRY
        Clear element text    ${USERNAME_FIELD}
        Input text    ${USERNAME_FIELD}    ${username}
        Clear element text    ${PASSWORD_FIELD}
        Input text    ${PASSWORD_FIELD}    ${password}
    EXCEPT    TimeOutError
        Log    Username or Password Not Found in 5s
    END