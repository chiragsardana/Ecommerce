package SBK.Model;

import SBK.Validations.Password;

public class UserDetails {
	public UserDetails() {
		super();
		verifiedChecker = false;
	}
	public UserDetails(String firstName, String lastName, String emailId, String password, Boolean verifiedChecker) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailId = emailId;
		this.password = password;
		this.verifiedChecker = verifiedChecker;
		this.otp = otp;
	}
	private String firstName;
	private String lastName;
	private String emailId;
	@Password
	private String password;
	private Boolean verifiedChecker;
	private String otp;
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getVerifiedChecker() {
		return verifiedChecker;
	}
	public void setVerifiedChecker(Boolean verifiedChecker) {
		this.verifiedChecker = verifiedChecker;
	}
	
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	@Override
	public String toString() {
		return "UserDetails [firstName=" + firstName + ", lastName=" + lastName + ", emailId=" + emailId + ", password="
				+ password + ", verifiedChecker=" + verifiedChecker + ", otp=" + otp + "]";
	}
}
