<%@ page import="com.prince.ai.service.StudentRegistrationService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentRegistrationServiceImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.prince.ai.service.StudentService" %>
<%@ page import="com.prince.ai.service.implementaion.StudentServiceImpl" %>
<%@ page import="com.prince.ai.service.SemesterService" %>
<%@ page import="com.prince.ai.service.implementaion.SemesterServiceImpl" %>
<%@ page import="rw.yoramu.acm.model.*" %>
<%@ page import="com.prince.ai.service.AcademicUnitService" %>
<%@ page import="com.prince.ai.service.implementaion.AcademicUnitServiceImpl" %>
<%@ page import="rw.ange.sms.model.*" %>
<%@ page import="com.prince.ai.model.*" %>
<jsp:useBean id="studRegBean" class="com.prince.ai.bean.StudentRegistrationBean" scope="request" />

<%
    StudentRegistrationService service = new StudentRegistrationServiceImpl();
    StudentRegistration registration = new StudentRegistration();

    String regNo = request.getParameter("regNo");
    String unit = request.getParameter("unit");
    String semesterInput = request.getParameter("semester");
    LocalDate regDate = LocalDate.parse(request.getParameter("regDate"));
    String action = request.getParameter("action");

    boolean isValid = false;

    if(regNo.trim().isEmpty()){
        isValid = true;
        studRegBean.setErrorMessage("All fields are required");
    }else{

        StudentService service1 = new StudentServiceImpl();
        Student student = service1.findStudentByRegNo(regNo);

        SemesterService service2 = new SemesterServiceImpl();
        Semester semester = service2.findSemesterByName(semesterInput);

        AcademicUnitService service3 = new AcademicUnitServiceImpl();
        AcademicUnit unit1 = service3.findUnitByName(unit);

        registration.setId(UUID.randomUUID());
        registration.setStudent(student);
        registration.setRegistrationDate(regDate);
        registration.setSemester(semester);
        registration.setUnit(unit1);
        registration.setStatus(ERegistrationStatus.PENDING);

        boolean feedback;
        if(action.equals("Update")){
            UUID id = UUID.fromString(request.getParameter("id"));
            registration.setId(id);
            feedback = service.createStudentRegistration(registration);
        }else if(action.equals("Submit")){
            registration.setId(UUID.randomUUID());
            feedback = service.createStudentRegistration(registration);
        }else{
            UUID id = UUID.fromString(request.getParameter("id"));
            registration.setId(id);
            feedback = service.deleteStudentRegistration(registration);
        }

        if(feedback) {
            if(action.equals("Submit")) {
                studRegBean.setInfoMessage("Successfully inserted!");
            }else if(action.equals("Update")){
                studRegBean.setInfoMessage("Successfully updated!");
            }else{
                studRegBean.setInfoMessage("Successfully deleted!");
            }
            response.sendRedirect("../components/studentRegistration.jsp");
        }else {
            studRegBean.setErrorMessage("Insert failed!");
            response.sendRedirect("../components/studentRegistration.jsp");
        }
    }
%>