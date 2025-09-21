*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/navigation_to_dashboard.robot
Resource    ../keywords/cart_icon_keywords.robot
Resource    ../keywords/add_products_keywords.robot
Resource    ../keywords/logout_keywords.robot
Resource    ../keywords/cart_items_count_keywords.robot
Resource    ../pages/base_page.robot
Documentation    These Keywords Add the 4 randomly selected products into the cart and verify the cart item count matches.

*** Keywords ***
Add selected products to cart and validate
     Launch Browser
     Navigate to Products
     Click On Filter
     ${ADDED_ITEMS}=    Add Multiple Products
     Cart Icon Visibility
     Validate the Count Of Items Added    ${ADDED_ITEMS}

