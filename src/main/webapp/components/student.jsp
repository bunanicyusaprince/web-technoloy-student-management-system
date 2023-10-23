<%@ page import="com.prince.ai.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.prince.ai.service.StudentService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-18
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <small>Manage Students</small>
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
                            <th>Names</th>
                            <th>Date of Birth</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Student> students = new ArrayList<>();
                            StudentService service = new StudentServiceImpl();
                            students = service.studentList();

                            for(Student student : students){
                        %>
                        <tr>
                            <td><%=student.getId()%></td>
                            <td><%=student.getRegNo()%></td>
                            <td><%=student.getFullNames()%></td>
                            <td><%=student.getDob()%></td>
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
                    <form action="../services/studentCont.jsp" method="post" id="form">
                        <input type="hidden" id="id" name="id" />
                        <div class="form-input">
                            <label for="regNo">Student regNo</label>
                            <input type="text" name="regNo" id="regNo" required/>
                        </div>
                        <div class="form-input">
                            <label for="name">Student Names</label>
                            <input type="text" name="name" id="name" required/>
                        </div>
                        <div class="form-input">
                            <label for="dob">Student DOB</label>
                            <input type="date" name="dob" id="dob" required/>
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
    const studIdInput = document.getElementById('id');
    const studRegNoInput = document.getElementById('regNo')
    const nameInput = document.getElementById('name');
    const dobInput = document.getElementById('dob');
    const formBtn = document.getElementById('formBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            studIdInput.value = cells[0].textContent;
            studRegNoInput.value = cells[1].textContent;
            nameInput.value = cells[2].textContent;
            dobInput.value = cells[3].textContent;
            formBtn.value = 'Update';
            formBtn.style.backgroundColor = '#2b9b58';
        });
    })

    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            studIdInput.value = cells[0].textContent;
            studRegNoInput.value = cells[1].textContent;
            nameInput.value = cells[2].textContent;
            dobInput.value = cells[3].textContent;
            formBtn.value = 'Delete';
            formBtn.style.backgroundColor = '#d13a3a';
        });
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.action = "../services/studentCont.jsp?action=" + formBtn.value;
        form.submit();
    });
</script>
