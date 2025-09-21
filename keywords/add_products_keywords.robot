*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../variables/products_page_variables.robot
Documentation    This Keywords Add Multiple Products to the Cart

*** Keywords ***
Click On Filter
    [Documentation]    This Clicks on Filter
    ${SELECT_ELEMENT_STATUS}    Run keyword and return status    Wait until element is visible    ${SELECT_ELEMENT}
    IF    ${SELECT_ELEMENT_STATUS}
        Log    Filter is Found
        Click Element    ${SELECT_ELEMENT}
        Log    Clicked On Filter
    ELSE
        Log    Filter Not Found
    END

Add Multiple Products
    [Documentation]    This Add the first product from the selected filter and click on Add to Cart
    @{OPTIONS}=    Get List Items    ${SELECT_ELEMENT}
    @{ADDED_ITEMS}=    Create List

    FOR    ${OPTION}    IN    @{OPTIONS}
        Log    Selected Filter: ${OPTION}
        Select From List By Label    ${SELECT_ELEMENT}    ${OPTION}
        Sleep    2s
        ${ITEM_TEXT}=    Get Text    ${ITEM_NAME}
        Log    Name of the Item: ${ITEM_TEXT}
        Append To List    ${ADDED_ITEMS}    ${ITEM_TEXT}
        Log    Product Selected ${OPTION}: ${ITEM_TEXT}
        Click Button    ${ADD_TO_CART}
        Sleep    2s
        Click Element    ${SELECT_ELEMENT}
    END
    Capture Page Screenshot    screenshots/Multiple_Products_Adding_Items.png
    Set test message    Added Items are ${ADDED_ITEMS}
    RETURN    ${ADDED_ITEMS}

