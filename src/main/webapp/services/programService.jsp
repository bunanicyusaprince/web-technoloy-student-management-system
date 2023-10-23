<%@ page import="com.prince.ai.model.AcademicUnit" %>
<%@ page import="com.prince.ai.service.AcademicUnitService" %>
<%@ page import="com.prince.ai.service.implementaion.AcademicUnitServiceImpl" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.prince.ai.model.EAcademicUnit" %>
<jsp:useBean id="unitBean" class="com.prince.ai.bean.AcademicUnitBean" scope="request" />

<%
    AcademicUnitService unitService = new AcademicUnitServiceImpl();
    AcademicUnit unit = new AcademicUnit();

    String unitName = request.getParameter("programme");

    if(unitName.trim().isEmpty()){
        unitBean.setErrorMessage("All fields are required!");
    }else{
        int min = 10000; // Smallest 5-digit number
        int max = 99999; // Largest 5-digit number
        Random random = new Random();
        int randomCode = random.nextInt(max - min + 1) + min;

        unit.setId(UUID.randomUUID());
        unit.setCode(String.valueOf(randomCode));
        unit.setName(unitName);
        unit.setUnit(EAcademicUnit.PROGRAMME);

        boolean feedback = unitService.insertUnit(unit);

        if(feedback) {
            unitBean.setInfoMessage("Successfully inserted!");
            response.sendRedirect("../components/academicUnit.jsp");
        }else {
            unitBean.setErrorMessage("Insert failed!");
            response.sendRedirect("../components/academicUnit.jsp");
        }
    }
%>
