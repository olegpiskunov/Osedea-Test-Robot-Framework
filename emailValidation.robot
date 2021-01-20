*** Settings ***
Resource    emailValidationKeywords.robot

Suite Teardown  Exit Selenium

*** Test Cases ***
Verify email validation
    Navigate To Home Page
    Home Page Should Be Open
    Scroll down to the Explore Our Culture button  
    Should click on the Explore Our Culture button    
    Team Culture Should Be Open
    Scroll down to the Contact us button 
    Should click on the Contact us button   
    Team Contact Should Be Open
    Should fill out all text boxes
    Negative test case email validation   
    Positive test case email validation    
    Submit Credentials
    
