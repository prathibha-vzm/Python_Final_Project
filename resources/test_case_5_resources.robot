*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/navigation_to_dashboard.robot
Resource    ../keywords/cart_icon_keywords.robot
Resource    ../keywords/add_products_keywords.robot
Resource    ../keywords/logout_keywords.robot
Documentation    These Keywords Randomly select 4 out of the 6 listed products and fetch their names and prices.

*** Keywords ***
Random selection of products and data extraction
     Navigate to Products
     Click On Filter
     Add Multiple Products
     Logout



