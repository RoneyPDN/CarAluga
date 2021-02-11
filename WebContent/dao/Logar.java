package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexaoBd.ConexaoBD;

public class Logar {


		public boolean validaLogin(String usuario, String senha){
			boolean status = false;
			ConexaoBD conecta = new ConexaoBD();
			System.out.println(conecta.statusConection());			
			try (
				Connection connection = conecta.getConexaoMySQL();
				PreparedStatement pst = connection.prepareStatement("select * from usuarios where usuario = ? and senha = ?")){
					pst.setString(1, usuario);
					pst.setString(2, senha);
					System.out.println(pst);
					ResultSet rs = pst.executeQuery();
					status = rs.next();
			} catch (SQLException e) {
				System.out.println("Erro");
				e.printStackTrace();
				return status;
			}		
			return status;
		}
}