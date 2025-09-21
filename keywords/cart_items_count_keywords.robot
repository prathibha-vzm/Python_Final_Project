*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/products_page_variables.robot
Documentation    This Keyword verifies the Added Items and The Count Shows in Cart

*** Keywords ***
Validate the Count Of Items Added
    [Documentation]    This Keyword verifies the Added Items and The Count Shows in Cart
    [Arguments]    ${ADDED_ITEMS}
    ${ITEMS_COUNT}=    Get length    ${ADDED_ITEMS}
    TRY
       ${COUNT}=    Get text    ${CART_ICON_COUNT}
       ${CART_COUNT}=    Convert to integer    ${COUNT}
       Should be equal    ${CART_COUNT}    ${ITEMS_COUNT}
       Set test message    Cart Count: ${COUNT} Number Of Items: ${ITEMS_COUNT}
    EXCEPT    TimeOutError
       Log    No Items are Added
    END
