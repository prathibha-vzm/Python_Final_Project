*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    CSVLibrary
Resource    ../pages/base_page.robot
Resource    ../pages/login_page.robot
Resource    ../pages/products_page.robot
Resource    ../variables/csv_file_path_variables.robot
Documentation    This Keyword is Reusable to Naviagte Dashboard

*** Keywords ***
Navigate to Products
    [Documentation]   This Keyword Enters Valid Credentials and Navigate to Products
    ${DATA}=    Read csv file to List    ${CSV_FILE_PATH}    delimiter=;
    ${VALID}=    Set variable    ${DATA}[1]

    FOR    ${ROW}    IN    ${VALID}
        ${USERNAME}=    Set variable    ${ROW}[1]
        ${PASSWORD}=    Set variable    ${ROW}[2]
        Validate Url
        Validate Username and Password Fields Visibility
        Enter Credentials    ${USERNAME}    ${PASSWORD}
        Click On Login Button
        Error Message Validation
        Read the Page Title
    END
