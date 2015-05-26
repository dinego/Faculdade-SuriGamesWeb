/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

/**
 *
 * @author binho
 */
public class UsuarioController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/user.jsp";
    private static String LIST_USER = "/listuser.jsp";
    private static String LOGIN = "/login.jsp";
    private static String ERROR = "/error.jsp";
    private DAO dao;

    public UsuarioController() {
        super();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        dao = new DAO();
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            String userId = request.getParameter("userId");
            dao.deleteUser(userId);
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            String userId = request.getParameter("userId");
            Usuario user = dao.getUserById(userId);
            request.setAttribute("user", user);
        } else if (action.equalsIgnoreCase("listUser")) {
            forward = LIST_USER;

            request.setAttribute("users", dao.getAllUsers());
        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Usuario user = new Usuario();
        user.setNome(request.getParameter("nome"));
        user.setSenha(request.getParameter("senha"));
        try {
            Date reg = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("dob"));
            System.out.println("rrrrrrrrrrr" + reg);
            user.setRegistrado(reg);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        user.setEmail(request.getParameter("email"));
        String userid = request.getParameter("nome");
        user.setNome(userid);
        dao.checkUser(user);
        
        request.setAttribute("users", dao.getAllUsers());
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);

        view.forward(request, response);

    }
}
