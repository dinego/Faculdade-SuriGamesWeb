<%-- 
    Document   : user
    Created on : 13/05/2015, 14:42:17
    Author     : binho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:if test="${empty sessionScope.login}" > 
            <jsp:forward page="/error.jsp" />
        </c:if>


        <form method="POST" action='UsuarioController' name="frmAddUser">
            <% String action = request.getParameter("action");%>
            <% if (action.equalsIgnoreCase("edit")) {%>
            User Name : <input type="text" name="nome"
                               value="<c:out value="${user.nome}" />" readonly="readonly"/> (You Can't Change this)<br /> 
            <%} else {%>
            User Name : <input type="text" name="nome"
                               value="<c:out value="${user.nome}" />" /> <br />
            <%}%>
            Password : <input
                type="password" name="senha"
                value="<c:out value="${user.senha}" />" /> <br /> 
            Email : <input
                type="text" name="email"
                value="<c:out value="${user.email}" />" /> <br /> 

            <% if (action.equalsIgnoreCase("edit")) {%>
            Registration : <input
                type="text" name="dob"
                value="<fmt:formatDate pattern="yyyy/MM/dd" value="${user.registrado}" />" readonly="readonly"/>(You Can't Change this)  <br />
            <%} else {%>
            Registration : <input
                type="text" name="dob"
                value="<fmt:formatDate pattern="yyyy/MM/dd" value="${user.registrado}" />" />(yyyy/MM/dd)  <br /> 
            <%}%>
            <input  type="submit" value="Submit" />
        </form>
    </body>
</html>
