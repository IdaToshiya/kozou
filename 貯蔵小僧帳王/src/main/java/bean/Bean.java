package bean;


public class Bean implements java.io.Serializable {
	
	private String nickname;
	private String password;
	
	public String getNickname() {
		return nickname;
	}
	
	public String getPassword() {
		return password;
	}
	
	
	public void setNickname(String nickname) {
		this.nickname=nickname;
	}
	
	public void setPassword(String password) {
		this.password=password;
	}
}
