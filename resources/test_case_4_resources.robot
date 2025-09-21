*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/navigation_to_dashboard.robot
Resource    ../keywords/cart_icon_keywords.robot
Resource    ../keywords/logout_keywords.robot
Documentation    This Keyword Login using Valid Credentials and Verify if the cart icon is visible on the product listing page post login
*** Keywords ***
Check cart icon visibility
    Navigate to Products
    Cart Icon Visibility
    Click on Open Menu
    Click On LogOut


