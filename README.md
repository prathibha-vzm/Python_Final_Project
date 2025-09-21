# Automated Testing of E-commerce Web Application
# Project Architecture
<pre><code>
sauce/
├── data/                          # Test data files (CSV/ODS) and conversion scripts
│   ├── convert_ods_csv.py         # Script to convert ODS to CSV
│   ├── test_contact_information.csv
│   ├── test_contact_information.ods
│   ├── test_data.csv
│   ├── test_data.ods
│   ├── test_invalid_credentials.ods
│   └── test_invalid_credentials_data.csv
│
├── keywords/                      # Reusable keyword files
│   ├── add_products_keywords.robot
│   ├── cart_icon_keywords.robot
│   ├── cart_items_count_keywords.robot
│   ├── invalid_credentials.robot
│   ├── logout_keywords.robot
│   ├── navigation_to_dashboard.robot
│   └── verify_products_in_cart_keywords.robot
│
├── pages/                         # Page Object Model files (UI element locators + actions)
│   ├── base_page.robot
│   ├── check_out_page.robot
│   ├── login_page.robot
│   └── products_page.robot
│
├── resources/                     # Test resource files for specific scenarios
│   ├── test_case_3_resources.robot
│   ├── test_case_4_resources.robot
│   ├── test_case_5_resources.robot
│   ├── test_case_6_resources.robot
│   ├── test_case_7_resources.robot
│   ├── test_case_9_resources.robot
│   └── test_case_10_resources.robot
│
├── screenshots/                   # Captured screenshots during test execution
│
├── tests/                         # Test Suites
│   ├── test_invalid_credentials.robot
│   ├── test_login_suite.robot
│   ├── test_order_summary_suite.robot
│   └── test_sauce_demo_appln_suite.robot
│
├── variables/                     # Centralized variable files
│   ├── appln_launching_variables.robot
│   ├── check_out_variables.robot
│   ├── csv_file_path_variables.robot
│   ├── home_page_variables.robot
│   └── products_page_variables.robot
├── report
├── requirements.txt               # Python dependencies (SeleniumLibrary, DataDriver, etc.)
</code></pre>

## Features

* Page Object Model (POM) for maintainability
* Data-Driven Testing using CSV/ODS (via DataDriver library)
* Reusable Keywords for modular test design
* Screenshots & Logs
* End-to-End Coverage including login, add-to-cart, checkout, and logout
* Error Handling with TRY/EXCEPT and conditional validation
* Edge Test Cases including:
  1. Invalid login credentials
  2. Missing/empty contact information
  3. Verifying cart reset functionality
  4. Validating product count mismatch
  5. Checking error messages when expected fields are not filled

# Usage
## To Install Dependencies
<pre><code>pip install -r requirements.txt</code></pre>
## To Create and Activate Virtual Environment
<pre><code>python -m venv sauce</code>
<code>./sauce/Scripts/activate</code></pre>
## To Run the Test in Cross Browser
### chrome
<pre><code> robot tests/ </code></pre>
### edge
<pre><code> robot --variable BROWSER:edge tests/ </code></pre>

