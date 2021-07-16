package SBK.DAO;

import java.util.List;

import SBK.Model.ItemDetails;

public interface CartItemDetailsDAO {
	public List<String> getItemList(String cartId);
	public void insertItemId(String cartId, ItemDetails itemDetails);
	public void deleteItemsId(String cartId);
	public void deleteParticularItemsId(String itemId, String cartId);
}
