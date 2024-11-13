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
	private Date startUsing;
	private Date endUse;
	private int periodDenominator;
	private int periodNumerator;
	private int activeNumber;
	private String productName;
	private int categoryNumber;
	private int numberOfRegistrations;
	
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
	
	public Date getstartUsing() {
		return startUsing;
	}
	
	public Date getEndUse() {
		return endUse;
	}
	
	public int getPeriodDenominator() {
		return periodDenominator;
	}
	
	public int getPeriodNumerator() {
		return periodNumerator;
	}
	
	public int getActiveNumber() {
		return activeNumber;
	}
	
	public String getProductName() {
		return productName;
	}
	
	public int getCategoryNumber() {
		return categoryNumber;
	}
	
	public int getNumberOfRegistrations() {
		return numberOfRegistrations;
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
	
	public void setStartUsing(Date startUsing) {
		this.startUsing=startUsing;
	}
	
	public void setEndUse(Date endUse) {
		this.endUse=endUse;
	}
	
	public void setPeriodDenominator(int periodDenominator) {
		this.periodDenominator=periodDenominator;
	}
	
	public void setPeriodNumerator(int periodNumerator) {
		this.periodNumerator=periodNumerator;
	}
	
	public void setActiveNumber(int activeNumber) {
		this.activeNumber=activeNumber;
	}
	
	public void setProductName(String productName) {
		this.productName=productName;
	}
	
	public void setCategoryNumber(int categoryNumber) {
		this.categoryNumber=categoryNumber;
	}
	
	public void setNumberOfRegistrations(int numberOfRegistrations) {
		this.numberOfRegistrations=numberOfRegistrations;
	}
}
