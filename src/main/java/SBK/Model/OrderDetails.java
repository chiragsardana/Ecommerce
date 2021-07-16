package SBK.Model;

import java.util.List;

public class OrderDetails {
	public OrderDetails() {
		super();
	}
	public OrderDetails(String orderId, String emailId, String addressId,String status) {
		super();
		this.orderId = orderId;
		this.emailId = emailId;
		this.addressId = addressId;
		this.status = status;
	}
	private String orderId;
	private String emailId;
	private String addressId;
	private String status;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getAddressId() {
		return addressId;
	}
	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}
	@Override
	public String toString() {
		return "OrderDetails [orderId=" + orderId + ", emailId=" + emailId + ", addressId=" + addressId + ", status="
				+ status + "]";
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
