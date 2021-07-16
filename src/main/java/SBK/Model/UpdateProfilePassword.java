package SBK.Model;

public class UpdateProfilePassword {
	public UpdateProfilePassword() {
		super();
	}
	public UpdateProfilePassword(String password, String confirmPassword) {
		super();
		this.password = password;
		this.confirmPassword = confirmPassword;
	}
	private String password;
	private String confirmPassword;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	@Override
	public String toString() {
		return "UpdateProfilePassword [password=" + password + ", confirmPassword=" + confirmPassword + "]";
	}
}
