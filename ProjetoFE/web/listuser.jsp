<%-- 
    Document   : listuser
    Created on : 13/05/2015, 14:43:51
    Author     : binho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
//            if (request.getSession().getAttribute("login").equals("Logado")) {
//                    out.print("Logado");
//                }
        
        
        %>
        
        <c:if test="${empty sessionScope.login}" > 
             <jsp:forward page="/error.jsp" />
        </c:if>
            
            <p>${sessionScope.login}<p>
        
        <table border=1>
            <thead>
                <tr>
                    <th>Nome Usuario</th>
                    <th>Email</th>
                    <th>Data de Registro</th>
                    <th colspan=2>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td><c:out value="${user.nome}" /></td>
                        <td><c:out value="${user.email}" /></td>
                        <td><fmt:formatDate pattern="dd MMM,yyyy" value="${user.registrado}" /></td>
                        <td><a href="UsuarioController?action=edit&userId=<c:out value="${user.nome}"/>">Update</a></td>
                        <td><a href="UsuarioController?action=delete&userId=<c:out value="${user.nome}"/>">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p><a href="UsuarioController?action=insert">Add User</a></p>
    </body>
</html>
