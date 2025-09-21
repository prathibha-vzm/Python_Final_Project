*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/navigation_to_dashboard.robot
Resource    ../keywords/cart_icon_keywords.robot
Resource    ../keywords/add_products_keywords.robot
Resource    ../keywords/logout_keywords.robot
Resource    ../keywords/cart_items_count_keywords.robot
Resource    ../keywords/verify_products_in_cart_keywords.robot
Resource    ../resources/test_case_7_resources.robot
Resource    ../pages/check_out_page.robot
Resource    ../pages/base_page.robot
Library    DataDriver    ../data/test_contact_information.csv
Test Template    Fill the Check Out Information
Suite Setup    Launch Browser
Suite Teardown    Close the Browser
Documentation    This Test Proceed to checkout, fill in user details, and capture a screenshot of the order summary.
...              Finalize the order and verify the confirmation message.
...              Used CSV- DATA DRIVEN Testing

*** Test Cases ***
Fill the Check Out Information${FIRST_NAME} and ${LAST_NAME} and ${ZIP_CODE}
*** Keywords ***
Fill the Check Out Information
    [Tags]    Fill the Information using Data-Driven - CSV-DATA
    Validate product details inside the cart
    Click On Check Out
    Validate Contact Information Fields Visibility
    [Arguments]    ${FIRST_NAME}    ${LAST_NAME}    ${ZIP_CODE}
    TRY
        Clear element text    ${FIRST_NAME_FIELD}
        Input text    ${FIRST_NAME_FIELD}    ${FIRST_NAME}
        Log    Entered First Name: ${FIRST_NAME}
        Clear element text    ${LAST_NAME_FIELD}
        Input text    ${LAST_NAME_FIELD}    ${LAST_NAME}
        Log    Entered Second Name:${LAST_NAME}
        Clear element text    ${POSTAL_CODE_FIELD}
        Input text    ${POSTAL_CODE_FIELD}    ${ZIP_CODE}
        Log    Entered Postal Code:${ZIP_CODE}
    EXCEPT    TimeOutError
        Log    Contact Information are not Found after 5s
    END
    Click On Continue Button
    Error Text validation
    Capture Screenshot of Order Summary and Click On Finish Button
    Capture Screenshot of Confirmation and Print it
