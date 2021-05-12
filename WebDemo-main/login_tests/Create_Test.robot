*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid data
    Open Browser To Create Page
    Input Title     test
    Input Description    Testt
    Select Difficulty      1
    Select Language        1
    Submit class
    Success Page Should Be Open
    [Teardown]    Close Browser

Missing title
    Open Browser To Create Page
    Input Description    Testt
    Select Difficulty      1
    Select Language        1
    Submit class
    Error Page Should Be Open
    [Teardown]    Close Browser

Missing description
    Open Browser To Create Page
    Input Title     test
    Select Difficulty      1
    Select Language        1
    Submit class
    Error Page Should Be Open
    [Teardown]    Close Browser


Missing Difficulty
    Open Browser To Create Page
    Input Title     test
    Input Description    Testt
    Select Language        1
    Submit class
    Error Page Should Be Open
    [Teardown]    Close Browser

Missing Language
    Open Browser To Create Page
    Input Title     test
    Input Description    Testt
    Select Difficulty      1
    Submit class
    Error Page Should Be Open
    [Teardown]    Close Browser