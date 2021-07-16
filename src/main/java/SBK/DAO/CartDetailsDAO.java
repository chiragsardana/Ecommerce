package SBK.DAO;

public interface CartDetailsDAO {
	public String getOrderId(String email);
	public void insertCartId(String cartId, String emailId);
}
