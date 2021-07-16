package SBK.Model;

public class AddressDetails {
	public AddressDetails() {
		super();
	}
	public AddressDetails(String emailId, String name, String mobileNumber, String pinCode, String locality,
			String address, String city, String state, String landmark, String alternateNumber, String addressId) {
		super();
		this.emailId = emailId;
		this.name = name;
		this.mobileNumber = mobileNumber;
		this.pinCode = pinCode;
		this.locality = locality;
		this.address = address;
		this.city = city;
		this.state = state;
		this.landmark = landmark;
		this.alternateNumber = alternateNumber;
		this.addressId= addressId;
	}
	private String emailId;
	private String name;
	private String mobileNumber;
	private String pinCode;
	private String locality;
	private String address;
	private String city;
	private String state;
	private String landmark;
	private String alternateNumber;
	private String addressId;
	@Override
	public String toString() {
		return "AddressDetails [emailId=" + emailId + ", name=" + name + ", mobileNumber=" + mobileNumber + ", pinCode="
				+ pinCode + ", locality=" + locality + ", address=" + address + ", city=" + city + ", state=" + state
				+ ", landmark=" + landmark + ", alternateNumber=" + alternateNumber + ", addressId=" + addressId + "]";
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getAlternateNumber() {
		return alternateNumber;
	}
	public void setAlternateNumber(String alternateNumber) {
		this.alternateNumber = alternateNumber;
	}
	public String getAddressId() {
		return addressId;
	}
	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}
}
