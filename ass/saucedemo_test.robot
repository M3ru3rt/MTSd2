*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${BROWSERSTACK_USERNAME}    bsuser_q7lyHg
${BROWSERSTACK_ACCESS_KEY}  wMyMvNceUse7NHpyE79A
${URL}                      https://www.saucedemo.com/
${REMOTE_URL}               https://${BROWSERSTACK_USERNAME}:${BROWSERSTACK_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub
${BROWSER}                  chrome

*** Test Cases ***
Login With Valid User
    Wait Until Element Is Visible    id=user-name    timeout=5s
    Input Text    id=user-name       standard_user
    Input Text    id=password        secret_sauce
    Click Button  id=login-button
    Page Should Contain Element      xpath://span[text()='Products']

Login With Invalid User
    Wait Until Element Is Visible    id=user-name    timeout=5s
    Input Text    id=user-name       wrong_user
    Input Text    id=password        wrong_pass
    Click Button  id=login-button
    Page Should Contain              Epic sadface

*** Keywords ***
Open Browser To Login Page
    &{caps}=    Create Dictionary
    ...    browserName=${BROWSER}
    ...    browser_version=latest
    ...    os=Windows
    ...    os_version=10
    ...    name=RobotFramework Test
    Open Browser    ${URL}    ${BROWSER}    remote_url=${REMOTE_URL}    desired_capabilities=${caps}
