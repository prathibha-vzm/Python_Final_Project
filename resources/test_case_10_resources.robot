*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/navigation_to_dashboard.robot
Resource    ../keywords/cart_icon_keywords.robot
Resource    ../pages/products_page.robot
Resource    ../resources/test_case_6_resources.robot
Documentation    After adding products to the cart and navigating the site, click the menu and choose "Reset App State."

*** Keywords ***
Validate Reset App State functionality
     Add selected products to cart and validate
     Click on Open Menu
     Click on Reset App State

