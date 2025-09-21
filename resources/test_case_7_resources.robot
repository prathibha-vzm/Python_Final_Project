*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/navigation_to_dashboard.robot
Resource    ../keywords/cart_icon_keywords.robot
Resource    ../keywords/add_products_keywords.robot
Resource    ../keywords/logout_keywords.robot
Resource    ../keywords/cart_items_count_keywords.robot
Resource    ../keywords/verify_products_in_cart_keywords.robot
Resource    ../pages/base_page.robot
Documentation     Navigate to the cart page and fetch the listed product details to ensure accuracy.

*** Keywords ***
Validate product details inside the cart
     Launch Browser
     Navigate to Products
     Click On Filter
     ${ADDED_ITEMS}=    Add Multiple Products
     Click On Cart Icon
     Verify Multiple Product In Cart    ${ADDED_ITEMS}
