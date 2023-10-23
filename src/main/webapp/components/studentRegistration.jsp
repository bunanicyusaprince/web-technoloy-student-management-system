<%@ page import="com.prince.ai.model.StudentRegistration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.prince.ai.service.StudentRegistrationService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentRegistrationServiceImpl" %>
<%@ page import="com.prince.ai.model.Student" %>
<%@ page import="com.prince.ai.service.StudentService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentServiceImpl" %>
<%@ page import="com.prince.ai.model.AcademicUnit" %>
<%@ page import="com.prince.ai.service.AcademicUnitService" %>
<%@ page import="com.prince.ai.service.implementaion.AcademicUnitServiceImpl" %>
<%@ page import="com.prince.ai.model.Semester" %>
<%@ page import="com.prince.ai.service.SemesterService" %>
<%@ page import="com.prince.ai.service.implementaion.SemesterServiceImpl" %>
<jsp:useBean id="studRegBean" class="com.prince.ai.bean.StudentRegistrationBean" scope="request" />
<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-13
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>WebTech-Dashboard</title>
    <link rel="stylesheet" href="../css/myStyles.css">
</head>
<body>

<section>
    <div class="container">
        <div class="header">
            <div class="head">
                <h2>Academic System</h2>
                <small>Manage Student Registration</small>
            </div>
            <a href="dashboard.jsp" class="backBtn">Back</a>
        </div>

            <div class="semester">
                <div class="view">
                    <table>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>RegNo</th>
                            <th>Sem Name</th>
                            <th>Unit</th>
                            <th>Registration Date</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<StudentRegistration> registrations = new ArrayList<>();
                            StudentRegistrationService service = new StudentRegistrationServiceImpl();
                            registrations = service.registrationList();

                            for(StudentRegistration reg : registrations){
                        %>
                        <tr>
                            <td><%=reg.getId()%></td>
                            <td><%=reg.getStudent().getRegNo()%></td>
                            <td><%=reg.getSemester().getName()%></td>
                            <td><%=reg.getUnit().getName()%></td>
                            <td><%=reg.getRegistrationDate()%></td>
                            <td>
                                <div class="tdAction">
                                    <button class="updateBtn">update</button>
                                    <button class="deleteBtn">delete</button>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <div class="actions">
                    <form action="../services/studRegistrationCont.jsp" method="post" id="form">
                        <input type="hidden" id="id" name="id" />
                        <div class="form-input">
                            <label for="student">Student</label>
                            <select name="regNo" id="student">
                            <option>Select Student</option>
                            <%
                                List<Student> students = new ArrayList<>();
                                StudentService service1 = new StudentServiceImpl();
                                students = service1.studentList();

                                for(Student student: students){
                            %>
                            <option value="<%=student.getRegNo()%>"><%=student.getRegNo() + " " + student.getFullNames()%></option>
                            <%
                                }
                            %>
                        </select>
                        </div>
                        <div class="form-input">
                            <label for="unit">Select Academic Unit</label>
                            <select name="unit" id="unit">
                                <option>Select Unit</option>
                                <%
                                    List<AcademicUnit> unitList = new ArrayList<>();
                                    AcademicUnitService service2 = new AcademicUnitServiceImpl();
                                    unitList = service2.unitList();

                                    for(AcademicUnit unit: unitList){
                                        if(unit.getUnit().name().equals("FACULTY")){
                                %>
                                <option value="<%=unit.getName()%>"><%=unit.getName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-input">
                            <label for="semester">Start Date</label>
                            <select name="semester" id="semester">
                                <option>Select Semester</option>
                                <%
                                    List<Semester> semesters = new ArrayList<>();
                                    SemesterService service3 = new SemesterServiceImpl();
                                    semesters = service3.semesterList();

                                    for(Semester semester: semesters){
                                %>
                                <option value="<%=semester.getName()%>"><%=semester.getName()+" "+semester.getStartDate()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-input">
                            <label for="regDate">Registration Date</label>
                            <input type="date" name="regDate" id="regDate" required/>
                        </div>
                        <input type="submit" id="formBtn" value="Submit" />
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>

<script defer>
    const form = document.getElementById("form");
    const updateButtons = document.querySelectorAll('.updateBtn');
    const deleteButtons = document.querySelectorAll('.deleteBtn');
    const srIdInput = document.getElementById('id');
    const stRegNoInput = document.getElementById('student');
    const unitInput = document.getElementById('unit');
    const semesterInput = document.getElementById('semester');
    const regDateInput = document.getElementById('regDate');
    const formBtn = document.getElementById('formBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            srIdInput.value = cells[0].textContent;
            stRegNoInput.value = cells[1].textContent;
            unitInput.value = cells[2].textContent;
            semesterInput.value = cells[3].textContent;
            regDateInput.value = cells[4].textContent;
            formBtn.value = 'Update';
            formBtn.style.backgroundColor = '#2b9b58';
        });
    })

    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            srIdInput.value = cells[0].textContent;
            stRegNoInput.value = cells[1].textContent;
            unitInput.value = cells[2].textContent;
            semesterInput.value = cells[3].textContent;
            regDateInput.value = cells[4].textContent;
            formBtn.value = 'Delete';
            formBtn.style.backgroundColor = '#d13a3a';
        });
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.action = "../services/studRegistrationCont.jsp?action=" + formBtn.value;
        form.submit();
    });
</script>