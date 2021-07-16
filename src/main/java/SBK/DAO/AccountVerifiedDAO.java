package SBK.DAO;

import SBK.Model.UserDetails;

public interface AccountVerifiedDAO {
	public void insert(UserDetails user);
	public void update(UserDetails user);
}
