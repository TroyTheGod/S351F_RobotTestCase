*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${Class URL}      http://${SERVER}/createClass.html
${SUCCESS URL}    http://${SERVER}/classCreated.html
${ERROR URL}      http://${SERVER}/classCreationError.html

*** Keywords ***
Open Browser To Create Page
    Open Browser    ${Class URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Create Page Should Be Open

Create Page Should Be Open
    Title Should Be    Create class

Go To Create Page
    Go To    ${Class URL}
    Create Page Should Be Open

Input Title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Input Description
    [Arguments]    ${discription}
    Input Text    description_field    ${discription}

Select Difficulty
    [Arguments]    ${index}
    Select From List By Index    difficulty_field    ${index}

Select Language
    [Arguments]    ${index}
    Select From List By Index    language_field    ${index}

Submit class
    Click Button    submit_button

Success Page Should Be Open
    Location Should Be      ${SUCCESS URL}
    Title Should Be    Result Page

Error Page Should Be Open
    Location Should Be      ${ERROR URL}