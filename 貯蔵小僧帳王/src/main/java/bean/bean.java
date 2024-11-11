package bean;


public class bean implements java.io.Serializable {
	
	private String nickname;
	private String password;
	
	public String getNickName() {
		return nickname;
	}
	
	public String getPassword() {
		return password;
	}
	
	
	public void setNickName(String nickname) {
		this.nickname=nickname;
	}
	
	public void setPassword(String password) {
		this.password=password;
	}
}
