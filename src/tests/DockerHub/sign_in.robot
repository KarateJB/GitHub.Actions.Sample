*** Settings ***
Library       SeleniumLibrary
Library       OperatingSystem
Library       ChromeConfiguration.py
Library       XvfbRobot
Force Tags    clockin
Resource      %{ENV_DIR}/%{TEST_ENV}/env_settings.robot
# Resource      resources/vars.resource

*** Variables ***
${BROWSER}   chrome  # See https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Open%20Browser
${CHROMEDRIVER_PATH}  /usr/local/bin/chromedriver
${SELSPEED}  0.0s

*** Test Cases ***
Sign In
    ${ID}    Get Environment Variable   DOCKERHUB_ID
    ${PWD}    Get Environment Variable   DOCKERHUB_PWD
    # Log To Console    DockerHub ID is ${DOCKERHUB_ID}
    # Log To Console    DockerHub PWD is ${DOCKERHUB_PWD}
    Set Environment Variable    webdriver.chrome.driver    /usr/local/bin/chromedriver
    ${chrome_options}    ChromeConfiguration.Config
    ${args}    ChromeConfiguration.Serviceargs
    Start Virtual Display    1920    1080
    Create WebDriver    Chrome    chrome_options=${chrome_options}    service_args=${args}
    Go To    ${DOCKERHUB_HOST}
    # Open Browser    ${HR_HOST}    ${BROWSER}    options=${chrome_options}    executable_path=${CHROMEDRIVER_PATH}
    click    id=log_in
    Wait Until Element Is Visible    id=nw_username    30
    Capture Page Screenshot
    type    id=nw_username    ${ID}
    type    id=nw_password    ${PWD}
    # submit    css=._26tiYHbQ518oVwdTK3a4ol
    click    id=nw_submit
    Wait Until Element Is Visible    id=homeButton    10
    Capture Page Screenshot
    [Teardown]  Close Browser
*** Keywords ***
open
    [Arguments]    ${element}
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element  ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

selectAndWait
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

select
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

verifyValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]         ${code}
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    Alert Should Be Present  ${value}
