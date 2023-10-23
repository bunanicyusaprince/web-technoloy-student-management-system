<%@ page import="com.prince.ai.service.AcademicUnitService" %>
<%@ page import="com.prince.ai.service.implementaion.AcademicUnitServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.prince.ai.model.AcademicUnit" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="unitBean" class="com.prince.ai.bean.AcademicUnitBean" scope="request" />
<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-14
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebTech-Unit</title>
    <link rel="stylesheet" href="../css/myStyles.css">
</head>
<body>

    <section>
        <div class="container">
            <div class="header">
                <div class="head">
                <h2>Academic System</h2>
                <small>Manage Academic units</small>
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
                            <th>Name</th>
                            <th>Category</th>
                            <th>Unit</th>
<%--                            <th></th>--%>
                        </tr>
                        </thead>
                        <tbody>

                        <%
                            List<AcademicUnit> unitList= new ArrayList<>();
                            AcademicUnitService unitService = new AcademicUnitServiceImpl();
                            unitList = unitService.unitList();

                            for(AcademicUnit units: unitList){
                                AcademicUnit parent = null;
                        %>
                        <tr>
                            <td><%=units.getId()%></td>
                            <td><%=units.getCode()%></td>
                            <td><%=units.getName()%></td>
                            <td><%=units.getUnit()%></td>
                            <%
                                if(units.getParent() != null){
                                    parent = units.getParent();
                            %>
                            <td><%=parent.getName()%></td>
                            <%} else { %>
                            <td>main</td>
                            <%}%>
<%--                            <td>--%>
<%--                                <div class="tdAction">--%>
<%--                                    <button class="updateBtn">?</button>--%>
<%--                                    <button class="deleteBtn">x</button>--%>
<%--                                </div>--%>
<%--                            </td>--%>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <div class="actions">
                    <div class="tabs">
                        <div class="radio-selector">
                            <input type="radio" id="pro" name="radio-group" />
                            <label for="pro">Programme</label>
                        </div>
                        <div class="radio-selector">
                            <input type="radio" id="fac" name="radio-group" />
                            <label for="fac">Faculty</label>
                        </div>
                        <div class="radio-selector">
                            <input type="radio" id="dep" name="radio-group" />
                            <label for="dep">Department</label>
                        </div>
                    </div>
                    <div  class="data" id="pro-data">
                        <div class="hd">
                            <h3>Add Programme</h3>
                        </div>
                        <form action="../services/programService.jsp" method="post">
                            <small class="msg" style="color: darkred;">${unitBean.errorMessage}</small>
                            <small class="msg" style="color: green;">${unitBean.infoMessage}</small>
                            <div class="form-input">
                                <label for="programme">Programme Name</label>
                                <input type="text" name="programme" id="programme" />
                            </div>
                            <button type="submit">Submit</button>
                        </form>
                    </div>

                    <div class="data" id="fac-data" style="display: none">
                        <div class="hd">
                            <h3>Add Faculty</h3>
                        </div>
                        <form action="../services/facultyService.jsp" method="post">
                            <small class="msg" style="color: darkred;">${unitBean.errorMessage}</small>
                            <small class="msg" style="color: green;">${unitBean.infoMessage}</small>
                            <div class="form-input">
                                <label for="programme2">Choose Programme</label>
                                <select name="programme" id="programme2">
                                    <option>Select Programme</option>
                                    <%
                                        for(AcademicUnit units: unitList){
                                            if(units.getUnit().name().equals("PROGRAMME")){
                                    %>
                                    <option value="<%=units.getName()%>"><%=units.getName()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-input">
                                <label for="faculty">Faculty Name</label>
                                <input type="text" name="faculty" id="faculty" />
                            </div>
                            <button type="submit">Submit</button>
                        </form>
                    </div>

                    <div class="data" id="dep-data" style="display: none">
                        <div class="hd">
                            <h3>Add Department</h3>
                        </div>
                        <form action="../services/departmentService.jsp" method="post">
                            <small class="msg" style="color: darkred;">${unitBean.errorMessage}</small>
                            <small class="msg" style="color: green;">${unitBean.infoMessage}</small>
                            <div class="form-input">
                                <label for="faculty1">Choose Faculty</label>
                                <select name="faculty" id="faculty1">
                                    <option>Select Faculty</option>
                                    <%
                                        for(AcademicUnit units: unitList){
                                            if(units.getUnit().name().equals("FACULTY")){
                                    %>
                                    <option value="<%=units.getName()%>"><%=units.getName()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-input">
                                <label for="department">Department Name</label>
                                <input type="text" name="department" id="department" />
                            </div>
                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>

<script defer>
    const messages = document.querySelectorAll(".msg");
    messages.forEach((small) => {
        if(small.textContent.trim() === ''){
            small.style.display = 'none';
        }
    });


    // Get references to the radio buttons and data containers
    const radioButtons = document.querySelectorAll('input[name="radio-group"]');
    const dataContainers = document.querySelectorAll(".data");

    // Add an event listener to each radio button
    radioButtons.forEach((radioButton) => {
        radioButton.addEventListener("change", (event) => {
            // Hide all data containers
            dataContainers.forEach((container) => {
                container.style.display = "none";
            });

            // Show the related data container for the selected radio button
            if (event.target.checked) {
                const relatedDataContainer = document.getElementById(
                    event.target.id +"-data"
                );
                if (relatedDataContainer) {
                    relatedDataContainer.style.display = "block";
                }
            }
        });
    });

    const preCheckedRadioButton = document.querySelector('input[name="radio-group"]:checked');
</script>