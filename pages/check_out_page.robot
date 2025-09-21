*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/check_out_variables.robot
Documentation    This page contains the check out page's elements action

*** Keywords ***
Validate Contact Information Fields Visibility
    [Documentation]    This Keyword Verifies the Fields in Contact information are Visible
    TRY
        ${FIRST_NAME_FIELD_STATUS}    Run keyword and return status    Wait until element is visible    ${FIRST_NAME_FIELD}
        ${LAST_NAME_FIELD_STATUS}    Run keyword and return status    Wait until element is visible    ${LAST_NAME_FIELD}
        ${POSTAL_CODE_FIELD_STATUS}    Run keyword and return status    Wait until element is visible    ${POSTAL_CODE_FIELD}
        IF    ${FIRST_NAME_FIELD_STATUS} and ${LAST_NAME_FIELD_STATUS} and ${POSTAL_CODE_FIELD_STATUS}
            Log    All the Fields are Visible
        ELSE IF    not $FIRST_NAME_FIELD_STATUS
            Log    FIRST_NAME_FIELD Not Visible
        ELSE IF    not $LAST_NAME_FIELD_STATUS
            Log    Last Name Field not Visible
        ELSE IF    not $POSTAL_CODE_FIELD_STATUS
            Log    Zip Code Field Not Visible
        END
    EXCEPT    TimeOutError
        Log    Some Contact Information Fields are not Visible after 5s
    END



Click On Continue Button
    [Documentation]    This keyword Clicks on Continue Button after Entering the Information
    ${CONTINUE_BUTTON_STATUS}    Run keyword and return status    Wait until element is visible    ${CONTINUE_BUTTON}
    IF    ${CONTINUE_BUTTON_STATUS}
        Click element    ${CONTINUE_BUTTON}
        Log    Clicked On Continue Button
    ELSE
        Log    Continue Button Not Found
    END

Capture Screenshot of Order Summary and Click On Finish Button
    [Documentation]    This Keyword Capture the Order List and Click on Finish Button
    TRY
        ${FINISH_BUTTON_STATUS}    Run keyword and return status    Wait until element is visible    ${FINISH_BUTTON}
        Capture page screenshot    screenshots/Order_Summary.png
        IF    ${FINISH_BUTTON_STATUS}
           Click element    ${FINISH_BUTTON}
           Log    Clicked On Finish Button
        ELSE
           Log    Not Clicked On Finish Button
        END
    EXCEPT    TimeOutError
        Log    Error Found in Information
    END


Capture Screenshot of Confirmation and Print it
    [Documentation]    This Keyword Capture the Success text and Print in the Log
    TRY
        ${CONFIRMATION_TEXT_STATUS}    ${RESULT}=    Run keyword and ignore error    Wait until element is visible    ${CONFIRMATION_TEXT}
        IF    '${CONFIRMATION_TEXT_STATUS}'=='PASS'
            Capture page screenshot    screenshots/Confirmation_Message.png
            ${TEXT}    Get text    ${CONFIRMATION_TEXT}
            Set test message    ${TEXT}
        ELSE
            Log    Some Information Error Found
        END
    EXCEPT    TimeOutError
        Log    Text Not Found After 5s
    END

Error Text validation
    TRY
        ${ERROR_TEXT_STATUS}    ${RESULT}=    Run keyword and ignore error    Wait until element is visible    ${ERROR_TEXT}
        IF    '${ERROR_TEXT_STATUS}'=='PASS'
           ${ERROR}    Get text    ${ERROR_TEXT}
           Log     The Error is: ${ERROR}
        ELSE
           Log    No Error Found
        END
    EXCEPT    TimeOutError
        Log    No Error Found
    END


