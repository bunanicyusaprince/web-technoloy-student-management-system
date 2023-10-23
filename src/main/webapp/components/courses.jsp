<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-13
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.prince.ai.model.CourseDefinition" %>
<%@ page import="com.prince.ai.service.CourseDefinitionService" %>
<%@ page import="com.prince.ai.service.implementaion.CourseDefinitionServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="definitionBean" class="com.prince.ai.bean.CourseDefinitionBean" scope="request" />
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
                <small>Manage Course Definitions</small>
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
                            <th>Description</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<CourseDefinition> courses = new ArrayList<>();
                            CourseDefinitionService service = new CourseDefinitionServiceImpl();
                            courses = service.courseDefinitionList();

                            for(CourseDefinition crs : courses){
                        %>
                        <tr>
                            <td><%=crs.getId()%></td>
                            <td><%=crs.getCode()%></td>
                            <td><%=crs.getName()%></td>
                            <td><%=crs.getDescription()%></td>
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
                    <form action="../services/addCourse.jsp" method="post" id="form">
                        <input type="hidden" id="id" name="id" />
                        <div class="form-input">
                            <label for="name">Course Name</label>
                            <input type="text" name="name" id="name" required/>
                        </div>
                        <div class="form-input">
                            <label for="description">Course Description</label>
                            <textarea name="description" id="description" rows="4"></textarea>
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
    const nameInput = document.getElementById('name');
    const descriptionInput = document.getElementById('description');
    const formBtn = document.getElementById('formBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            courseIdInput.value = cells[0].textContent;
            nameInput.value = cells[2].textContent;
            descriptionInput.value = cells[3].textContent;
            formBtn.value = 'Update';
            formBtn.style.backgroundColor = '#2b9b58';
        });
    })

    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            courseIdInput.value = cells[0].textContent;
            nameInput.value = cells[2].textContent;
            descriptionInput.value = cells[3].textContent;
            formBtn.value = 'Delete';
            formBtn.style.backgroundColor = '#d13a3a';
        });
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.action = "../services/addCourse.jsp?action=" + formBtn.value;
        form.submit();
    });
</script>
