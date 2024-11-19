package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;

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
	
	public int delete(Bean p) throws Exception {
		Connection con=getConnection();
		
		PreparedStatement st=con.prepareStatement(
//			"UPDATE product_table SET status = 2 WHERE productnumber = ?;");
			"DELETE from product_table where productnumber = ?");
		st.setString(1, p.getProductnumber());
		System.out.println(st + " record(s) deleted.");
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
			System.out.println(st);
			int productline=st.executeUpdate();

			st.close();
			con.close();

			return productline;
		}
	
	public int userproductinsert(String stock, String productname, String categorynumber)
			throws Exception {
			
			Connection con=getConnection();

			PreparedStatement st;
			st=con.prepareStatement("insert into stock_table(stock, productname, categorynumber) values(?, ?, ?) where emailaddress = 'aaa@gmail.com'");
			st.setString(1, stock);
			st.setString(2, productname);
			st.setString(3, categorynumber);
			System.out.println(st);
			int productline=st.executeUpdate();
			
			st=con.prepareStatement("insert into product_table(productname, categorynumber) values(?, ?) where emailaddress = 'aaa@gmail.com'");
			st.setString(1, productname);
			st.setString(2, categorynumber);
//			st.setString(4, numberofregistrations);
			System.out.println(st);
			st.executeUpdate();

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
	
	public Bean usersearch(String productname, String nickname, String password)
			throws Exception {
			Bean bean=null;
			
			String likename = "%" + productname + "%";
			
			Connection con=getConnection();

			PreparedStatement st;
			st=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where productname LIKE ? AND nickname = ? AND password = ?");
			st.setString(1, likename);
			st.setString(2, nickname);
			st.setString(3, password);
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
				bean.setProductname(rs.getString("productname"));
			}
			
			
			st.close();
			con.close();
			

			// こんな風にすれば Bean の中身がログに出力できる
			String bbb =( ToStringBuilder.reflectionToString(bean, ToStringStyle.DEFAULT_STYLE) );
			System.out.println(bbb);

			return bean;
		}
	
	public Bean add(String emailaddress, String productnumber, int stock)
			throws Exception {
		Connection con=getConnection();
		Bean bean=null;
		
		int addstock = stock+1;
		System.out.println(addstock);
		System.out.println(productnumber);
		System.out.println(emailaddress);

		PreparedStatement st=con.prepareStatement(
			"UPDATE stock_table SET stock = ? WHERE emailaddress = ? AND productnumber = ?;");
		st.setInt(1, addstock);
		st.setString(2, emailaddress);
		st.setString(3, productnumber);
		st.executeUpdate();
		
		st=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where user_table.emailaddress = ?");
		st.setString(1, emailaddress);
		
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
			bean.setProductname(rs.getString("productname"));
		}
		
		st.close();
		con.close();
		return bean;
	}

	public Bean decrease(String emailaddress, String productnumber, int stock)
			throws Exception {
		Connection con=getConnection();
		Bean bean=null;
		
		int addstock = stock-1;
		System.out.println(addstock);
		System.out.println(productnumber);
		System.out.println(emailaddress);

		PreparedStatement st=con.prepareStatement(
			"UPDATE stock_table SET stock = ? WHERE emailaddress = ? AND productnumber = ?;");
		st.setInt(1, addstock);
		st.setString(2, emailaddress);
		st.setString(3, productnumber);
		st.executeUpdate();
		
		st=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where user_table.emailaddress = ?");
		st.setString(1, emailaddress);
		
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
			bean.setProductname(rs.getString("productname"));
		}
		
		st.close();
		con.close();
		return bean;
	}

	public Bean start(String emailaddress, String productnumber)
			throws Exception {
		Connection con=getConnection();
		Bean bean=null;
		
		var Date = LocalDateTime.now();
        String Day = "%tm月%td日".formatted(Date, Date);

		PreparedStatement st=con.prepareStatement(
			"UPDATE stock_table SET startusing = ? WHERE emailaddress = ? AND productnumber = ?;");
		st.setString(1, Day);
		st.setString(2, emailaddress);
		st.setString(3, productnumber);
		st.executeUpdate();
		
		st=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where user_table.emailaddress = ?");
		st.setString(1, emailaddress);
		
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
			bean.setProductname(rs.getString("productname"));
		}
		
		st.close();
		con.close();
		return bean;
	}
}