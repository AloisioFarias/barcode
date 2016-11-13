package Barcode.src;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
 

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
 
/**
 * Servlet implementation class DataSourceServlet
 */
@WebServlet("/DataSourceServlet")
public class DataSourceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	public DataSourceServlet() {
		super();
	}
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inicio ConexaoMySQL");
 
		List<String> listaNomes = new ArrayList<String>();
		String mensagem = "";
 
		try {
			//Context ctx = new InitialContext();
			//Context envCtx = (Context)ctx.lookup("java:comp/env");
			
			//DataSource ds = (DataSource)envCtx.lookup("jdbc/BARCODE_MySQL");
			//Connection conexao = ds.getConnection();
 			
			Class.forName("com.mysql.jdbc.Driver"); 
			//Connection conexao = DriverManager.getConnection("jdbc:mysql://BARCODE:3306/BASE?autoReconnect=true","root","pxzymk"); 	
			
			Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost/barcode?user=root&password=pxzymk");
			
			PreparedStatement pstm = conexao.prepareStatement("select * from unid_med");
 
			ResultSet rs = pstm.executeQuery();
 
			while (rs.next()) {
				listaNomes.add(rs.getString("ABRV_UNID"));
				listaNomes.add(rs.getString("NOM_UNID"));
			}
			rs.close();
			pstm.close();
			conexao.close();
 
			mensagem = "Consulta realizada com sucesso!";
 
			request.setAttribute("lista", listaNomes);
 
		} catch (Exception e) {
			mensagem = "Hove um erro no processamento." + e.getMessage();
			e.printStackTrace();
		}
 
		request.setAttribute("mensagem", mensagem);
		RequestDispatcher rd = request.getRequestDispatcher("resultado.jsp");
		rd.forward(request, response);
 
		System.out.println("Fim ConexaoMySQL");
	}
}