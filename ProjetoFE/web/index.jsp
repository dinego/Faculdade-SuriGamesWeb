<%-- 
    Document   : index
    Created on : 27/05/2015, 20:07:21
    Author     : fpereira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/signin.css" rel="stylesheet">
         <title>Surigames - Sistema de Locação de Jogos</title>
    </head>
      <body>

    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">SurigamesWEB</h2>
        <label for="inputEmail" name="email" class="sr-only">Email</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Insira seu Email" required autofocus>
        <label for="inputPassword" name="email" class="sr-only">Senha</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Insira sua Senha" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Mantenha-me conectado
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->


  </body>
</html>
