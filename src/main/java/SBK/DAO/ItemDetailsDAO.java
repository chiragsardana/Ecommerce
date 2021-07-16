package SBK.DAO;

import java.util.List;

import SBK.Model.ItemDetails;

public interface ItemDetailsDAO {
	public void insertItem(ItemDetails item);
	public ItemDetails getItemDetails(String itemId);
	public List<String> getAllItemNumber();
	public List<ItemDetails> getAllItemDetails();
}
