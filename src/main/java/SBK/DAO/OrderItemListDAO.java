package SBK.DAO;

import java.util.List;

import SBK.Model.ItemDetails;

public interface OrderItemListDAO {
	public List<String> getItemList(String orderId);
	public void insertItems(String orderId, ItemDetails itemDetails);
}
