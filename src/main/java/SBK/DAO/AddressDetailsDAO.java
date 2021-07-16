package SBK.DAO;

import java.util.List;

import SBK.Model.AddressDetails;

public interface AddressDetailsDAO {
	public void insertAddress(AddressDetails addressDetails);
	public void updateAddress(AddressDetails addressDetails);
	public List<AddressDetails> getAddress(String emailId);
	public AddressDetails getParticularAddress(String addressId);
}
