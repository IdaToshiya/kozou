package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.bean;


public class KozouDAO extends DAO {
	public List<bean> search() throws Exception {
		List<bean> list=new ArrayList<>();
	
	 try {
		 Connection conn=getConnection();
		 PreparedStatement st=conn.prepareStatement(
				 "SELECT * FROM user_name");
		 ResultSet rs=st.executeQuery();
		 
		 while (rs.next()) {
				bean p=new bean();
				p.setNickName(rs.getString("nickname"));
				p.setPassword(rs.getString("password"));
				list.add(p);
			}
         
     }catch (SQLException e) {
         e.printStackTrace();
     }
	return list; 
	}
}
