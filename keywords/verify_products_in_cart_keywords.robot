*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../variables/products_page_variables.robot
Documentation    This Checks the Items in the Cart matches with the Items that are selected

*** Keywords ***
Verify Multiple Product In Cart
    [Documentation]    This Checks the Items in the Cart matches with the Items that are selected
    [Arguments]    ${EXPECTED_ITEMS}
    Click Element    ${CART_ICON}
    @{CART_ITEMS_TEXT}=    Get WebElements    ${CART_ITEM_NAME}
    @{ACTUAL_ITEMS}=    Create List
    FOR    ${ITEM}    IN    @{CART_ITEMS_TEXT}
        ${ITEM_TEXT}    Get Text    ${ITEM}
        Append To List    ${ACTUAL_ITEMS}    ${ITEM_TEXT}
    END
    Set test message   Added Products: ${ACTUAL_ITEMS}\nProducts In Cart: ${EXPECTED_ITEMS}
    Lists Should Be Equal    ${EXPECTED_ITEMS}    ${ACTUAL_ITEMS}
    Capture Page Screenshot    screenshots/Multiple_Products_Cart.png

Click On Check Out
    [Documentation]    This helps to click on Check Out Button
    Click Button    ${CHECK_OUT}