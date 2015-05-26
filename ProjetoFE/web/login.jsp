<%-- 
    Document   : listuser
    Created on : 13/05/2015, 14:43:51
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
        
        <c:if test="${!empty sessionScope.login}" > 
            <jsp:forward page="/UserController?action=listuser" />
        </c:if>

        <form action="Login" method="post">
            <div>
                <p><strong>username:</strong>
                    <input type="text" size="20" name="usuario"></p>

                <p><strong>password:</strong>
                    <input type="password" size="20" name="senha"></p>

                <p><input type="submit" value="submit" name="action"></p>
            </div>
        </form>
    </body>
</html>