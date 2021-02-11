package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexaoBd.ConexaoBD;

public class Cadastro {

	public boolean realizaCadastro(String usuario, String nome, String email, String cpf, String rg, String senha){
		boolean status = false;
		ConexaoBD conecta = new ConexaoBD();
		try (
			Connection connection = conecta.getConexaoMySQL();
			PreparedStatement pst = connection.prepareStatement("INSERT INTO usuarios (usuario, nome, email, cpf, rg, senha)" + 
					"VALUES (?, ?, ?, ?, ?, ?);")){
				pst.setString(1, usuario);
				pst.setString(2, nome);
				pst.setString(3, email);
				pst.setString(4, cpf);
				pst.setString(5, rg);
				pst.setString(6, senha);
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
