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
			System.out.println(rs.getString("password"));
		}
		
		st.close();
		con.close();

		return bean;
	}
}
