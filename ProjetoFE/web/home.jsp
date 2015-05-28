<%-- 
    Document   : home
    Created on : 27/05/2015, 20:57:58
    Author     : fpereira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Surigames - Menu</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <ul class="nav nav-pills">
      <li role="presentation" class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
          Clientes <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#">Cadastrar</a></li>
          <li><a href="#">Alterar</a></li>
          <li><a href="#">Excluir</a></li>
          <li class="divider"></li>
          <li><a href="#">Listar Clientes</a></li>
        </ul>
      </li>
      <li role="presentation" class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
          Jogos <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#">Cadastrar</a></li>
          <li><a href="#">Alterar</a></li>
          <li><a href="#">Excluir</a></li>
          <li class="divider"></li>
          <li><a href="#">Listar Jogos</a></li>
        </ul>
      </li>
      <li role="presentation"><a href="#">Locação</a></li>
      <li role="presentation" class="active"><a href="#">Sair</a></li>
    </ul>
     
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>    
    </body>
</html>
