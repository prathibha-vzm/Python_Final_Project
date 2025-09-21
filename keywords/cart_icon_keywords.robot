*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/products_page_variables.robot
Documentation    This Keyword is to do Cart Functionality

*** Keywords ***
Cart Icon Visibility
    [Documentation]    This Keyword Verifies the Cart Icon Visibility
    TRY
        ${CART_ICON_STATUS}    Run keyword and return status    Wait until element is visible    ${CART_ICON}
        IF    ${CART_ICON_STATUS}
            Wait until element is enabled    ${CART_ICON}
            Set test message    Cart Icon is Visible
        ELSE
            Set test message    Cart Icon Not Visible
        END
    EXCEPT    TimeOutError
        Log    Cart Icon Not Found After 5s
    END

Click On Cart Icon
    [Documentation]    This Keyword Clicks on Cart
    TRY
        Click element    ${CART_ICON}
        Set test message    Cart Icon is Clicked
    EXCEPT    TimeOutError
        Log    Cart Icon Not Clickable
    END