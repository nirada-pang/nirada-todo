*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${WEB_URL}        https://abhigyank.github.io/To-Do-List/

*** Keywords ***
Open Browser To To-Do List Page
    Open Browser    ${WEB_URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    css=a[href='#add-item']

Add Task
    [Arguments]    ${task_name}
    Input Text    id=new-task    ${task_name}
    Log To Console  \n Add " ${task_name} "to To-Do List -- Completed ✅
    Click Button    css=.mdl-button--fab

Go To To-Do List
    Click Element    css=a[href='#todo']

Task Should Be Present Case 1
    [Arguments]    ${expected_text}  
    ${count} =    Evaluate    1
    FOR    ${index}    IN RANGE    1    4    # Loop from 1 to 3 (inclusive)
        ${actual_text}    Get Text    css=span#text-${index}.mdl-checkbox__label
        Should Be Equal    ${actual_text}    ${expected_text}
        ${count} =    Evaluate    ${count} + 1    
        ${expected_text} =    Set Variable    0${count}
    END

Task Should Be Present todo
    [Arguments]    ${expected_text}    ${index}
        ${actual_text}    Get Text    css=span#text-${index}.mdl-checkbox__label
        Should Be Equal    ${actual_text}    ${expected_text}
        Log To Console    \n${actual_text} have equal ${expected_text} !

Click Task Case Todo
    [Arguments]    ${expected_text}  
    ${count} =    Evaluate    1
    FOR    ${index}    IN RANGE    1    4    # Loop from 1 to 3 (inclusive)
        Click Element     css=span#text-1.mdl-checkbox__label
        ${count} =    Evaluate    ${count} + 1    
        Log To Console    \n Click Task " ${expected_text} " -- Completed ✅
        ${expected_text} =    Set Variable    0${count}
    END

Click Delete Task Case Todo
    FOR    ${index}    IN RANGE    1    4    # Loop from 1 to 3 (inclusive)
        Click Element     xpath=//button[@id='1']/span  
        Log To Console    \n Delete Task -- Completed ✅
    END

Go To completed
    Click Element    css=a[href='#completed']

Task Should Be Contains
    [Arguments]     ${expected_text}
    #${expected_text}   Evaluate  ${Param}
    FOR    ${index}    IN RANGE    1    4    # Loop from 1 to 3 (inclusive)
    ${element_label1}    Get Webelement    css=.mdl-list:nth-child(${index}) > .mdl-list__item-primary-content  #เก็บ element
    ${actual_text}    Get Text    ${element_label1}
    ${found} =  Evaluate    0
    ${notfound} =  Evaluate  0
    #{flag}    Should Contain    ${actual_text}    done${expected_text} 
    #Log To Console   ++++
    #log To Console  here
    Run Keyword If   "${actual_text}" == "done${expected_text}"    #Should Contain    ${actual_text}    done${expected_text}
    ...   Log To Console    \n💬 Record ${index}\n Verify ${actual_text} should contain " ${expected_text} " \n Passed ✅ In row ${index}
    ...       ELSE   Log To Console    \n💬 Record ${index}\n Verify ${actual_text} should not contain " ${expected_text} "
    END

click delete Task in Completed
    FOR    ${index}    IN RANGE    1    4    # Loop from 1 to 3 (inclusive)
        Click Element     xpath=//button[@id='1']  
        Log To Console    \n Delete Task -- Completed ✅
    END