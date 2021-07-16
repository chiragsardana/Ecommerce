package SBK.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@PropertySource("classpath:order-confirmation-message.properties")
public class OrderConfirmationSender {

	@Autowired
	private Environment env;
	public OrderConfirmationSender() {
		super();
	}
	// set up variable to hold the properties
	
		public OrderConfirmationSender(Environment env, String customerUserName, String orderId, String customerName) {
		super();
		this.customerUserName = customerUserName;
		this.orderId = orderId;
		this.customerName = customerName;
	}
//		sbk.ordermesssage
//		System.out.println(env.getProperty("sbk.ordermesssage"));
		private String customerUserName;//Customer UserName
		private String orderId;//Order ID
		private String customerName;//Customer Name

		public String getCustomerUserName() {
			return customerUserName;
		}

		public void setCustomerUserName(String customerUserName) {
			this.customerUserName = customerUserName;
		}

		public String getOrderId() {
			return orderId;
		}

		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}

		public String getFileName() {
			return customerName;
		}

		public void setFileName(String fileName) {
			this.customerName = customerName;
		}
}
