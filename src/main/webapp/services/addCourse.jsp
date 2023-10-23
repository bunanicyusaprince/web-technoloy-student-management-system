<%@ page import="com.prince.ai.model.CourseDefinition" %>
<%@ page import="com.prince.ai.service.CourseDefinitionService" %>
<%@ page import="com.prince.ai.service.implementaion.CourseDefinitionServiceImpl" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.Random" %>
<jsp:useBean id="definitionBean" class="com.prince.ai.bean.CourseDefinitionBean" scope="request" />

<%
    CourseDefinitionService service = new CourseDefinitionServiceImpl();
    CourseDefinition definition = new CourseDefinition();

    String courseName = request.getParameter("name");
    String description = request.getParameter("description");
    String action = request.getParameter("action");

    boolean isValid = false;

    if(courseName.trim().isEmpty()){
        isValid = true;
        definitionBean.setErrorMessage("All fields are required");
    }else{
        int min = 10000; // Smallest 5-digit number
        int max = 99999; // Largest 5-digit number
        Random random = new Random();
        int randomCode = random.nextInt(max - min + 1) + min;

        definition.setId(UUID.randomUUID());
        definition.setCode(String.valueOf(randomCode));
        definition.setName(courseName);
        definition.setDescription(description);

        boolean feedback;
        if(action.equals("Update")){
            UUID id = UUID.fromString(request.getParameter("id"));
            definition.setId(id);
            feedback = service.addCourseDefinition(definition);
        }else if(action.equals("Submit")){
            definition.setId(UUID.randomUUID());
            feedback = service.addCourseDefinition(definition);
        }else{
            UUID id = UUID.fromString(request.getParameter("id"));
            definition.setId(id);
            feedback = service.deleteDefinition(definition);
        }

        if(feedback) {
            if(action.equals("Submit")) {
                definitionBean.setInfoMessage("Successfully inserted!");
            }else if(action.equals("Update")){
                definitionBean.setInfoMessage("Successfully updated!");
            }else{
                definitionBean.setInfoMessage("Successfully deleted!");
            }
            response.sendRedirect("../components/courses.jsp");
        }else {
            definitionBean.setErrorMessage("Insert failed!");
            response.sendRedirect("../components/courses.jsp");
        }
    }
%>