package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.tomcat.jakartaee.commons.lang3.builder.ToStringBuilder;
import org.apache.tomcat.jakartaee.commons.lang3.builder.ToStringStyle;

import bean.Bean;

public class KozouDAO extends DAO {
	
	public Bean search(String nickname, String hashedPassword)
		throws Exception {
		Bean bean=null;
		
		System.out.println(hashedPassword);

		
		Connection con=getConnection();

		PreparedStatement st;
		st=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress where nickname = ? AND password = ?");
		st.setString(1, nickname);
		st.setString(2, hashedPassword);
		ResultSet rs=st.executeQuery();

		while (rs.next()) {
			bean =new Bean();
			bean.setNickname(rs.getString("nickname"));
			bean.setPassword(rs.getString("password"));
			bean.setPrefectures(rs.getString("prefectures"));
			bean.setSex(rs.getString("sex"));
			bean.setDateofbirth(rs.getDate("dateofbirth"));
			bean.setEmailaddress(rs.getString("emailaddress"));
			bean.setProductnumber(rs.getString("productnumber"));
		}
		
		st.close();
		con.close();
		

		// こんな風にすれば Bean の中身がログに出力できる
		String bbb =( ToStringBuilder.reflectionToString(bean, ToStringStyle.DEFAULT_STYLE) );
		System.out.println(bbb);

		return bean;
	}
	
	public int instert(String nickname, String hashedPassword, String emailAddress, String dateOfBirth, String sex, String prefectures)
			throws Exception {
			
//			System.out.println(hashedPassword);
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
	
	public int delete(Bean p) throws Exception {
		Connection con=getConnection();
		
		PreparedStatement st=con.prepareStatement(
//			"UPDATE product_table SET status = 2 WHERE productnumber = ?;");
			"DELETE from product_table where productnumber = ?");
		st.setString(1, p.getProductnumber());
//		System.out.println(st + " record(s) deleted.");
		int line=st.executeUpdate();
		
		st.close();
		con.close();
		return line;
	}
	
	public int productinsert(String productnumber, String productname, String categorynumber)
			throws Exception {
			
			Connection con=getConnection();

			PreparedStatement st;
			st=con.prepareStatement("insert into product_table(productnumber, productname, categorynumber) values(?, ?, ?) ");
			st.setString(1, productnumber);
			st.setString(2, productname);
			st.setString(3, categorynumber);
//			st.setString(4, numberofregistrations);
//			System.out.println(st);
			int productline=st.executeUpdate();

			st.close();
			con.close();

			return productline;
			}
	public int update(String productnumber, String productname, String productnumbermoto)
			throws Exception {
		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
				"UPDATE product_table SET productnumber = ?,productname = ? WHERE productnumber = ?;");
//				"DELETE from product_table where productnumber = ?");
			st.setString(1, productnumber);
			st.setString(2, productname);
			st.setString(3, productnumbermoto);
			System.out.println(st + " record(s) deleted.");
			int line=st.executeUpdate();
			
			
			st.close();
			con.close();
			return line;
		}

}

