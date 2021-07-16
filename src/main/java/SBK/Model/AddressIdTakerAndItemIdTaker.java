package SBK.Model;

public class AddressIdTakerAndItemIdTaker {
	public AddressIdTakerAndItemIdTaker() {
		super();
	}
	public AddressIdTakerAndItemIdTaker(String addressId, String itemId) {
		super();
		this.addressId = addressId;
		this.itemId = itemId;
	}
	private String addressId;
	private String itemId;
	@Override
	public String toString() {
		return "AddressIdTakerAndItemIdTaker [addressId=" + addressId + ", itemId=" + itemId + "]";
	}
	public String getAddressId() {
		return addressId;
	}
	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
}
