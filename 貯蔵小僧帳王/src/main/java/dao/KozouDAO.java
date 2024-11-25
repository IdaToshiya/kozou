package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jakartaee.commons.lang3.builder.ToStringBuilder;
import org.apache.tomcat.jakartaee.commons.lang3.builder.ToStringStyle;

import bean.Bean;

public class KozouDAO extends DAO {
	
	public Bean search(String nickname, String hashedPassword)
		throws Exception {
		Bean bean=null;
		
		Connection con=getConnection();

		PreparedStatement st;
		st=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress where nickname = ? AND password = ?");
		st.setString(1, nickname);
		st.setString(2, hashedPassword);
		ResultSet rs=st.executeQuery();
		
		String updateQuery = "UPDATE stock_table SET periodnumerator = ? WHERE emailaddress = ? AND productnumber = ?;";
		
		PreparedStatement updateStmt = con.prepareStatement(updateQuery);
		System.out.println(nickname);
		
		if ("管理人".equals(nickname)) {
			while (rs.next()) {
				bean =new Bean();
				bean.setNickname(rs.getString("nickname"));
				bean.setPassword(rs.getString("password"));
				bean.setSex(rs.getString("sex"));
				bean.setEmailaddress(rs.getString("emailaddress"));
			}
		}else {
			while (rs.next()) {
				bean =new Bean();
				bean.setNickname(rs.getString("nickname"));
				bean.setPassword(rs.getString("password"));
				bean.setSex(rs.getString("sex"));
				bean.setStartusing(rs.getDate("startusing"));
				bean.setEmailaddress(rs.getString("emailaddress"));
				bean.setProductnumber(rs.getString("productnumber"));
				System.out.println("productnumber"+bean.getProductnumber()+"start"+bean.getStartusing());
				
				LocalDate today = LocalDate.now();
				Date start = bean.getStartusing();
				LocalDate startday = start.toLocalDate();
				long daysBetween = ChronoUnit.DAYS.between(startday, today);
				System.out.println("aaaaaaaaaaa"+daysBetween);
				String email = bean.getEmailaddress();
				String num = bean.getProductnumber();
				updateStmt.setLong(1, daysBetween);
			    updateStmt.setString(2, email);
			    updateStmt.setString(3, num);
			    updateStmt.executeUpdate();
			}
		}
		
		rs.close();
		st.close();
		con.close();
		

		// こんな風にすれば Bean の中身がログに出力できる
		String bbb =( ToStringBuilder.reflectionToString(bean, ToStringStyle.DEFAULT_STYLE) );
		System.out.println(bbb);

		return bean;
	}
	
	public int insert(String nickname, String hashedPassword, String emailAddress, String dateOfBirth, String sex, String prefectures)
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
	
	public int delete(String productnumber) 
			throws Exception {
		
			Connection con=getConnection();
			
			PreparedStatement st=con.prepareStatement(
				"DELETE from product_table where productnumber = ?");
			st.setString(1, productnumber);
			System.out.println(st + " record(s) deleted.");
			int line=st.executeUpdate();
			
			st.close();
			con.close();
			return line;
		}
	
	public int productinsert(String productnumber, String productname, int categorynumber)
			throws Exception {
			
			Connection con=getConnection();

			PreparedStatement st;
			st=con.prepareStatement("insert into product_table(productnumber, productname, categorynumber) values(?, ?, ?) ");
			st.setString(1, productnumber);
			st.setString(2, productname);
			st.setInt(3, categorynumber);
//			st.setString(4, numberofregistrations);
			System.out.println(st);
			int productline=st.executeUpdate();

			st.close();
			con.close();
			System.out.println(productline);

			return productline;
		}
	
	public Bean userproductinsert(int stock, String productnumber, String emailaddress)
			throws Exception {
		
			Bean bean=null;
			
			Connection con=getConnection();
			// 商品がすでに存在するか確認
			PreparedStatement st;
			st=con.prepareStatement("SELECT COUNT(*) FROM stock_table WHERE productnumber = ? AND emailaddress = ? group by emailaddress");
            st.setString(1, productnumber);
            st.setString(2, emailaddress);
            ResultSet rs = st.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                // 商品がすでに存在する場合
                return null; // 呼び出し元でエラーを処理
            }
            
            rs.close();
            st.close();

            // 2. product_table から perioddenominator を取得
            String periodQuery = "SELECT perioddenominator FROM product_table WHERE productnumber = ?";
            st = con.prepareStatement(periodQuery);
            st.setString(1, productnumber);
            rs = st.executeQuery();

            int perioddenominator = 0; // デフォルト値
            if (rs.next()) {
                perioddenominator = rs.getInt("perioddenominator");
            } else {
                throw new Exception("Product number not found in product_table: " + productnumber);
            }
            rs.close();
            st.close();
            
            st=con.prepareStatement("INSERT INTO stock_table (stock, productnumber, activenumber, emailaddress, perioddenominator, periodnumerator) VALUES (?, ?, 1, ?, ?, 0)");
			st.setInt(1, stock); 
			st.setString(2, productnumber);
			st.setString(3, emailaddress);
			st.setInt(4, perioddenominator);
			st.executeUpdate();
			st.close();
	
		    // SELECT文の準備：すでに存在するデータを取得
		    st = con.prepareStatement("SELECT stock_table.emailaddress, user_table.sex FROM stock_table "
		    		+ "JOIN user_table ON stock_table.emailaddress = user_table.emailaddress "
		    		+ "WHERE stock_table.emailaddress = ? GROUP BY stock_table.emailaddress, user_table.sex;");
		    st.setString(1, emailaddress);
			rs = st.executeQuery();
			    
		    // 結果をBeanに格納
		    if (rs.next()) {
		        bean = new Bean();
		        bean.setEmailaddress(rs.getString("emailaddress"));
		        bean.setSex(rs.getString("sex"));
			    
			    rs.close();
			    st.close();
				con.close();
			}
			return bean;
		}
	
	public int update(String productnumber, String productname, String productnumbermoto)
			throws Exception {
		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
				"UPDATE product_table SET productnumber = ?,productname = ? WHERE productnumber = ?;");
			st.setString(1, productnumber);
			st.setString(2, productname);
			st.setString(3, productnumbermoto);
			System.out.println(st + " record(s) deleted.");
			int line=st.executeUpdate();
			
			st.close();
			con.close();
			return line;
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
			bean.setSex(rs.getString("sex"));
			bean.setEmailaddress(rs.getString("emailaddress"));
		}
		
		rs.close();
		st.close();
		con.close();
		
		return bean;
	}

	public Bean decrease(String emailaddress, String productnumber, int stock)
			throws Exception {
		Connection con=getConnection();
		Bean bean=null;
		
		int decreasestock = stock-1;
		System.out.println(decreasestock);
		System.out.println(productnumber);
		System.out.println(emailaddress);
		
		PreparedStatement st=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where user_table.emailaddress = ? AND stock_table.productnumber = ?");
		st.setString(1, emailaddress);
		st.setString(2, productnumber);
		
		ResultSet rs=st.executeQuery();
		
		while (rs.next()) {
			bean =new Bean();
			bean.setSex(rs.getString("sex"));
			bean.setEmailaddress(rs.getString("emailaddress"));
		}
		st.close();
		rs.close();

		PreparedStatement st1=con.prepareStatement(
			"UPDATE stock_table SET stock = ? WHERE emailaddress = ? AND productnumber = ?;");
		st1.setInt(1, decreasestock);
		st1.setString(2, emailaddress);
		st1.setString(3, productnumber);
		st1.executeUpdate();
		
		st1=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where user_table.emailaddress = ? AND stock_table.productnumber = ?");
		st1.setString(1, emailaddress);
		st1.setString(2, productnumber);
		
		ResultSet rss1=st1.executeQuery();

		while (rss1.next()) {
			bean =new Bean();
			bean.setSex(rss1.getString("sex"));
			bean.setEmailaddress(rss1.getString("emailaddress"));
		}
		
		rs.close();
		st1.close();
		con.close();
		
		return bean;
	}

	public Bean start(String emailaddress, String productnumber, int stock)
			throws Exception {
		Connection con=getConnection();
		Bean bean=null;
		
		LocalDate today = LocalDate.now();
		Date sqlDateToday = Date.valueOf(today);
		int decreasestock = stock-1;
		
		System.out.println(decreasestock);
		
		PreparedStatement st=con.prepareStatement(
				"UPDATE stock_table SET enduse = ?, stock = ? WHERE emailaddress = ? AND productnumber = ?;");
			st.setDate(1, sqlDateToday);
			st.setLong(2, decreasestock);
			st.setString(3, emailaddress);
			st.setString(4, productnumber);
			st.executeUpdate();
			st.close();
		
		st=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where user_table.emailaddress = ? AND stock_table.productnumber = ?");
		st.setString(1, emailaddress);
		st.setString(2, productnumber);
		ResultSet rs=st.executeQuery();
		
		while (rs.next()) {
			bean =new Bean();
			bean.setSex(rs.getString("sex"));
			bean.setEmailaddress(rs.getString("emailaddress"));
			bean.setStartusing(rs.getDate("startusing"));
			bean.setEnduse(rs.getDate("enduse"));
		}
		st.close();
		
		Date sta = bean.getStartusing();
		System.out.println(sta);
		
		if (sta == null) {
			PreparedStatement st1=con.prepareStatement(
					"UPDATE stock_table SET startusing = ? WHERE emailaddress = ? AND productnumber = ?;");
				st1.setDate(1, sqlDateToday);
				st1.setString(2, emailaddress);
				st1.setString(3, productnumber);
				st1.executeUpdate();
				st1.close();
				System.out.println("aaaaaaaaaaaaaaaaaaaa");
		}
		
		st=con.prepareStatement("select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where user_table.emailaddress = ? AND stock_table.productnumber = ?");
		st.setString(1, emailaddress);
		st.setString(2, productnumber);
		ResultSet rs1=st.executeQuery();
		
		while (rs1.next()) {
			bean =new Bean();
			bean.setSex(rs1.getString("sex"));
			bean.setEmailaddress(rs1.getString("emailaddress"));
			bean.setStartusing(rs1.getDate("startusing"));
			bean.setEnduse(rs1.getDate("enduse"));
		}
		st.close();
		
		Date end = bean.getEnduse();
		LocalDate endday = end.toLocalDate();
		Date start = bean.getStartusing();
		System.out.println(start);
		LocalDate startday = start.toLocalDate();
		long daysBetween = ChronoUnit.DAYS.between(startday, endday);
		System.out.println("kikann"+daysBetween);
		
		PreparedStatement st2=con.prepareStatement(
				"UPDATE stock_table SET startusing = ?, perioddenominator = ? WHERE emailaddress = ? AND productnumber = ?;");
			st2.setDate(1, sqlDateToday);
			st2.setLong(2, daysBetween);
			st2.setString(3, emailaddress);
			st2.setString(4, productnumber);
			st2.executeUpdate();
			st2.close();
			
		PreparedStatement stm1=con.prepareStatement(
    			"UPDATE stock_table SET periodnumerator = ? WHERE emailaddress = ? AND productnumber = ?;");
    		stm1.setLong(1, daysBetween);
    		stm1.setString(2, emailaddress);
    		stm1.setString(3, productnumber);
    		stm1.executeUpdate();
    		stm1.close();
		
		rs.close();
		con.close();
		
		return bean;
	}

	public List<Bean> dashboard1(String today)
			throws Exception {
	
			Connection con=getConnection();

			PreparedStatement st;
			st=con.prepareStatement("SELECT product_table.categorynumber, category_table.categoryname AS categoryname, SUM(stock_table.stock) AS numberofregistrations FROM stock_table JOIN product_table ON stock_table.productnumber = product_table.productnumber JOIN category_table ON category_table.categorynumber = product_table.categorynumber GROUP BY product_table.categorynumber,category_table.categoryname;");
						
			ResultSet rs=st.executeQuery();
			System.out.println(st + " record(s) dashboard.");
			
			List<Bean> beans = new ArrayList<>();
			while (rs.next()) {
			    Bean bean = new Bean();
			    bean.setNumberofregistrations(rs.getInt("numberofregistrations"));
			    bean.setCategoryname(rs.getString("categoryname"));
			    beans.add(bean);
			}
			
			rs.close();
			st.close();
			con.close();
			
			return beans;
		}
	
	public List<Bean> dashboard2(String today)
			throws Exception {
	
			Connection con=getConnection();

			PreparedStatement st;
			st=con.prepareStatement("SELECT stock_table.productnumber, product_table.productname AS productname, SUM(stock_table.stock) AS numberofregistrations FROM stock_table JOIN product_table ON stock_table.productnumber = product_table.productnumber GROUP BY stock_table.productnumber, product_table.productname ORDER BY numberofregistrations DESC;");
						
			ResultSet rs=st.executeQuery();
			System.out.println(st + " record(s) dashboard.");
			
			List<Bean> productbeans = new ArrayList<>();
			while (rs.next()) {
			    Bean bean = new Bean();
			    bean.setNumberofregistrations(rs.getInt("numberofregistrations"));
			    bean.setProductname(rs.getString("productname"));
			    productbeans.add(bean);
			
			}
			
			rs.close();
			st.close();
			con.close();
			
			return productbeans;
		}
	
	public Bean userdelete(String productnumber, String emailaddress, int activenumber) 
			throws Exception {
			Bean bean=null;
		
			Connection con=getConnection();
			
			PreparedStatement st=con.prepareStatement(
				"UPDATE stock_table SET activenumber = ? WHERE emailaddress = ? AND productnumber = ?;");
			st.setInt(1, activenumber);
			st.setString(2, emailaddress);
			st.setString(3, productnumber);
			System.out.println(st + " record(s) deleted.");
			st.executeUpdate();
			
			// SELECT文の準備：すでに存在するデータを取得
		    st = con.prepareStatement("SELECT stock_table.emailaddress, user_table.sex FROM stock_table "
		    		+ "JOIN user_table ON stock_table.emailaddress = user_table.emailaddress "
		    		+ "WHERE stock_table.emailaddress = ? GROUP BY stock_table.emailaddress, user_table.sex;");
		    st.setString(1, emailaddress);
			ResultSet rs = st.executeQuery();
			    
		    // 結果をBeanに格納
		    if (rs.next()) {
		        bean = new Bean();
		        bean.setEmailaddress(rs.getString("emailaddress"));
		        bean.setSex(rs.getString("sex"));
		    }
		    
		    rs.close();
		    st.close();
			con.close();
			
			return bean;
		}
	
	
}
