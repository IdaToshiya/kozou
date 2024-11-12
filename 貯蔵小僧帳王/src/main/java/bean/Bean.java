package bean;

import java.util.Date;


public class Bean implements java.io.Serializable {
	
	private String nickname;
	private String password;
	private String prefectures;
	private String sex;
	private int age;
	private Date dateOfBirth;
	private String emailAddress;
	private int productNumber;
	private String productName;
	private int productOfRegistrations;
	private int stock;
	private Date startUsing;
	private Date endOfUse;
	private int periodDenominator;
	private int periodNumerator;
	private int activeNomber;






	
	public String getNickname() {
		return nickname;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}
	
	public String getSex() {
		return sex;
	}
	
	public int getAge() {
		return age;
	}
	
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	
	public String getPrefectures() {
		return prefectures;
	}
	
	public void setNickname(String nickname) {
		this.nickname=nickname;
	}
	
	public void setPassword(String password) {
		this.password=password;
	}
	
	public void setPrefectures(String prefectures) {
		this.prefectures=prefectures;
	}
	
	public void setSex(String sex) {
		this.sex=sex;
	}
	
	public void setAge(int age) {
		this.age=age;
	}
	
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth=dateOfBirth;
	}
	
	public void setEmailAddress(String emailAddress) {
		this.emailAddress=emailAddress;
	}
}
