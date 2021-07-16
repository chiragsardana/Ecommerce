package SBK.Model;

public class StatusChanger {
	public StatusChanger() {
		super();
	}

	public StatusChanger(String status) {
		super();
		this.status = status;
	}

	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "StatusChanger [status=" + status + "]";
	}
}
