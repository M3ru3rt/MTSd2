*** Settings ***
Resource    ../Resources/resources.robot

*** Test Cases ***
Sign Up
    Open Website
    Sign Up
    Close Browser

Successful Login Test
    Open Website
    Login
    Close Browser

LogoutTest
    Open Website
    Login
    Logout
#    Page Should Contain Element  ${WelcomeMessage}
#    Close Browser

#Invalid Login Test
#    Open Website
#    Login With Invalid Credentials  ${InvalidUsername}  ${InvalidPassword}
#    Page Should Not Contain Element  ${WelcomeMessage}
#    Close Browser