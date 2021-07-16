package SBK.Controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import SBK.DAO.AddressDetailsDAO;
import SBK.DAO.CartDetailsDAO;
import SBK.DAO.CartItemDetailsDAO;
import SBK.DAO.ItemDetailsDAO;
import SBK.DAO.OrderDetailsDAO;
import SBK.DAO.OrderItemListDAO;
import SBK.DAO.UserDetailsDAO;
import SBK.Model.AddressDetails;
import SBK.Model.AddressIdTaker;
import SBK.Model.AddressIdTakerAndItemIdTaker;
import SBK.Model.ItemDetails;
import SBK.Model.OrderConfirmationSender;
import SBK.Model.OrderDetails;
import SBK.Model.UpdateProfileName;
import SBK.Model.UpdateProfilePassword;
import SBK.Model.UserDetails;
import SBK.Utilities.RandomNumberGenerator;

@Controller
@PropertySource("classpath:order-confirmation-message.properties")
public class CartController {
	@Autowired
	private Environment env;
	@Autowired
	private ItemDetailsDAO itemGetter;
	@Autowired 
	private CartDetailsDAO cartIdGetter;
	@Autowired 
	private CartItemDetailsDAO cartItemGetter;
	@Autowired
	private UserDetailsDAO userGetter;
	@Autowired
	private AddressDetailsDAO addressGetter;
	@Autowired
	private JavaMailSender mailSenderObj;
	@Autowired
	private OrderDetailsDAO orderDetailGetter;
	@Autowired
	private OrderItemListDAO orderItemListInsertor;
	
	@GetMapping("cart")
	public String getCartDetails(Model model ,Principal principal) {
		String emailId = principal.getName();
		String cartId = cartIdGetter.getOrderId(emailId);
		List<String> cartItemIds = cartItemGetter.getItemList(cartId);
		List<ItemDetails> cartItemsDetails = new ArrayList<>();
		
		for(Integer i = 0;i < cartItemIds.size();i++) {
			cartItemsDetails.add(itemGetter.getItemDetails(cartItemIds.get(i)));
		}
		System.out.println("Cart Details: "+cartId);
		System.out.println("User Details: "+emailId);
		System.out.println("Items Details: "+cartItemsDetails);
		model.addAttribute("cartItemsDetails", cartItemsDetails);
		Integer price = 0;
		for(Integer i = 0;i < cartItemIds.size();i++) {
			price = price + Integer.parseInt(cartItemsDetails.get(i).getPrice());
		}
		model.addAttribute("price", price);
		return "Protected/cart";
	}
	
	
	@RequestMapping(value="/removeItem/{itemId}", method=RequestMethod.GET)
	public String removeItemFromCart(@PathVariable("itemId") String itemId, Model model, Principal principal) {
		System.out.println("The Item Id is : "+itemId);
		String emailId = principal.getName();
		String cartId = cartIdGetter.getOrderId(emailId);
		cartItemGetter.deleteParticularItemsId(itemId, cartId);
		
		List<String> cartItemIds = cartItemGetter.getItemList(cartId);
		List<ItemDetails> cartItemsDetails = new ArrayList<>();
		
		for(Integer i = 0;i < cartItemIds.size();i++) {
			cartItemsDetails.add(itemGetter.getItemDetails(cartItemIds.get(i)));
		}
		System.out.println("Cart Details: "+cartId);
		System.out.println("User Details: "+emailId);
		System.out.println("Items Details: "+cartItemsDetails);
		model.addAttribute("cartItemsDetails", cartItemsDetails);
		Integer price = 0;
		for(Integer i = 0;i < cartItemIds.size();i++) {
			price = price + Integer.parseInt(cartItemsDetails.get(i).getPrice());
		}
		model.addAttribute("price", price);
		
		return "Protected/cart";
	}
	
	
	
	
	
	
	
	@GetMapping("/payment")
	public String checkOut(Model model ,Principal principal) {
		
		model.addAttribute("addressDetails", new AddressDetails());
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		System.out.println(userDetails);
		model.addAttribute("userDetails", userDetails);
		
		List<AddressDetails> addressList = addressGetter.getAddress(principal.getName());
		System.out.println(addressList);
		model.addAttribute("addressList", addressList);
		
		
		
		
		model.addAttribute("addressIdTaker", new AddressIdTaker());
		
		String emailId = principal.getName();
		String cartId = cartIdGetter.getOrderId(emailId);
		List<String> cartItemIds = cartItemGetter.getItemList(cartId);
		List<ItemDetails> cartItemsDetails = new ArrayList<>();
		
		for(Integer i = 0;i < cartItemIds.size();i++) {
			cartItemsDetails.add(itemGetter.getItemDetails(cartItemIds.get(i)));
		}
		System.out.println("Cart Details: "+cartId);
		System.out.println("User Details: "+emailId);
		System.out.println("Items Details: "+cartItemsDetails);
		model.addAttribute("cartItemsDetails", cartItemsDetails);
		Integer price = 0;
		for(Integer i = 0;i < cartItemIds.size();i++) {
			price = price + Integer.parseInt(cartItemsDetails.get(i).getPrice());
		}
		model.addAttribute("price", price);
		return "Protected/payment";
	}
	
	
	
	
	@PostMapping("/receipt")
	public String getReceipt(Model model, @ModelAttribute("addressIdTaker") AddressIdTaker addressIdTaker, Principal principal) {


		
		
		System.out.println(addressIdTaker);

		AddressDetails addressDetails = addressGetter.getParticularAddress(addressIdTaker.getAddressId());
		System.out.println(addressDetails);
		
		model.addAttribute("addressDetails", addressDetails);
		
		RandomNumberGenerator generator = new RandomNumberGenerator();
		Boolean flag = true;
		
		List<String> orderIdList = orderDetailGetter.getOrderList(principal.getName());
		String orderId = generator.getRandomNumberString();
		while(flag){
			for(Integer i = 0;i < orderIdList.size();i++ ) {
				if(orderId.equals(orderIdList.get(i))) {
					flag = false;
				}
			}
			if(flag =true) {
				break;
			}
			if(flag = false) {
				orderId = generator.getRandomNumberString();
				flag = true;
			}
		}
		
		System.out.println("order Id: "+orderId);
		model.addAttribute("orderId", orderId);
		
		
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		System.out.println(userDetails);
		model.addAttribute("userDetails", userDetails);
		
		List<AddressDetails> addressList = addressGetter.getAddress(principal.getName());
		System.out.println(addressList);
		model.addAttribute("addressList", addressList);
		
		
		String emailId = principal.getName();
		String cartId = cartIdGetter.getOrderId(emailId);
		List<String> cartItemIds = cartItemGetter.getItemList(cartId);
		List<ItemDetails> cartItemsDetails = new ArrayList<>();
		
		for(Integer i = 0;i < cartItemIds.size();i++) {
			cartItemsDetails.add(itemGetter.getItemDetails(cartItemIds.get(i)));
		}
		System.out.println("Cart Details: "+cartId);
		System.out.println("User Details: "+emailId);
		System.out.println("Items Details: "+cartItemsDetails);
		
		
		
		model.addAttribute("cartItemsDetails", cartItemsDetails);
		
//		apply DAO operation to delete it from data base. also
		
		Integer price = 0;
		for(Integer i = 0;i < cartItemIds.size();i++) {
			price = price + Integer.parseInt(cartItemsDetails.get(i).getPrice());
		}
		model.addAttribute("price", price);
		
		OrderConfirmationSender email = new OrderConfirmationSender();
		email.setCustomerUserName(principal.getName());
		sendReceipt(orderId,email);
		
//		Basically Write OrderId with Items in the DataBase and empty the cart now
		
//		orderId varchar(100) not null ,
//		  emailId varchar(100) not null ,
//		  addressId varchar(100) not null ,
		OrderDetails orderDetails = new OrderDetails();
		orderDetails.setOrderId(orderId);
		orderDetails.setEmailId(principal.getName());
		orderDetails.setStatus("Ordered");
		orderDetails.setAddressId(addressIdTaker.getAddressId());
		orderDetailGetter.placeOrder(orderDetails);
		
		
//		Now its time to write items placed in the order
//		cartItemsDetails
		
		for(Integer i = 0;i < cartItemsDetails.size();i++) {
			orderItemListInsertor.insertItems(orderId, cartItemsDetails.get(i));
		}
		
//		Now Empty the Cart
		
		cartItemGetter.deleteItemsId(cartId);
		
		
		return "Protected/receipt";
	}
	public void sendReceipt(String orderId,OrderConfirmationSender email) {
		System.out.println(env.getProperty("sbk.message"));
		mailSenderObj.send(
				new MimeMessagePreparator() {
			
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				mimeMessageHelper.setTo(email.getCustomerUserName());
				mimeMessageHelper.setText(env.getProperty("SBK.orderConfirmationStartingMessage")+" "+orderId+" "+env.getProperty("SBK.orderConfirmationEndingMessage")+"");
				mimeMessageHelper.setSubject(env.getProperty("SBK.orderSubjectMessage"));
			}
		});
	}
	
	
	
	@RequestMapping(value="/addToCart/{itemId}", method=RequestMethod.GET)
	public String addToCartProduct(@PathVariable("itemId") String itemId, Model model, Principal principal) {
		System.out.println("itemId: "+itemId);
		System.out.println();
		String cartId = cartIdGetter.getOrderId(principal.getName());
		ItemDetails itemDetails = itemGetter.getItemDetails(itemId);
		model.addAttribute("itemDetails", itemDetails);
		

		
		//		Now insert the item id in the table
		cartItemGetter.insertItemId(cartId, itemDetails);
		
		
		model.addAttribute("message", "Added to Cart Successfully");
		
		return "AllCanAccess/product";
	}
	
	
	
	
	@RequestMapping(value="/buyNow/{itemId}", method=RequestMethod.GET)
	public String directlyBuyItem(@PathVariable("itemId") String itemId, Model model, Principal principal) {
		
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		System.out.println(userDetails);
		model.addAttribute("userDetails", userDetails);
		
		List<AddressDetails> addressList = addressGetter.getAddress(principal.getName());
		System.out.println(addressList);
		model.addAttribute("addressList", addressList);
		
		model.addAttribute("addressIdTaker", new AddressIdTakerAndItemIdTaker());
		model.addAttribute("itemId", itemId);
		ItemDetails itemDetails = itemGetter.getItemDetails(itemId);
		
		
		
		
		model.addAttribute("itemDetail", itemDetails);
		
		return "Protected/paymentOne";
	}
	
	
	@PostMapping("receiptOne")
	public String getReceiptOne(Model model, @ModelAttribute("addressIdTaker") AddressIdTakerAndItemIdTaker addressIdTaker, Principal principal) {
		System.out.println(addressIdTaker);

		AddressDetails addressDetails = addressGetter.getParticularAddress(addressIdTaker.getAddressId());
		System.out.println(addressDetails);
		
		model.addAttribute("addressDetails", addressDetails);
		
		RandomNumberGenerator generator = new RandomNumberGenerator();
		Boolean flag = true;
		
		List<String> orderIdList = orderDetailGetter.getOrderList(principal.getName());
		String orderId = generator.getRandomNumberString();
		while(flag){
			for(Integer i = 0;i < orderIdList.size();i++ ) {
				if(orderId.equals(orderIdList.get(i))) {
					flag = false;
				}
			}
			if(flag =true) {
				break;
			}
			if(flag = false) {
				orderId = generator.getRandomNumberString();
				flag = true;
			}
		}
		
		System.out.println("order Id: "+orderId);
		model.addAttribute("orderId", orderId);
		
		
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		System.out.println(userDetails);
		model.addAttribute("userDetails", userDetails);
		
		List<AddressDetails> addressList = addressGetter.getAddress(principal.getName());
		System.out.println(addressList);
		model.addAttribute("addressList", addressList);
		
		
		String emailId = principal.getName();
//		String cartId = cartIdGetter.getOrderId(emailId);
//		List<String> cartItemIds = cartItemGetter.getItemList(cartId);
//		List<ItemDetails> cartItemsDetails = new ArrayList<>();
//		
//		for(Integer i = 0;i < cartItemIds.size();i++) {
//			cartItemsDetails.add(itemGetter.getItemDetails(cartItemIds.get(i)));
//		}
		
		
//		System.out.println("Cart Details: "+cartId);
		System.out.println("User Details: "+emailId);
//		System.out.println("Items Details: "+cartItemsDetails);
		
		System.out.println(addressIdTaker);
		ItemDetails itemDetail = itemGetter.getItemDetails(addressIdTaker.getItemId());
		model.addAttribute("itemDetail", itemDetail);
		
//		apply DAO operation to delete it from data base. also
		
		Integer price = 0;
		price = Integer.parseInt(itemDetail.getPrice());
		model.addAttribute("price", price);
		
		OrderConfirmationSender email = new OrderConfirmationSender();
		email.setCustomerUserName(principal.getName());
		sendReceipt(orderId,email);
		List<ItemDetails> cartItemsDetails = new ArrayList<>();
		cartItemsDetails.add(itemDetail);
		model.addAttribute("cartItemsDetails", cartItemsDetails);
		
		OrderDetails orderDetails = new OrderDetails();
		orderDetails.setOrderId(orderId);
		orderDetails.setEmailId(principal.getName());
		orderDetails.setStatus("Ordered");
		orderDetails.setAddressId(addressIdTaker.getAddressId());
		
		orderDetailGetter.placeOrder(orderDetails);
		
		orderItemListInsertor.insertItems(orderId, itemDetail);
		
		
		return "Protected/receipt";
	}
	
	
}
