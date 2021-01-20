*** Settings ***
Library  OperatingSystem
Library  SeleniumLibrary

*** Variables ***
${Browser}         Chrome
${SiteUrl}         https://www.osedea.com/
${Delay}           5s
${Email Text}      Email
${Text Message}    Questions, comments, coffee invitations — we’d love to hear from you. Send us a note and we’ll get back to you ASAP.
${Submit Message}  Your message is on its way!
${Test}            Test
${Contact Title}   Contact
${Contact us button}    css:button.styles__Button-sc-2hgbho-0
${id=firstName}    id=firstName
${id=email}    id=email

*** Keywords ***
Configure Selenium
     Set Selenium Speed    .25 Seconds

Navigate To Home Page
    Open Browser  ${SiteUrl}  ${Browser}
    Maximize Browser Window
    Set Browser Implicit Wait    ${Delay}  

Home Page Should Be Open
    Wait Until Page Contains   Custom software development company
    Title Should Be   Custom software development company      

Scroll down to the Explore Our Culture button
    Execute JavaScript    window.scrollTo(2670,2100)    

Should click on the Explore Our Culture button    
    Wait Until Element Is Visible   css:span.styles__LinkText-f5qq3r-1    1
    Click Element  css:span.styles__LinkText-f5qq3r-1 

Team Culture Should Be Open
    Wait Until Page Contains   Culture    2
    Title Should Be   Custom software development company

Scroll down to the Contact us button 
    Execute JavaScript    window.scrollTo(900,900)      
    Sleep   2

Should click on the Contact us button   
    Wait Until Element Is Visible   ${Contact us button}    
    Click Element  ${Contact us button} 

Team Contact Should Be Open
    Wait Until Page Contains   ${Contact Title}    2
    Title Should Be   Software team culture
    Sleep   2       

Should fill out all text boxes
    Title Should Be   ${Contact Title} us    

Negative test case email validation   
    Wait Until Element Is Visible   ${id=firstName}    
    Input Text   ${id=firstName}    ${Test}
    Input Text   id=lastName    ${Test}
    Input Text   id=subject    ${Test}
    Input Text   ${id=email}    ${Test}
    Click Element  css=[id="note"]
    Element Text Should Be    //*[@data-errormessage='Please enter a valid email address.']    ${Email Text}     
    Clear Element Text   ${id=email}

Positive test case email validation   
    Input Text   ${id=email}    test@test.com
    Input Text   id=note    ${Test}
    Click Element  ${Contact us button}

Submit Credentials
    Wait Until Page Contains   ${Contact Title}    2
    Element Text Should Be    css:.common__HeadingTwo-sc-1bugy2q-7   ${Text Message}
    Element Text Should Be    css:.common__HeadingThree-sc-1bugy2q-8   ${Submit Message}
    Click Element  ${Contact us button} 
    Sleep   2
    Wait Until Element Is Visible   ${id=firstName}   

Exit Selenium
    #Capture Page Screenshot
    Close Browser
    

