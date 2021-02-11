package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import conexaoBd.ConexaoBD;

public class DeleteCar {

	public boolean DeletarCarro (int carID) { 
		boolean status = false;
		ConexaoBD conecta = new ConexaoBD();
		try (
			Connection connection = conecta.getConexaoMySQL();
			PreparedStatement pst = connection.prepareStatement("DELETE from carros where idCar = " + carID)
					){
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