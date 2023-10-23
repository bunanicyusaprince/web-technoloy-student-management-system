<%@ page import="com.prince.ai.model.StudentCourse" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.prince.ai.service.StudentCourseService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentCourseServiceImpl" %>
<%@ page import="com.prince.ai.model.StudentRegistration" %>
<%@ page import="com.prince.ai.service.StudentRegistrationService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentRegistrationServiceImpl" %>
<%@ page import="com.prince.ai.model.Course" %>
<%@ page import="com.prince.ai.service.CourseService" %>
<%@ page import="com.prince.ai.service.implementaion.CourseServiceImpl" %>
<jsp:useBean id="stCourseBean" class="com.prince.ai.bean.StudentCourseBean" scope="request" />
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
                <small>Manage Student Courses</small>
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
                            <th>Course Def</th>
                            <th>Credits</th>
                            <th>Results</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<StudentCourse> courses = new ArrayList<>();
                            StudentCourseService service = new StudentCourseServiceImpl();
                            courses = service.studentCourseList();

                            for(StudentCourse course : courses){
                        %>
                        <tr>
                            <td><%=course.getId()%></td>
                            <td><%=course.getStudentRegistration().getStudent().getRegNo()%></td>
                            <td>92129</td>
                            <td><%=course.getCredits()%></td>
                            <td><%=course.getResults()%></td>
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
                    <form action="../services/studentCourseCont.jsp" method="post" id="form">
                        <input type="hidden" id="id" name="id" />
                        <div class="form-input">
                            <label for="regNo">Select St Registration</label>
                            <select name="regNo" id="regNo">
                                <option>Select St Registration</option>
                                <%
                                    List<StudentRegistration> registrations = new ArrayList<>();
                                    StudentRegistrationService service1 = new StudentRegistrationServiceImpl();
                                    registrations = service1.registrationList();

                                    for(StudentRegistration reg: registrations){
                                %>
                                <option value="<%=reg.getId()%>"><%=reg.getStudent().getRegNo()+" "+reg.getRegistrationDate()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-input">
                            <label for="course">Select Course</label>
                            <select name="course" id="course">
                                <option>Select Course</option>
                                <%
                                    List<Course> courseList = new ArrayList<>();
                                    CourseService service2 = new CourseServiceImpl();
                                    courseList = service2.courseList();

                                    for(Course cr: courseList){
                                %>
                                <option value="<%=cr.getCourseDefinition().getId()%>"><%=cr.getCourseDefinition().getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-input">
                            <label for="credits">Enter Credits</label>
                            <input type="number" name="credits" id="credits" required/>
                        </div>
                        <div class="form-input">
                            <label for="results">Enter results</label>
                            <input type="text" name="results" id="results" required/>
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
    const scIdInput = document.getElementById('id');
    const stRegInput = document.getElementById('regNo');
    const semInput = document.getElementById('course');
    const creditInput = document.getElementById('credits');
    const resultInput = document.getElementById('results');
    const formBtn = document.getElementById('formBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            scIdInput.value = cells[0].textContent;
            stRegInput.value = cells[1].textContent;
            semInput.value = cells[2].textContent;
            creditInput.value = cells[3].textContent;
            formBtn.value = 'Update';
            formBtn.style.backgroundColor = '#2b9b58';
        });
    })

    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            scIdInput.value = cells[0].textContent;
            stRegInput.value = cells[1].textContent;
            semInput.value = cells[2].textContent;
            creditInput.value = cells[3].textContent;
            formBtn.value = 'Delete';
            formBtn.style.backgroundColor = '#d13a3a';
        });
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.action = "../services/studentCourseCont.jsp?action=" + formBtn.value;
        form.submit();
    });
</script>