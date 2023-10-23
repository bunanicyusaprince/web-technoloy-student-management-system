<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-15
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.prince.ai.model.Semester" %>
<%@ page import="com.prince.ai.service.SemesterService" %>
<%@ page import="com.prince.ai.service.implementaion.SemesterServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.prince.ai.service.CourseDefinitionService" %>
<%@ page import="com.prince.ai.service.implementaion.CourseDefinitionServiceImpl" %>
<%@ page import="com.prince.ai.model.CourseDefinition" %>
<%@ page import="com.prince.ai.model.Teacher" %>
<%@ page import="com.prince.ai.service.TeacherService" %>
<%@ page import="com.prince.ai.service.implementaion.TeacherServiceImpl" %>
<%@ page import="com.prince.ai.model.Course" %>
<%@ page import="com.prince.ai.service.CourseService" %>
<%@ page import="com.prince.ai.service.implementaion.CourseServiceImpl" %>
<jsp:useBean id="semBean" class="com.prince.ai.bean.SemesterBean" scope="request" />
<html>
<head>
    <title>WebTech-Dashboard</title>
    <link rel="stylesheet" href="../css/myStyles.css" />
</head>
<body>

<section>
    <div class="container">
        <div class="header">
            <div class="head">
                <h2>Academic System</h2>
                <small>Manage Courses</small>
            </div>
            <a href="dashboard.jsp" class="backBtn">Back</a>
        </div>


            <div class="semester">
                <div class="view">
                    <table>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Course Name</th>
                            <th>Semester</th>
                            <th>Teacher</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Course> courses = new ArrayList<>();
                            CourseService service = new CourseServiceImpl();
                            courses = service.courseList();

                            for(Course course : courses){
                        %>
                        <tr>
                            <td><%=course.getId()%></td>
                            <td><%=course.getCourseDefinition().getName()%></td>
                            <td><%=course.getSemester().getName()%></td>
                            <td><%=course.getTeacher().getName()%></td>
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
                    <form action="../services/courseService.jsp" method="post" id="form">
                        <input type="hidden" id="id" name="id" />
                        <div class="form-input">
                            <label for="course">Course Definition</label>
                            <select name="course" id="course">
                                <option>Select Course</option>
                                <%
                                    List<CourseDefinition> definitions = new ArrayList<>();
                                    CourseDefinitionService service1 = new CourseDefinitionServiceImpl();
                                    definitions = service1.courseDefinitionList();

                                    for(CourseDefinition definition: definitions){
                                %>
                                <option value="<%=definition.getName()%>"><%=definition.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-input">
                            <label for="semester">Semester</label>
                            <select name="semester" id="semester">
                                <option>Select Semester</option>
                                <%
                                    List<Semester> semesters = new ArrayList<>();
                                    SemesterService service2 = new SemesterServiceImpl();
                                    semesters = service2.semesterList();

                                    for(Semester semester: semesters){
                                %>
                                <option value="<%=semester.getName()%>"><%=semester.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-input">
                            <label for="teacher">Teacher</label>
                            <select name="teacher" id="teacher">
                                <option>Select Teacher</option>
                                <%
                                    List<Teacher> teachers = new ArrayList<>();
                                    TeacherService service3 = new TeacherServiceImpl();
                                    teachers = service3.teacherList();

                                    for(Teacher teacher: teachers){
                                %>
                                <option value="<%=teacher.getName()%>"><%=teacher.getName()+" - "+teacher.getType()%></option>
                                <%
                                    }
                                %>
                            </select>
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
    const courseIdInput = document.getElementById('id');
    const courseNameInput = document.getElementById('semName');
    const semesterInput = document.getElementById('startDate');
    const teacherInput = document.getElementById('endDate');
    const formBtn = document.getElementById('formBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            courseIdInput.value = cells[0].textContent;
            courseNameInput.value = cells[1].textContent;
            semesterInput.value = cells[2].textContent;
            teacherInput.value = cells[3].textContent;
            formBtn.value = 'Update';
            formBtn.style.backgroundColor = '#2b9b58';
        });
    })

    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            courseIdInput.value = cells[0].textContent;
            courseNameInput.value = cells[1].textContent;
            semesterInput.value = cells[2].textContent;
            teacherInput.value = cells[3].textContent;
            formBtn.value = 'Delete';
            formBtn.style.backgroundColor = '#d13a3a';
        });
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.action = "../services/courseService.jsp?action=" + formBtn.value;
        form.submit();
    });
</script>