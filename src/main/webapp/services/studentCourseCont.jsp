<%@ page import="com.prince.ai.service.StudentCourseService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentCourseServiceImpl" %>
<%@ page import="com.prince.ai.model.StudentCourse" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.prince.ai.service.CourseService" %>
<%@ page import="com.prince.ai.service.implementaion.CourseServiceImpl" %>
<%@ page import="com.prince.ai.model.Course" %>
<%@ page import="com.prince.ai.service.StudentRegistrationService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentRegistrationServiceImpl" %>
<%@ page import="com.prince.ai.model.StudentRegistration" %>
<jsp:useBean id="stCourseBean" class="com.prince.ai.bean.StudentCourseBean" scope="request" />

<%
    StudentCourseService service = new StudentCourseServiceImpl();
    StudentCourse course = new StudentCourse();

    UUID regNo = UUID.fromString(request.getParameter("regNo"));
    UUID courseInput = UUID.fromString(request.getParameter("course"));
    Integer credits = Integer.parseInt(request.getParameter("credits"));
    String results = request.getParameter("results");
    String action = request.getParameter("action");

    boolean isValid = false;

    if(results.trim().isEmpty()){
        isValid = true;
        stCourseBean.setErrorMessage("All fields are required");
    }else{
        CourseService service1 = new CourseServiceImpl();
        Course course1 = service1.courseById(courseInput);

        StudentRegistrationService service2 = new StudentRegistrationServiceImpl();
        StudentRegistration registration = service2.studRegistrationById(regNo);

        course.setId(UUID.randomUUID());
        course.setCourse(course1);
        course.setCredits(credits);
        course.setResults(results);
        course.setStudentRegistration(registration);

        boolean feedback;
        if(action.equals("Update")){
            UUID id = UUID.fromString(request.getParameter("id"));
            course.setId(id);
            feedback = service.insertStudentCourse(course);
        }else if(action.equals("Submit")){
            course.setId(UUID.randomUUID());
            feedback = service.insertStudentCourse(course);
        }else{
            UUID id = UUID.fromString(request.getParameter("id"));
            course.setId(id);
            feedback = service.deleteStudentCourse(course);
        }

        if(feedback) {
            if(action.equals("Submit")) {
                stCourseBean.setInfoMessage("Successfully inserted!");
            }else if(action.equals("Update")){
                stCourseBean.setInfoMessage("Successfully updated!");
            }else{
                stCourseBean.setInfoMessage("Successfully deleted!");
            }
            response.sendRedirect("../components/studentCourse.jsp");
        }else {
            stCourseBean.setErrorMessage("Insert failed!");
            response.sendRedirect("../components/studentCourse.jsp");
        }
    }
%>