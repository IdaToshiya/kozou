package bean;

import java.sql.Date;

public class Bean implements java.io.Serializable {
	
	private String nickname;
	private String password;
	private String hashedPassword;
	private String prefectures;
	private String sex;
	private Date dateofbirth;
	private String emailaddress;
	private String productnumber;
	private int stock;
	private Date startusing;
	private Date enduse;
	private int perioddenominator;
	private int periodnumerator;
	private int activenumber;
	private String productname;
	private int categorynumber;
	private int numberofregistrations;
	
	public String getNickname() {
		return nickname;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getHashedPassword() {
		return hashedPassword;
	}
	
	public String getPrefectures() {
		return prefectures;
	}
	
	public String getSex() {
		return sex;
	}
	
	public Date getDateofbirth() {
		return dateofbirth;
	}
	
	public String getEmailaddress() {
		return emailaddress;
	}
	
	public String getProductnumber() {
		return productnumber;
	}
	
	public int getStock() {
		return stock;
	}
	
	public Date getStartusing() {
		return startusing;
	}
	
	public Date getEnduse() {
		return enduse;
	}
	
	public int getPerioddenominator() {
		return perioddenominator;
	}
	
	public int getPeriodnumerator() {
		return periodnumerator;
	}
	
	public int getActivenumber() {
		return activenumber;
	}
	
	public String getProductname() {
		return productname;
	}
	
	public int getCategorynumber() {
		return categorynumber;
	}
	
	public int getNumberofregistrations() {
		return numberofregistrations;
	}
//	------------------------------------------------------------------------------------
	public void setNickname(String nickname) {
		this.nickname=nickname;
	}
	
	public void setPassword(String password) {
		this.password=password;
	}
	
	public void setHashedPassword(String hashedPassword) {
		this.hashedPassword=hashedPassword;
	}
	
	public void setPrefectures(String prefectures) {
		this.prefectures=prefectures;
	}
	
	public void setSex(String sex) {
		this.sex=sex;
	}
	
	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth=dateofbirth;
	}
	
	public void setEmailaddress(String emailaddress) {
		this.emailaddress=emailaddress;
	}
	
	public void setProductnumber(String productnumber) {
		this.productnumber=productnumber;
	}
	
	public void setStock(int stock) {
		this.stock=stock;
	}
	
	public void setStartusing(Date startusing) {
		this.startusing=startusing;
	}
	
	public void setEnduse(Date enduse) {
		this.enduse=enduse;
	}
	
	public void setPerioddenominator(int perioddenominator) {
		this.perioddenominator=perioddenominator;
	}
	
	public void setPeriodnumerator(int periodnumerator) {
		this.periodnumerator=periodnumerator;
	}
	
	public void setActivenumber(int activenumber) {
		this.activenumber=activenumber;
	}
	
	public void setProductname(String productname) {
		this.productname=productname;
	}
	
	public void setCategorynumber(int categorynumber) {
		this.categorynumber=categorynumber;
	}
	
	public void setNumberofregistrations(int numberofregistrations) {
		this.numberofregistrations=numberofregistrations;
	}
}
