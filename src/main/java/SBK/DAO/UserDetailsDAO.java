package SBK.DAO;

import java.util.List;

import SBK.Model.UserDetails;


public interface UserDetailsDAO {
	public void insertDetails(UserDetails user);
	public UserDetails getUserDetails(String emailId);
	public String getOtp(String emailId);
	public void updateDetails(UserDetails user);
}
