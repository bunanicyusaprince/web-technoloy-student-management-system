<%@ page import="com.prince.ai.service.StudentService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentServiceImpl" %>
<%@ page import="com.prince.ai.model.Student" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.time.LocalDate" %>
<jsp:useBean id="studBean" class="com.prince.ai.bean.StudentBean" scope="request" />

<%
    StudentService service = new StudentServiceImpl();
    Student student = new Student();

    String regNo = request.getParameter("regNo");
    String studentName = request.getParameter("name");
    LocalDate dob = LocalDate.parse(request.getParameter("dob"));
    String action = request.getParameter("action");

    boolean isValid = false;

    if(studentName.trim().isEmpty()){
        isValid = true;
        studBean.setErrorMessage("All fields are required");
    }else{

        student.setId(UUID.randomUUID());
        student.setRegNo(regNo);
        student.setFullNames(studentName);
        student.setDob(dob);

        boolean feedback;
        if(action.equals("Update")){
            UUID id = UUID.fromString(request.getParameter("id"));
            student.setId(id);
            feedback = service.insertStudent(student);
        }else if(action.equals("Submit")){
            student.setId(UUID.randomUUID());
            feedback = service.insertStudent(student);
        }else{
            UUID id = UUID.fromString(request.getParameter("id"));
            student.setId(id);
            feedback = service.deleteStudent(student);
        }

        if(feedback) {
            if(action.equals("Submit")) {
                studBean.setInfoMessage("Successfully inserted!");
            }else if(action.equals("Update")){
                studBean.setInfoMessage("Successfully updated!");
            }else{
                studBean.setInfoMessage("Successfully deleted!");
            }
            response.sendRedirect("../components/student.jsp");
        }else {
            studBean.setErrorMessage("Insert failed!");
            response.sendRedirect("../components/student.jsp");
        }
    }
%>