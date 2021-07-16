package SBK.Model;

public class OTPDetails {
	public OTPDetails() {
		super();
	}

	public OTPDetails(String otp, String emailId) {
		super();
		this.otp = otp;
		this.emailId = emailId;
	}
	public OTPDetails(String emailId) {
		super();
		this.emailId = emailId;
	}

	private String otp;
	private String emailId;

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	@Override
	public String toString() {
		return "OTPDetails [otp=" + otp + ", email=" + emailId + "]";
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
}
