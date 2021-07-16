package SBK.Model;

public class UpdateProfileName {
	public UpdateProfileName() {
		super();
	}
	public UpdateProfileName(String firstName, String lastName) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
	}
	private String firstName;
	private String lastName;
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
	@Override
	public String toString() {
		return "UpdateProfileName [firstName=" + firstName + ", lastName=" + lastName + "]";
	}
}
