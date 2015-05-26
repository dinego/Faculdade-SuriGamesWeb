/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Usuario;

/**
 *
 * @author binho
 */
public class UsuarioDAO {
    
    private Connection con;

      
 
    public void checkUser(Usuario user) {
        try {
            PreparedStatement ps = con.prepareStatement("select nome from usuario where nome = ?");
            ps.setString(1, user.getNome());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) // found
            {
                updateUser(user);
            } else {
                addUser(user);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        } 
    }
    public void addUser(Usuario user) {
        try {
            PreparedStatement preparedStatement = con.prepareStatement("insert into users(uname, password, email, registeredon) values (?, ?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setString(1, user.getNome());
            preparedStatement.setString(2, user.getSenha());
            preparedStatement.setString(3, user.getEmail());            
            preparedStatement.setDate(4, new java.sql.Date(user.getRegistrado().getTime()));
            preparedStatement.executeUpdate();
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public void deleteUser(String userId) {
        try {
            PreparedStatement preparedStatement = con.prepareStatement("delete from usuario where nome=?");
            // Parameters start with 1
            preparedStatement.setString(1, userId);
            preparedStatement.executeUpdate();
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public void updateUser(Usuario user) {
        try {
            PreparedStatement preparedStatement = con.prepareStatement("update usuario set senha=?, email=?, registrado=?"
                    + "where uname=?");
            // Parameters start with 1
            System.out.println(new java.sql.Date(user.getRegistrado().getTime()));
            preparedStatement.setString(1, user.getSenha());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setDate(3, new java.sql.Date(user.getRegistrado().getTime()));
            preparedStatement.setString(4, user.getNome());
            preparedStatement.executeUpdate();
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public List<Usuario> getAllUsers() {
        List<Usuario> users = new ArrayList<Usuario>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from users");
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setNome(rs.getString("nome"));
                user.setSenha(rs.getString("senha"));
                user.setEmail(rs.getString("email"));
                user.setRegistrado(rs.getDate("registrado"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return users;
    }
 
    public Usuario getUserById(String userId) {
        Usuario user = new Usuario();
        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from usuario where nome=?");
            preparedStatement.setString(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
 
            if (rs.next()) {
                user.setNome(rs.getString("nome"));
                user.setSenha(rs.getString("senha"));
                user.setEmail(rs.getString("email"));
                user.setRegistrado(rs.getDate("registrado"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return user;
    }
}
