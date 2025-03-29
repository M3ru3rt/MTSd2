*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
#Library  JSONLibrary

Variables  ./locators.py
Variables  ./testData.py
#
#*** Variables ***
#${BROWSER}        chrome
#${URL}            https://www.demoblaze.com

*** Keywords ***
Open Website
    Open Browser  ${BaseUrl}     chrome

Sign Up
    Wait Until Page Contains Element  ${SignUp}  timeout=80  error=noSignUpLink
    Click Element   ${SignUp}
    Sleep    2s
    Wait Until Page Contains Element  ${SignupUsernameField}  timeout=80  error=failedUsername
    Sleep    1s
    Input Text      ${SignupUsernameField}      ${Username}
    Input Password  ${SignupPasswordField}      ${Password}
    Sleep    3s
    Click Button  ${SignupButton}

Login
    Wait Until Page Contains Element  ${LoginLink}  timeout=80  error=noSignUpLink
    Click Element  ${LoginLink}
    Sleep    2s

    Wait Until Page Contains Element  ${LoginUsernameField}  timeout=80  error=noSignUpLink
    Sleep    2s
    Input Text  ${LoginUsernameField}  ${Username}

    Sleep    2s
    Wait Until Page Contains Element  ${LoginPasswordField}  timeout=10s  error=noSignUpLink
    Input Password  ${LoginPasswordField}  ${Password}

    Wait Until Element Is Enabled  ${LoginButton}  timeout=10s  error=Login button disabled
    Click Button  ${LoginButton}

Logout
#    Wait Until Page Contains Element  ${LoginLink}  timeout=80  error=noSignUpLink
#    Click Element  ${LoginLink}
#    Sleep    2s
#
#    Wait Until Page Contains Element  ${LoginUsernameField}  timeout=80  error=noSignUpLink
#    Sleep    2s
#    Input Text  ${LoginUsernameField}  ${Username}
#
#    Sleep    2s
#    Wait Until Page Contains Element  ${LoginPasswordField}  timeout=10s  error=noSignUpLink
#    Input Password  ${LoginPasswordField}  ${Password}
#
#    Wait Until Element Is Enabled  ${LoginButton}  timeout=10s  error=Login button disabled
#    Click Button  ${LoginButton}
    Sleep  10s

    Wait Until Page Contains Element  ${LogoutButton}  timeout=10s  error=Logout button disabled
    Click Element  ${LogoutButton}
#Login With Invalid Credentials
#    [Documentation]  Attempts login with invalid credentials
#    [Arguments]  ${username}  ${password}
#    Wait Until Page Contains Element  ${LoginLink}  timeout=10s
#    Click Element  ${LoginLink}
#
#    Input Text  ${LoginUsernameField}  ${username}
#    Input Password  ${LoginPasswordField}  ${password}
#
#    Click Button  ${LoginButton}
#    Handle Alert  action=ACCEPT


#
#Login
#    Wait Until Page Contains Element    ${LoginButton}    timeout=80 error=noLoginButtonFound
#
#Fill Create Link
#    sleep   2s
#    Wait Until Page Contains Element    ${SiteDropDown}  timeout=80 error=error1
#    Sleep   1s
#    Click Element ${SiteDropDown}
#    Sleep  1s
#    Wait Until Page Contains Element ${DropDownButton}      timeout=80 error=error1

#
#Open Test Browser
#    Open Browser    ${URL}    ${BROWSER}
#    Maximize Browser Window
#    Set Selenium Speed    0.5
#
#Close Test Browser
#    Close All Browsers