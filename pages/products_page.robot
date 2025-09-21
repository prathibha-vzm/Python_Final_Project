*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../variables/products_page_variables.robot
Resource    ../variables/home_page_variables.robot
Resource    ../variables/appln_launching_variables.robot
Documentation    This Keyword Contains the Products Page Elements Action

*** Keywords ***
Read the Page Title
    [Documentation]    This Keyword Print the Page Title
    ${DASHBOARD_TITLE_STATUS}    Run keyword and return status    ${DASHBOARD_TITLE}
    IF    ${DASHBOARD_TITLE_STATUS}
        ${TITLE}    Get text    ${DASHBOARD_TITLE}
        Log    Dashboard Title is:${TITLE}
    ELSE
        Log    Page Not Loaded Properly.
    END

Click on Open Menu
    [Documentation]    This Keyword Click on Side menu
    TRY
        ${OPEN_MENU_STATUS}    Run keyword and return status    Wait until element is visible    ${OPEN_MENU}
        IF    ${OPEN_MENU_STATUS}
            Log    Found the Open Menu
            Click element    ${OPEN_MENU}
            Log    Clicked on Open Menu
        ELSE
            Log    Open Menu Not Clickable
        END
    EXCEPT    TimeOutError
        Log    Open Menu Element Not Found in 5s
    END

Sort the Product
    [Documentation]    This Keyword fetch the List of Product Name and Price in Separate and Sort it in Order
    ${ITEM_NAME_STATUS}    Run keyword and return status    Wait until element is visible    ${ITEMS_NAME}
    ${ITEM_PRICE_STATUS}    Run keyword and return status    Wait until element is visible    ${ITEM_PRICE}

    IF    ${ITEM_NAME_STATUS} and ${ITEM_PRICE_STATUS}
        ${NAME_LIST}=    Create list
        ${PRICE_LIST}=    Create list
        ${ASCENDING_LIST}=    Create list
        ${DESCENDING_LIST}=    Create list
        ${PRICE_LOW_HIGH}=    Create list
        ${PRICE_HIGH_LOW}=    Create list

        ${ITEMS_NAME_LIST}    Get WebElements    ${ITEMS_NAME}
        ${ITEMS_PRICE_LIST}    Get WebElements    ${ITEM_PRICE}

        FOR    ${NAME}    IN   @{ITEMS_NAME_LIST}
           ${NAME_TEXT}=    Get Text    ${NAME}
           Log to console    ${NAME_TEXT}
           Append to list    ${NAME_LIST}    ${NAME_TEXT}
           Append to list    ${ASCENDING_LIST}    ${NAME_TEXT}
           Append to list    ${DESCENDING_LIST}    ${NAME_TEXT}
        END

        Sort list    ${ASCENDING_LIST}
        Log to console    Ascending list: ${ASCENDING_LIST}
        ${DESCENDING_LIST}=    Evaluate    sorted(${NAME_LIST}, reverse=True)
        Log to console    Descending List: ${DESCENDING_LIST}

        FOR    ${SPRICE}    IN    @{ITEMS_PRICE_LIST}
           ${PRICE_TEXT}=    Get Text    ${SPRICE}
           ${PRICE}=    Replace string    ${PRICE_TEXT}    $    ${EMPTY}
           ${PRICE_NUMBER}=    Convert to number    ${PRICE}
           Append to list    ${PRICE_LIST}    ${PRICE_NUMBER}
           Append to list    ${PRICE_LOW_HIGH}    ${PRICE_NUMBER}
           Append to list    ${PRICE_HIGH_LOW}    ${PRICE_NUMBER}
        END

        Sort list    ${PRICE_LOW_HIGH}
        Log to console    Low_High: ${PRICE_LOW_HIGH}
        ${PRICE_HIGH_LOW}=    Evaluate    sorted(${PRICE_LOW_HIGH}, reverse=True)
        Log to console    High_low: ${PRICE_HIGH_LOW}

    ELSE
        Log    No Items Found
    END

    RETURN    ${PRICE_LOW_HIGH}    ${PRICE_HIGH_LOW}    ${ASCENDING_LIST}    ${DESCENDING_LIST}


Compare the Actual Lists With Expected Lists
    [Documentation]    This Keyword Fetch the Items Name and Price according to the Filter and Assert it with thw Sorted List
    [Arguments]    ${PRICE_LOW_HIGH}    ${PRICE_HIGH_LOW}    ${ASCENDING_LIST}    ${DESCENDING_LIST}
    @{OPTIONS}=    Get List Items    ${SELECT_ELEMENT}
    ${FILTER}=    Create list

    FOR    ${OPTION}    IN    @{OPTIONS}
       Select From List By Label    ${SELECT_ELEMENT}    ${OPTION}

       ${ITEM_NAME_LIST}=    Get WebElements    ${ITEMS_NAME}
       ${ITEM_PRICE_LIST}=    Get WebElements    ${ITEM_PRICE}
       Log to console    Selected Filter is: ${OPTION}

       IF    '${OPTION}'=='Name (A to Z)'
           ${ACTUAL_ASCENDING_NAME}=    Create list
            FOR    ${NAME}    IN    @{ITEM_NAME_LIST}
                ${ITEMS_TEXT}=    Get text    ${NAME}
                Append to list    ${ACTUAL_ASCENDING_NAME}    ${ITEMS_TEXT}
           END
           Run keyword and ignore error    Capture page screenshot    screenshots/Name_A_to_Z.png
       ELSE IF    '${OPTION}'=='Name (Z to A)'
           ${ACTUAL_DESCENDING_NAME}=    Create list
           FOR    ${NAME}    IN    @{ITEM_NAME_LIST}
                ${ITEMS_TEXT}=    Get text    ${NAME}
                Append to list    ${ACTUAL_DESCENDING_NAME}    ${ITEMS_TEXT}
           END
           Run keyword and ignore error    Capture page screenshot    screenshots/Name_Z_to_A.png

       ELSE IF    '${OPTION}'=='Price (low to high)'
           ${ACTUAL_LOW_HIGH_PRICE}=    Create list
           FOR    ${SPRICE}    IN    @{ITEM_PRICE_LIST}
                ${PRICE_TEXT}=    Get Text    ${SPRICE}
                ${PRICE}=    Replace string    ${PRICE_TEXT}    $    ${EMPTY}
                ${PRICE_NUMBER}=    Convert to number    ${PRICE}
                Append to list    ${ACTUAL_LOW_HIGH_PRICE}    ${PRICE_NUMBER}
           END
           Run keyword and ignore error    Capture page screenshot    screenshots/Price_low_to_high.png

       ELSE IF    '${OPTION}'=='Price (high to low)'
           ${ACTUAL_HIGH_LOW_PRICE}=    Create list
           FOR    ${SPRICE}    IN    @{ITEM_PRICE_LIST}
                ${PRICE_TEXT}=    Get Text    ${SPRICE}
                ${PRICE}=    Replace string    ${PRICE_TEXT}    $    ${EMPTY}
                ${PRICE_NUMBER}=    Convert to number    ${PRICE}
                Append to list    ${ACTUAL_HIGH_LOW_PRICE}    ${PRICE_NUMBER}
           END
           Run keyword and ignore error    Capture page screenshot    screenshots/Price_high_to_low.png

       END
    END
    # Assertions
    Should be equal   ${ACTUAL_ASCENDING_NAME}    ${ASCENDING_LIST}
    Log to console    Actual: ${ACTUAL_ASCENDING_NAME}\n Expected: ${ASCENDING_LIST}
    Should be equal   ${ACTUAL_DESCENDING_NAME}    ${DESCENDING_LIST}
    Log to console    Actual: ${ACTUAL_DESCENDING_NAME}\n Expected: ${DESCENDING_LIST}
    Should be equal    ${ACTUAL_LOW_HIGH_PRICE}    ${PRICE_LOW_HIGH}
    Log to console    Actual: ${ACTUAL_LOW_HIGH_PRICE}\n Expected: ${PRICE_LOW_HIGH}
    Should be equal    ${ACTUAL_HIGH_LOW_PRICE}    ${PRICE_HIGH_LOW}
    Log to console    Actual: ${ACTUAL_HIGH_LOW_PRICE}\n Expected: ${PRICE_HIGH_LOW}



Click on Reset App State
    [Documentation]    This Keyword Click on Reset app in the Side Menu
    ${RESET_APP_STATUS}    Run keyword and return status    Wait until element is visible    ${RESET_APP}
    IF    ${RESET_APP_STATUS}
       Click element    ${RESET_APP}
       Sleep    5s
       Log    Clicked on Reset App
       ${CART_ICON_COUNT_STATUS}    Run keyword and return status    Wait until element is visible    ${CART_ICON_COUNT}
       IF    ${CART_ICON_COUNT_STATUS}
          Log    Reset App Does not Cleared the Cart Items
       ELSE
          Set test message    Successfully Clicked on Reset App and Cleared the Cart Items.!
       END

    ELSE
       Log    Reset App Not found
    END
    Capture page screenshot    screenshots/Reset_App_State.png

