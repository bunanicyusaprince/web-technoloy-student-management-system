<%@ page import="com.prince.ai.model.Semester" %>
<%@ page import="com.prince.ai.service.SemesterService" %>
<%@ page import="com.prince.ai.service.implementaion.SemesterServiceImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.UUID" %>
<jsp:useBean id="semBean" class="com.prince.ai.bean.SemesterBean" scope="request" />

<%
    SemesterService service = new SemesterServiceImpl();
    Semester semester = new Semester();

    String semName = request.getParameter("semName");
    LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
    LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
    String action = request.getParameter("action");

    boolean isValid = false;

    if(semName.trim().isEmpty()){
        isValid = true;
        semBean.setErrorMessage("All fields are required");
    }else{
        semester.setName(semName);
        semester.setStartDate(startDate);
        semester.setEndDate(endDate);
        boolean feedback;
        if(action.equals("Update")){
            UUID id = UUID.fromString(request.getParameter("id"));
            semester.setId(id);
            feedback = service.addSemester(semester);
        }else if(action.equals("Submit")){
            semester.setId(UUID.randomUUID());
            feedback = service.addSemester(semester);
        }else{
            UUID id = UUID.fromString(request.getParameter("id"));
            semester.setId(id);
            feedback = service.deleteSemester(semester);
        }

        if(feedback) {
            if(action.equals("Submit")) {
                semBean.setInfoMessage("Successfully inserted!");
            }else if(action.equals("Update")){
                semBean.setInfoMessage("Successfully updated!");
            }else{
                semBean.setInfoMessage("Successfully deleted!");
            }
//            request.getRequestDispatcher("../components/semester.jsp").forward(request, response);
            response.sendRedirect("../components/semester.jsp");
        }else {
            semBean.setErrorMessage("Insert failed!");
//            request.getRequestDispatcher("../components/semester.jsp").forward(request, response);
            response.sendRedirect("../components/semester.jsp");
        }
    }
%>