package SBK.Model;

public class CartValue {
	public CartValue() {
		super();
	}

	public CartValue(Integer value) {
		super();
		this.value = value;
	}

	private Integer value;

	@Override
	public String toString() {
		return "CartValue [value=" + value + "]";
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}
}
