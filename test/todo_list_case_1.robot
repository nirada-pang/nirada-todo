*** Settings ***
Resource           ../todo_list_resources.robot

Suite Setup        Open Browser To To-Do List Page
Suite Teardown     Close All Browsers

*** Test Cases ***
Test Add New Task
    [Documentation]     ทดสอบการเพิ่ม todo ใหม่ในรายการ แบบตัวเลข 🔔
    Add Task   01
    Add Task   02
    Add Task   03  
   
Test To-Do List
    [Documentation]    ทดสอบการเปลี่ยน Tab🔔
   # [Documentation]    คือข้อความที่อยู่ในช่องที่มีงาน
    Go To To-Do List

Verify Task Should Be Present Case 1
    [Documentation]    ค่าที่กรอกเท่ากับที่เพิ่ม 🔔    
    Task Should Be Present Case 1    01
     

Verify click Task Case 1
    [Documentation]    ทดสอบการส่งค่าไปหน้า completed 🔔
    Click Task Case Todo    01
    Go To completed

Verify Task should be Completed Case 1
    [Documentation]    งานเสร็จสมบูรณ์แล้ว 🔔
    Task Should Be Contains    01
    Task Should Be Contains    02
    Task Should Be Contains    03

End process
    [Documentation]    ⭐️ Test Completed ⭐️
    Close All Browsers