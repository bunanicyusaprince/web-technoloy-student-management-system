<%@ page import="com.prince.ai.model.Teacher" %>
<%@ page import="com.prince.ai.service.TeacherService" %>
<%@ page import="com.prince.ai.service.implementaion.TeacherServiceImpl" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.prince.ai.model.EQualification" %>
<jsp:useBean id="semBean" class="com.prince.ai.bean.SemesterBean" scope="request" />

<%
    TeacherService service = new TeacherServiceImpl();
    Teacher teacher = new Teacher();

    String teacherName = request.getParameter("name");
    String qualification = request.getParameter("qualification");
    String type = request.getParameter("type");
    String action = request.getParameter("action");

    boolean isValid = false;

    if(teacherName.trim().isEmpty()){
        isValid = true;
        semBean.setErrorMessage("All fields are required");
    }else{
        int min = 10000; // Smallest 5-digit number
        int max = 99999; // Largest 5-digit number
        Random random = new Random();
        int randomCode = random.nextInt(max - min + 1) + min;

        teacher.setId(UUID.randomUUID());
        teacher.setCode(String.valueOf(randomCode));
        teacher.setName(teacherName);
        teacher.setType(type);
        teacher.setQualification(EQualification.valueOf(qualification));

        boolean feedback;
        if(action.equals("Update")){
            UUID id = UUID.fromString(request.getParameter("id"));
            teacher.setId(id);
            feedback = service.addTeacher(teacher);
        }else if(action.equals("Submit")){
            teacher.setId(UUID.randomUUID());
            feedback = service.addTeacher(teacher);
        }else{
            UUID id = UUID.fromString(request.getParameter("id"));
            teacher.setId(id);
            feedback = service.deleteTeacher(teacher);
        }

        if(feedback) {
            if(action.equals("Submit")) {
                semBean.setInfoMessage("Successfully inserted!");
            }else if(action.equals("Update")){
                semBean.setInfoMessage("Successfully updated!");
            }else{
                semBean.setInfoMessage("Successfully deleted!");
            }
            response.sendRedirect("../components/teachers.jsp");
        }else {
            semBean.setErrorMessage("Insert failed!");
            response.sendRedirect("../components/teachers.jsp");
        }
    }
%>