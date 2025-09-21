*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/navigation_to_dashboard.robot
Resource    ../pages/products_page.robot
Resource    ../keywords/logout_keywords.robot
Documentation    This Keywords Login the Swag Labs Using Valid Credentials and Check the Logout Functionality

*** Keywords ***
Validate logout functionality
    Navigate to Products
    Click on Open Menu
    Click On LogOut
    Validate Logout
