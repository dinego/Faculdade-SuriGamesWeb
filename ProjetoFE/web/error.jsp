<%-- 
    Document   : index
    Created on : 13/05/2015, 14:41:30
    Author     : binho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div>

            <p >Invalid username or password.</p>

            <p>Return to <strong><a href="<c:url value='login.jsp'/>">Login form</a></strong>.</p>

        </div>
    </body>
</html>