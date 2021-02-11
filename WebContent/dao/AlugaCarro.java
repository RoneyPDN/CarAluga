package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import conexaoBd.ConexaoBD;

public class AlugaCarro {
	
	public boolean AlugarCarro (String Usuario, String CarroAno,  String LinkImg) { 
		boolean status = false;
		ConexaoBD conecta = new ConexaoBD();
		try (
			Connection connection = conecta.getConexaoMySQL();
			PreparedStatement pst = connection.prepareStatement("INSERT INTO carrosAlugados (usuario, carroAno, linkImg)" + 
					"VALUES (?, ?, ?);")){
				pst.setString(1, Usuario);
				pst.setString(2, CarroAno);
				pst.setString(3, LinkImg);
				System.out.println(pst);
				boolean rs = pst.execute();
				status = true;
		} catch (SQLException e) {
			status = false;
			e.printStackTrace();
			return status;
		}
		return status;
}
}