*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/navigation_to_dashboard.robot
Resource    ../pages/products_page.robot
Resource    ../keywords/logout_keywords.robot
Resource    ../pages/base_page.robot
Documentation    These Keywords Change the sorting option (e.g., "Price (low to high)", "Name (Z to A)") from the sort dropdown and verify that the product list updates accordingly.


*** Keywords ***
Validate sorting functionality on the products page
     Launch Browser
     Navigate to Products
     ${PRICE_LOW_HIGH}    ${PRICE_HIGH_LOW}    ${ASCENDING_LIST}    ${DESCENDING_LIST}=    Sort the Product
     Compare the Actual Lists With Expected Lists    ${PRICE_LOW_HIGH}    ${PRICE_HIGH_LOW}    ${ASCENDING_LIST}    ${DESCENDING_LIST}
     Logout
