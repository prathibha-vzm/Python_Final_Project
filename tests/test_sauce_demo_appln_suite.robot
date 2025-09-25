*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/test_case_3_resources.robot
Resource    ../resources/test_case_4_resources.robot
Resource    ../resources/test_case_5_resources.robot
Resource    ../resources/test_case_6_resources.robot
Resource    ../resources/test_case_7_resources.robot
Resource    ../resources/test_case_9_resources.robot
Resource    ../resources/test_case_10_resources.robot
Resource    ../pages/base_page.robot
Resource    ../variables/csv_file_path_variables.robot
Suite Setup    Launch Browser
Suite Teardown    Close the Browser

*** Test Cases ***
Test Case 3
     [Documentation]   This Test Verifies the Logout Functionality
     Validate logout functionality
Test Case 4
     [Documentation]    This Test Verify if the cart icon is visible on the product listing page post login.
     [Tags]    TC008
     Check cart icon visibility
Test Case 5
     [Documentation]   This Test Verifies Adding Random Products
     [Tags]    TC009
     Random selection of products and data extraction
Test Case 6
     [Documentation]    This Test Verifies the Number of Items Added and Count in Cart are same
     [Tags]    TC010
     Add selected products to cart and validate
Test Case 7
     [Documentation]    This Test Verifies the Selected Product and Products in the Cart are Same
     [Tags]    TC011
     Validate product details inside the cart
Test Case 9
     [Documentation]    This Test Change the sorting option (e.g., "Price (low to high)", "Name (Z to A)") from the sort dropdown and verify that the product list updates accordingly.
     [Tags]    TC016
     Validate sorting functionality on the products page
Test Case 10
     [Documentation]    After adding products to the cart and navigating the site, click the menu and choose "Reset App State."
     [Tags]    TC017
     Validate Reset App State functionality