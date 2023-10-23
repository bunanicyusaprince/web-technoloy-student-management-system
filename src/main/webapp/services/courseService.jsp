<%@ page import="com.prince.ai.model.Course" %>
<%@ page import="com.prince.ai.service.CourseService" %>
<%@ page import="com.prince.ai.service.implementaion.CourseServiceImpl" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.prince.ai.model.CourseDefinition" %>
<%@ page import="com.prince.ai.service.CourseDefinitionService" %>
<%@ page import="com.prince.ai.service.implementaion.CourseDefinitionServiceImpl" %>
<%@ page import="com.prince.ai.service.SemesterService" %>
<%@ page import="com.prince.ai.service.implementaion.SemesterServiceImpl" %>
<%@ page import="com.prince.ai.model.Semester" %>
<%@ page import="com.prince.ai.service.TeacherService" %>
<%@ page import="com.prince.ai.service.implementaion.TeacherServiceImpl" %>
<%@ page import="com.prince.ai.model.Teacher" %>
<jsp:useBean id="courseBean" class="com.prince.ai.bean.CourseBean" scope="request" />

<%
    CourseService service = new CourseServiceImpl();
    Course course = new Course();

    String courseDefinition = request.getParameter("course");
    String semesterInput = request.getParameter("semester");
    String teacherInput = request.getParameter("teacher");
    String action = request.getParameter("action");

    boolean isValid = false;

    if (courseDefinition.trim().isEmpty() || semesterInput.trim().isEmpty() || teacherInput.trim().isEmpty()) {
        isValid = true;
        courseBean.setErrorMessage("All fields are required");
    } else {
        CourseDefinitionService service1 = new CourseDefinitionServiceImpl();
        CourseDefinition definition = service1.findUnitByName(courseDefinition);

        SemesterService service2 = new SemesterServiceImpl();
        Semester semester = service2.findSemesterByName(semesterInput);

        TeacherService service3 = new TeacherServiceImpl();
        Teacher teacher = service3.findTeacherByName(teacherInput);

        course.setCourseDefinition(definition);
        course.setSemester(semester);
        course.setTeacher(teacher);

        boolean feedback;
        if (action.equals("Update")) {
            UUID id = UUID.fromString(request.getParameter("id"));
            course.setId(id);
            feedback = service.insertCourse(course);
        } else if (action.equals("Submit")) {
            course.setId(UUID.randomUUID());
            feedback = service.insertCourse(course);
        } else {
            UUID id = UUID.fromString(request.getParameter("id"));
            course.setId(id);
            feedback = service.deleteCourse(course);
        }

        if (feedback) {
            if (action.equals("Submit")) {
                courseBean.setInfoMessage("Successfully inserted!");
            } else if (action.equals("Update")) {
                courseBean.setInfoMessage("Successfully updated!");
            } else {
                courseBean.setInfoMessage("Successfully deleted!");
            }
            response.sendRedirect("../components/courseMain.jsp");
        } else {
            courseBean.setErrorMessage("Insert failed!");
            response.sendRedirect("../components/courseMain.jsp");
        }
    }
%>