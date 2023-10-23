
<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-13
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.prince.ai.model.Semester" %>
<%@ page import="com.prince.ai.service.SemesterService" %>
<%@ page import="com.prince.ai.service.implementaion.SemesterServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="semBean" class="com.prince.ai.bean.SemesterBean" scope="request" />
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
                <small>Manage Semesters</small>
            </div>
            <a href="dashboard.jsp" class="backBtn">Back</a>
        </div>

            <div class="semester">
                <div class="view">
                    <table>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Sem Name</th>
                            <th>StartDate</th>
                            <th>EndDate</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Semester> semesters = new ArrayList<>();
                            SemesterService service = new SemesterServiceImpl();
                            semesters = service.semesterList();

                            for(Semester sem : semesters){
                        %>
                        <tr>
                            <td><%=sem.getId()%></td>
                            <td><%=sem.getName()%></td>
                            <td><%=sem.getStartDate()%></td>
                            <td><%=sem.getEndDate()%></td>
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
                    <form action="../services/addSemester.jsp" method="post" id="form">
                        <small style="color: darkred;">${semBean.errorMessage}</small>
                        <small style="color: green;">${semBean.infoMessage}</small>
                        <input type="hidden" id="id" name="id" />
                        <div class="form-input">
                            <label for="semName">Semester Name</label>
                            <input type="text" name="semName" id="semName" required/>
                        </div>
                        <div class="form-input">
                            <label for="startDate">Start Date</label>
                            <input type="date" name="startDate" id="startDate" required/>
                        </div>
                        <div class="form-input">
                            <label for="endDate">End Date</label>
                            <input type="date" name="endDate" id="endDate" required/>
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
    const semIdInput = document.getElementById('id');
    const semNameInput = document.getElementById('semName');
    const startDateInput = document.getElementById('startDate');
    const endDateInput = document.getElementById('endDate');
    const formBtn = document.getElementById('formBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            semIdInput.value = cells[0].textContent;
            semNameInput.value = cells[1].textContent;
            startDateInput.value = cells[2].textContent;
            endDateInput.value = cells[3].textContent;
            formBtn.value = 'Update';
            formBtn.style.backgroundColor = '#2b9b58';
        });
    })

    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            semIdInput.value = cells[0].textContent;
            semNameInput.value = cells[1].textContent;
            startDateInput.value = cells[2].textContent;
            endDateInput.value = cells[3].textContent;
            formBtn.value = 'Delete';
            formBtn.style.backgroundColor = '#d13a3a';
        });
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.action = "../services/addSemester.jsp?action=" + formBtn.value;
        form.submit();
    });
</script>