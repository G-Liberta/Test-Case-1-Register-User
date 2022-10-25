*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${browser}    chrome
${url}      https://www.automationexercise.com/

*** Test Cases ***
Register User
    [Documentation]    This is a test case to register a User
    [Tags]    Functional

    Open the page under test
    Sign up as a new user
    Enter account informations
    Create account and verify it is created
    Verify your account is created
    Delete account
    Close Browser
    
*** Keywords ***

Open the page under test
    Open Browser     ${url}     ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
Sign up as a new user
    Press Keys    //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a    Return
    Element Should Be Visible    //*[@id="form"]/div/div/div[3]/div/h2
    Input Text    //*[@id="form"]/div/div/div[3]/div/form/input[2]   Liberta
    Input Text    //*[@id="form"]/div/div/div[3]/div/form/input[3]    fittitit@gmail.com
    Press Keys    //*[@id="form"]/div/div/div[3]/div/form/button    Return
    Wait Until Element Contains    //*[@id="form"]/div/div/div/div[1]/h2/b    ENTER ACCOUNT INFORMATION
    Set Browser Implicit Wait    5
Enter account informations
    Press Keys    //*[@id="id_gender2"]    Return
    Input Password    //*[@id="password"]    Libidibi
    Scroll Element Into View    //*[@id="address1"]
    Mouse Down    //*[@id="days"]
    Select From List By Index    days    10
    Sleep    1
    Mouse Down    //*[@id="months"]
    Select From List By Index    months    11
    Sleep    1
    Mouse Down    //*[@id="years"]
    Select From List By Label    years    1990
    Sleep    1
    Press Keys    //*[@id="newsletter"]   Return
    Press Keys    //*[@id="optin"]    Return
    Scroll Element Into View    //*[@id="form"]/div/div/div/div[1]/form/button

    Input Text    //*[@id="first_name"]    Liberta
    Input Text    //*[@id="last_name"]    Gani
    Input Text    //*[@id="company"]    Quality company
    Input Text    //*[@id="address1"]    Blv. Bajram Curri
    Input Text    //*[@id="address2"]    Str. Petro Nini Luarasi

    Mouse Down    //*[@id="country"]
    Select From List By Label    country    Israel
    Sleep    1
    Input Text    //*[@id="state"]    Albania
    Input Text    //*[@id="city"]    Saranda
    Input Text    //*[@id="zipcode"]    1017
    Input Text    //*[@id="mobile_number"]    +355695223507
Create account and verify it is created
    Press Keys    //*[@id="form"]/div/div/div/div[1]/form/button    Return
    Wait Until Element Contains    //*[@id="form"]/div/div/div/h2/b    ACCOUNT CREATED!
Verify your account is created
    Press Keys    //*[@id="form"]/div/div/div/div/a    Return
    Wait Until Element Contains    //*[@id="header"]/div/div/div/div[2]/div/ul/li[10]/a    Logged in as Liberta
Delete account
    Press Keys    //*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a    Return
    Wait Until Element Contains    //*[@id="form"]/div/div/div/h2/b    ACCOUNT DELETED!
    Sleep    1
Close Browser
    Close Browser