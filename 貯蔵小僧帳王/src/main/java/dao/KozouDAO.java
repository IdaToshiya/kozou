package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Bean;

public class KozouDAO extends DAO {
	
	public Bean search(String nickname, String hashedPassword)
		throws Exception {
		Bean bean=null;
		
		Connection con=getConnection();

		PreparedStatement st;
		st=con.prepareStatement("select * from user_table where nickname=? AND password=?");
		st.setString(1, nickname);
		st.setString(2, hashedPassword);
		ResultSet rs=st.executeQuery();

		while (rs.next()) {
			bean =new Bean();
			bean.setNickname(rs.getString("nickname"));
			bean.setPassword(rs.getString("password"));
//			bean.setPrefectures(rs.getString("prefectures"));
//			bean.setSex(rs.getString("sex"));
//			bean.setDateOfBirth(rs.getDate("dateOfBirth"));
//			bean.setEmailAddress(rs.getString("emailAddress"));
//			bean.setProductNumber(rs.getString("productNumber"));
		}
		
		st.close();
		con.close();

		return bean;
	}
	
	public int instert(String nickname, String hashedPassword, String emailAddress, String dateOfBirth, String sex, String prefectures)
			throws Exception {
			
			System.out.println(hashedPassword);
			Connection con=getConnection();

			PreparedStatement st;
			st=con.prepareStatement("insert into user_table(nickname, password, prefectures, sex, dateofbirth, emailaddress) values(?, ?, ?, ?, ?, ?) ");
			st.setString(1, nickname);
			st.setString(2, hashedPassword);
			st.setString(3, prefectures);
			st.setString(4, sex);
			st.setString(5, dateOfBirth);
			st.setString(6, emailAddress);
			int line=st.executeUpdate();

			st.close();
			con.close();

			return line;
		}
}
