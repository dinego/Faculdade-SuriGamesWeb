/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import controller.*;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author binho
 */
public class Login extends HttpServlet {

    private DAO dao;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nome = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        if (!nome.isEmpty() && !senha.isEmpty()) {
            dao = new DAO();

            Usuario u = new Usuario();
            u.setNome(nome);
            u.setSenha(senha);

            if (dao.isUserRegistred(u)) {
                HttpSession session = request.getSession();

                session.setAttribute("login", "Logado");
                String x = request.getContextPath() + "/UsuarioController?action=listuser";
                //RequestDispatcher view = request.getRequestDispatcher(x);

                //view.forward(request, response);
                
                response.sendRedirect(request.getContextPath() + "/UsuarioController?action=listuser");
            } else {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }

        }
    }
}
