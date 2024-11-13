package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Bean;

public class KozouDAO extends DAO {
	
	public Bean search(String nickname, String password)
		throws Exception {
		Bean bean=null;
		
		Connection con=getConnection();

		PreparedStatement st;
		st=con.prepareStatement("select * from user_table where nickname=? AND password=?");
		st.setString(1, nickname);
		st.setString(2, password);
		ResultSet rs=st.executeQuery();

		while (rs.next()) {
			bean =new Bean();
			bean.setNickname(rs.getString("nickname"));
			bean.setPassword(rs.getString("password"));
			bean.setPrefectures(rs.getString("prefectures"));
			bean.setSex(rs.getString("sex"));
			bean.setDateOfBirth(rs.getDate("dateOfBirth"));
			bean.setEmailAddress(rs.getString("emailAddress"));
			bean.setProductNumber(rs.getString("productNumber"));

		}
		
		st.close();
		con.close();

		return bean;
	}
	
	public int instert(String nickname, String password, String emailAddress, String dateOfBirth, String sex, String prefectures)
			throws Exception {
			
			Connection con=getConnection();

			PreparedStatement st;
			st=con.prepareStatement("insert into user_table(nickname, password, emailAddress, dateOfBirth, sex, prefectures) values(?, ?, ?, ?, ?, ?) ");
			st.setString(1, nickname);
			st.setString(2, password);
			st.setString(3, emailAddress);
			st.setString(4, dateOfBirth);
			st.setString(5, sex);
			st.setString(6, prefectures);
			int line=st.executeUpdate();

			st.close();
			con.close();

			return line;
		}
}
