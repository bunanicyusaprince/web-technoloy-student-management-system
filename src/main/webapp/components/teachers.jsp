<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-13
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.prince.ai.model.Teacher" %>
<%@ page import="com.prince.ai.service.TeacherService" %>
<%@ page import="com.prince.ai.service.implementaion.TeacherServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="teacherBean" class="com.prince.ai.bean.TeacherBean" scope="request" />
<html>
<head>
    <title>WebTech-Teacher</title>
    <link rel="stylesheet" href="../css/myStyles.css">
</head>
<body>

<section>
    <div class="container">
        <div class="header">
            <div class="head">
                <h2>Academic System</h2>
                <small>Manage Teachers</small>
            </div>
            <a href="dashboard.jsp" class="backBtn">Back</a>
        </div>

            <div class="semester">
                <div class="view">
                    <table>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Code</th>
                            <th>Names</th>
                            <th>Qualification</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Teacher> teachers = new ArrayList<>();
                            TeacherService service = new TeacherServiceImpl();
                            teachers = service.teacherList();

                            for(Teacher teacher : teachers){
                        %>
                        <tr>
                            <td><%=teacher.getId()%></td>
                            <td><%=teacher.getCode()%></td>
                            <td><%=teacher.getName()%></td>
                            <td><%=teacher.getQualification()%></td>
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
                    <form action="../services/addTeacher.jsp" method="post" id="form">
                        <input type="hidden" id="id" name="id" />
                        <div class="form-input">
                            <label for="name">Teacher Names</label>
                            <input type="text" name="name" id="name" required/>
                        </div>
                        <div class="form-input">
                            <label for="qualification">Qualification</label>
                            <select name="qualification" id="qualification">
                                <option>Select Qualification</option>
                                <option value="MASTER">MASTER</option>
                                <option value="PHD">PHD</option>
                                <option value="PROFESSOR">PROFESSOR</option>
                            </select>
                        </div>
                        <div class="form-input">
                            <label for="type">Type</label>
                            <select name="type" id="type">
                                <option>Select type</option>
                                <option value="Tutor">Tutor</option>
                                <option value="AssistantTutor">Assistant Tutor</option>
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
    const teacherIdInput = document.getElementById('id');
    const nameInput = document.getElementById('name');
    const qualificationInput = document.getElementById('qualification');
    const formBtn = document.getElementById('formBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            teacherIdInput.value = cells[0].textContent;
            nameInput.value = cells[2].textContent;
            qualificationInput.value = cells[3].textContent;
            formBtn.value = 'Update';
            formBtn.style.backgroundColor = '#2b9b58';
        });
    })

    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            teacherIdInput.value = cells[0].textContent;
            nameInput.value = cells[2].textContent;
            qualificationInput.value = cells[3].textContent;
            formBtn.value = 'Delete';
            formBtn.style.backgroundColor = '#d13a3a';
        });
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.action = "../services/addTeacher.jsp?action=" + formBtn.value;
        form.submit();
    });
</script>
