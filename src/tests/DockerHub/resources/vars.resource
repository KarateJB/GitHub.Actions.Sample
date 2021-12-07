*** Settings ***
Documentation    Resource file with variables
Resource      %{ENV_DIR}/%{TEST_ENV}/credentials.robot

*** Variables ***
${LOGIN_ID}    ${ID}
${LOGIN_PWD}   ${PWD}


*** Keywords ***
# Add keywords here