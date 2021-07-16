package SBK.Controller;


import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import SBK.DAO.AddressDetailsDAO;
import SBK.DAO.ItemDetailsDAO;
import SBK.DAO.ItemDetailsDAOImpl;
import SBK.DAO.OrderDetailsDAO;
import SBK.DAO.OrderItemListDAO;
import SBK.DAO.UserDetailsDAO;
import SBK.Model.AddressDetails;
import SBK.Model.ItemDetails;
import SBK.Model.OrderDetails;
import SBK.Model.StatusChanger;
import SBK.Model.UserDetails;

@Controller
@RequestMapping("Granted")
public class GrantedController {

	
	@Autowired
	private ItemDetailsDAO itemInsertor;
	@Autowired 
	OrderDetailsDAO orderGetter;
	@Autowired
	private UserDetailsDAO userGetter;
	@Autowired
	private AddressDetailsDAO addressGetter;
	@Autowired
	private OrderItemListDAO orderItemGetter;
	@Autowired
	private ItemDetailsDAO ItemDetailsGetter;
	
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
			
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
//	Basically To Add Product
	@GetMapping("/addProduct")
	public String addProduct(Model model) {
		model.addAttribute("itemDetails", new ItemDetails());
		return "Granted/add-product";
	}
//	Basically Processing Add Product
	@PostMapping("/processingAddProduct")
	public String processingAddProduct(@ModelAttribute("itemDetails") ItemDetails itemDetails, Model model) {
		System.out.println(itemDetails.getItemId());
		System.out.println(itemDetails.getCareInstruction());
		System.out.println(itemDetails.getFileName1());
		System.out.println(itemDetails.getFileName2());
//		Check Validation Here to check whether there exists an itemId already in database.
		List<String> allItemIds = itemInsertor.getAllItemNumber();
		System.out.println("The List is "+allItemIds);
		 itemInsertor.insertItem(itemDetails);
		 model.addAttribute("message", "Items Addded Seccessfully");
		 model.addAttribute("itemDetails", new ItemDetails());
		return "Granted/add-product";
	}
	
	@GetMapping("/allOrders")
	public String getAllOrders(Model model) {
		
		List<OrderDetails> orderDetails = orderGetter.getAllOrderList();
		
		model.addAttribute("orderDetails", orderDetails);
		return "Granted/all-orders";
	}
	
	
	@RequestMapping(value="/viewOrder/{orderId}", method=RequestMethod.GET)
	public String viewOrder(@PathVariable("orderId") String orderId,@ModelAttribute("statusChanger") StatusChanger statusChanger , Model model, Principal principal) {
		
		System.out.println("-->"+statusChanger.getStatus());
		
		String status = statusChanger.getStatus();
		System.out.println(status+"<--");
		if(!Objects.isNull(status)) {
			System.out.println("Status Changin <--");
			orderGetter.changeStatus(status, orderId);
		}
		
		
		
		OrderDetails orderDetails = orderGetter.getOrderDetail(orderId);
		
		UserDetails userDetails = userGetter.getUserDetails(orderDetails.getEmailId());
		System.out.println(userDetails);
		
		
		AddressDetails addressDetail = addressGetter.getParticularAddress(orderDetails.getAddressId()); 
//		
		model.addAttribute("address", addressDetail.getCity()+", "+addressDetail.getState());
		model.addAttribute("contactNumber", addressDetail.getMobileNumber());
		model.addAttribute("firstName", userDetails.getFirstName());
		model.addAttribute("lastNamer", userDetails.getLastName());
		model.addAttribute("emailId", orderDetails.getEmailId());
		System.out.println(orderDetails);
		
		
		List<String> orderItemsList = orderItemGetter.getItemList(orderId);
		
		List<ItemDetails> items = new ArrayList<>();
		
		for(Integer i = 0;i < orderItemsList.size();i++) {
			items.add(ItemDetailsGetter.getItemDetails(orderItemsList.get(i)));
		}
		System.out.println(items);
		model.addAttribute("items", items);
		model.addAttribute("status",orderDetails.getStatus());
		model.addAttribute("statusChanger", statusChanger);
		
		return "Granted/view-order";
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/viewProfile/{emailId}", method=RequestMethod.GET)
	public String viewProfile(@PathVariable("emailId") String emailId, Model model) {
		System.out.println(emailId+" SBK is the email Id");
		if(!Objects.isNull(emailId)) {
			String temp =emailId;
			System.out.println(temp+"<00");
			System.out.println("Status Changin <--");
//			UserDetails userDetails = userGetter.getUserDetails(temp);
//			System.out.println(userDetails);
//			model.addAttribute("userDetails", userDetails);
			
//			List<AddressDetails> addressList = addressGetter.getAddress(temp);
//			System.out.println(addressList);
//			model.addAttribute("addressList", addressList);
			
//			List<String> orderList = orderGetter.getOrderList(temp);
//			System.out.println(orderList);
//			model.addAttribute("orderList", orderList);
//			
//			model.addAttribute("size", orderList.size());
		}
		
		return "Granted/view-profile";
	}
	
	
}
