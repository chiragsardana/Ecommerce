package SBK.Model;

public class AddressIdTaker {
	public AddressIdTaker() {
		super();
	}

	public AddressIdTaker(String addressId) {
		super();
		this.addressId = addressId;
	}

	private String addressId;

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	@Override
	public String toString() {
		return "AddressIdTaker [addressId=" + addressId + "]";
	}
}
