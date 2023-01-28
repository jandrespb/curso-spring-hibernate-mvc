package com.example.testdatabase;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestDbServlet
 */
@WebServlet("/TestDbServlet")
public class TestDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// setup connection variables
		String usuario = "devspring";
		String contrasenia = "springstudent";
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/web_customer_tracker?useSSL=false&allowPublicKeyRetrieval=true";
		String driver = "com.mysql.jdbc.Driver";
		
		// get connection to database
		try {
			
			PrintWriter salida = response.getWriter();
			salida.println("Conexión a la base de datos: " + jdbcUrl);
			
			Class.forName(driver);
			
			Connection miConexion = DriverManager.getConnection(jdbcUrl, usuario, contrasenia);
			salida.println("CONEXIÓN EXITOSA!!");
			
			miConexion.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new ServletException(e);
		}
	}

}
