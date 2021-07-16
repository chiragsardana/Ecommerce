package SBK.Model;

public class CartDetails {
	public CartDetails() {
		super();
	}
	public CartDetails(String emailId, String cartId) {
		super();
		this.emailId = emailId;
		this.cartId = cartId;
	}
	private String emailId;
	private String cartId;
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getCartId() {
		return cartId;
	}
	public void setCartId(String cartId) {
		this.cartId = cartId;
	}
	@Override
	public String toString() {
		return "CartDetails [emailId=" + emailId + ", cartId=" + cartId + "]";
	}
}
