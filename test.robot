*** Settings ***
Library    Selenium2Library
Library   OperatingSystem

*** Variables ***
${URL}          http://rc-webd.rctiplus.com/login
${BROWSER}      chrome
${USERNAME}     yuyunjoe529@gmail.com
${PASSWORD}     yuyun0910
${BUTTON_LOGIN}    
${DELAY}        5s

*** Keywords ***
Navigate to the site
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fill in login page
    Selenium2Library.Input Text  id:username    ${USERNAME}
    Selenium2Library.Input Text   id:password  ${PASSWORD}
    Sleep     ${DELAY}
    Selenium2Library.Capture Page Screenshot     c:/Users/SU - NB0142/Robot/selenium-screenshot-1.png
    Selenium2Library.Click Button  id:btnLogin  ${BUTTON_LOGIN}    
    Sleep     ${DELAY}

Wait Until Page Contains
    Selenium2Library.Wait Until Element Is Visible    xpath=//body/section[@id='banner']/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/img[1]
    Selenium2Library.Capture Page Screenshot    D:/Arief/python/Robot-Test/Capture/LandingPage.png
    Sleep     ${DELAY}

Logout
    Selenium2Library.Click Element  xpath=//body/nav[1]/div[1]/div[1]/ul[2]/li[3]/a[1]/i[1]
    Selenium2Library.Wait Until Element Is Visible    xpath=//body/section[@id='user-content']/div[1]/div[1]/div[1]/div[1]/div[2]/a[1]
    Selenium2Library.Capture Page Screenshot     D:/Arief/python/Robot-Test/Capture/LogoutRCTIPlus.png
    Selenium2Library.Click Element     xpath=//body/section[@id='user-content']/div[1]/div[1]/div[1]/div[1]/div[2]/a[1]
    Selenium2Library.Wait Until Element Is Visible      xpath=//body/section[@id='bottom-box']/div[1] 
    Selenium2Library.Close All Browsers
    

*** Test Cases ***
Login RCTI
    [Tags]    LOGIN
    Navigate to the site
    Fill in login page
    Wait Until Page Contains
    Logout