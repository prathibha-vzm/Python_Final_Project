*** Variables ***
${FIRST_NAME_FIELD}    xpath=//input[@placeholder="First Name"]
${LAST_NAME_FIELD}    xpath=//input[@placeholder="Last Name"]
${POSTAL_CODE_FIELD}    xpath=//input[@placeholder="Zip/Postal Code"]
${CONTINUE_BUTTON}    xpath=//input[@id="continue"]
${ERROR_TEXT}    xpath=//h3[@data-test="error"]
${FINISH_BUTTON}    xpath=//button[@id="finish"]
${CONFIRMATION_TEXT}    xpath=//h2[text()='Thank you for your order!']