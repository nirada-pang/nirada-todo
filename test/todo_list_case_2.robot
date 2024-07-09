*** Settings ***
Resource           ../todo_list_resources.robot

Suite Setup        Open Browser To To-Do List Page
Suite Teardown     Close All Browsers

*** Test Cases ***
Test Add New Task
    [Documentation]    ทดสอบการ delete หน้า todo 🔔
    Add Task   01
    Add Task   02
    Add Task   03  
   
Test To-Do List
    [Documentation]    ทดสอบการเปลี่ยน Tab🔔
    Go To To-Do List

Verify Task Should Be Present Case 2
    [Documentation]    ค่าที่กรอกเท่ากับที่เพิ่ม 🔔    
    Task Should Be Present Case 1    01
     

Verify click delete Task Case 2
    [Documentation]    ทดสอบการ delete หน้า todo 🔔
    Click Delete Task Case Todo  
    Go To completed
