package SBK.Model;

public class ItemDetails {
	public ItemDetails() {
		super();
	}
	public ItemDetails(String itemId, String itemName, String price, String careInstruction, String fitType, String color,
			String fileName1, String fileName2, String category) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.careInstruction = careInstruction;
		this.fitType = fitType;
		this.color = color;
		this.fileName1 = fileName1;
		this.fileName2 = fileName2;
		this.category = category;
	}
	private String itemId;
	private String itemName;
	private String price;
	private String careInstruction;
	private String fitType;
	private String color;
	private String fileName1;
	private String fileName2;
	private String category;
	
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getCareInstruction() {
		return careInstruction;
	}
	public void setCareInstruction(String careInstruction) {
		this.careInstruction = careInstruction;
	}
	public String getFitType() {
		return fitType;
	}
	public void setFitType(String fitType) {
		this.fitType = fitType;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getFileName1() {
		return fileName1;
	}
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ItemDetails [itemId=" + itemId + ", itemName=" + itemName + ", price=" + price + ", careInstruction="
				+ careInstruction + ", fitType=" + fitType + ", color=" + color + ", fileName1=" + fileName1
				+ ", fileName2=" + fileName2 + ", category=" + category + "]";
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
