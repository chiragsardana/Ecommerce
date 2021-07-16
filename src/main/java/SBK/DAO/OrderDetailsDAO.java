package SBK.DAO;

import java.util.List;

import SBK.Model.OrderDetails;

public interface OrderDetailsDAO {
	public void placeOrder(OrderDetails orderDetails);
	public OrderDetails getOrderDetail(String orderId);
//	For an Particular User
	public List<String> getOrderList(String emailId);
	public List<OrderDetails> getAllOrderList();
	public void changeStatus(String status, String orderId);
}
