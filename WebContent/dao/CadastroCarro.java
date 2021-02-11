package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.websocket.Encoder.BinaryStream;

import com.mysql.cj.jdbc.Blob;

import conexaoBd.ConexaoBD;
public class CadastroCarro {

	public boolean CadastrarCarro (String CarroAno, String Descricao, String LinkImg) { 
		boolean status = false;
		ConexaoBD conecta = new ConexaoBD();
		try (
			Connection connection = conecta.getConexaoMySQL();
			PreparedStatement pst = connection.prepareStatement("INSERT INTO carros (carroAno, descricao, linkImg)" + 
					"VALUES (?, ?, ?);")){
				pst.setString(1, CarroAno);
				pst.setString(2, Descricao);
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
