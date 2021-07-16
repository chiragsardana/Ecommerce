package SBK.Controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Role;
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

import SBK.DAO.AccountVerifiedDAO;
import SBK.DAO.AddressDetailsDAO;
import SBK.DAO.ItemDetailsDAO;
import SBK.DAO.OrderDetailsDAO;
import SBK.DAO.OrderItemListDAO;
import SBK.DAO.UserDetailsDAO;
import SBK.Model.AddressDetails;
import SBK.Model.ItemDetails;
import SBK.Model.OrderConfirmationSender;
import SBK.Model.OrderDetails;
import SBK.Model.UpdateProfileName;
import SBK.Model.UpdateProfilePassword;
import SBK.Model.UserDetails;
import SBK.Utilities.RandomNumberGenerator;

@Controller
@RequestMapping("Protected")
public class DemoController {
	
	// set up variable to hold the properties
	
		
	@Autowired
	private JavaMailSender mailSenderObj;
	@Autowired
	private UserDetailsDAO userGetter;
	@Autowired
	private AccountVerifiedDAO accountVerfication;
	@Autowired
	private AddressDetailsDAO addressGetter;
	@Autowired
	private OrderDetailsDAO orderGetter;
	@Autowired
	private OrderItemListDAO orderItemGetter;
	@Autowired
	private ItemDetailsDAO ItemDetailsGetter;
	
	
	
	
	

	
	

	
	
	
	
	

	@GetMapping("/updateProfile")
	public String updateProfile(Model model, Principal principal) {
		System.out.println(principal.getName());
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		System.out.println("-->"+userDetails);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("updateProfileName", new UpdateProfileName());
		model.addAttribute("updateProfilePassword", new UpdateProfilePassword());
		
		List<AddressDetails> addressList = addressGetter.getAddress(principal.getName());
		System.out.println(addressList);
		model.addAttribute("addressList", addressList);
		System.out.println(addressList+"<--");
		model.addAttribute("addressDetails", new AddressDetails());
		return "Protected/update-profile";
	}
	@PostMapping("/updateProfile1")
	public String updateName(Model model,Principal principal, @ModelAttribute("updateProfileName") UpdateProfileName updateProfileName) {
		System.out.println(principal.getName()+updateProfileName);
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		userDetails.setFirstName(updateProfileName.getFirstName());
		userDetails.setLastName(updateProfileName.getLastName());
		System.out.println(updateProfileName);
		userGetter.updateDetails(userDetails);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("updateProfileName", new UpdateProfileName());
		model.addAttribute("updateProfilePassword", new UpdateProfilePassword());
		
		List<AddressDetails> addressList = addressGetter.getAddress(principal.getName());
		System.out.println(addressList);
		model.addAttribute("addressList", addressList);
		System.out.println(addressList+"<--");
		model.addAttribute("addressDetails", new AddressDetails());
		return "Protected/update-profile";
	}
	@PostMapping("/updateProfile2")
	public String updatePassword(Model model,Principal principal, @ModelAttribute("updateProfilePassword") UpdateProfilePassword updateProfilePassword) {
		System.out.println(updateProfilePassword);
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		model.addAttribute("userDetails", userDetails);
		if(updateProfilePassword.getPassword().equals(updateProfilePassword.getConfirmPassword())){
			userDetails.setPassword(updateProfilePassword.getPassword());
			accountVerfication.update(userDetails);
			userGetter.updateDetails(userDetails);
			model.addAttribute("errorMessage", "Password Changed");
		}else {
			model.addAttribute("errorMessage", "password not matched");
		}
		
		model.addAttribute("addressDetails", new AddressDetails());
		List<AddressDetails> addressList = addressGetter.getAddress(principal.getName());
		System.out.println(addressList);
		model.addAttribute("addressList", addressList);
		System.out.println(addressList+"<--");
		
		model.addAttribute("updateProfileName", new UpdateProfileName());
		model.addAttribute("updateProfilePassword", new UpdateProfilePassword());
		return "Protected/update-profile";
		
	}
	@PostMapping("/updateProfile3")
	public String addNewAddress(Model model, Principal principal, @ModelAttribute("addressDetails") AddressDetails addressDetails) {
		
		
		System.out.println(principal.getName());
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		System.out.println("-->"+userDetails);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("updateProfileName", new UpdateProfileName());
		model.addAttribute("updateProfilePassword", new UpdateProfilePassword());
		
		
		
		RandomNumberGenerator generator = new RandomNumberGenerator();
		Boolean flag = true;
		List<AddressDetails> addressList = addressGetter.getAddress(principal.getName());
		System.out.println(addressList);
		String addressId = generator.getRandomNumberString();
		while(flag){
			for(Integer i = 0;i < addressList.size();i++ ) {
				if(addressId.equals(addressList.get(i).getAddressId())) {
					flag = false;
				}
			}
			if(flag =true) {
				break;
			}
			if(flag = false) {
				addressId = generator.getRandomNumberString();
				flag = true;
			}
		}
		
		addressDetails.setEmailId(principal.getName());
		addressDetails.setAddressId(addressId);
		
		System.out.println(addressDetails);
		addressGetter.insertAddress(addressDetails);
		
		addressList = addressGetter.getAddress(principal.getName());
		model.addAttribute("addressList", addressList);
		System.out.println(addressList+"   BY SBK <--");
		
		
		return "Protected/update-profile";
	}
	@GetMapping("/orderHistory")
	public String orderHistory(Model model) {
		return "order-history";
	}
	
	
	
	
	
	
	
	
//	Admin Case
	@RequestMapping(value="/viewOrder/{orderId}", method=RequestMethod.GET)
	public String viewOrder(@PathVariable("orderId") String orderId, Model model, Principal principal) {
		
		
		OrderDetails orderDetails = orderGetter.getOrderDetail(orderId);
		
		
		
		List<String> orderItemsList = orderItemGetter.getItemList(orderId);
		
		HashSet<String> temp = new HashSet<>();
		for(Integer i = 0;i < orderItemsList.size();i++) {
			temp.add(orderItemsList.get(i));
		}
		
		System.out.println("The List of Items: "+temp);
		ArrayList<String> temp1 = new ArrayList<>();
		for (String i : temp) 
            temp1.add(i);
		orderItemsList = temp1;
		
//		User Details
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		
		
		model.addAttribute("firstName", userDetails.getFirstName());
		
		model.addAttribute("lastName", userDetails.getLastName());
		
		AddressDetails addressDetail = addressGetter.getParticularAddress(orderDetails.getAddressId()); 
		
		model.addAttribute("contactNumber",addressDetail.getMobileNumber() );
		
		model.addAttribute("address",""+addressDetail.getCity()+", "+addressDetail.getState());
		
		System.out.println(orderDetails+" and "+orderItemsList+addressDetail);
		
		
		model.addAttribute("orderId", orderDetails.getOrderId());
		
		
		
		
		List<ItemDetails> items = new ArrayList<>();
		
		for(Integer i = 0;i < orderItemsList.size();i++) {
			items.add(ItemDetailsGetter.getItemDetails(orderItemsList.get(i)));
		}
		System.out.println(items);
		model.addAttribute("items", items);
		model.addAttribute("status",orderDetails.getStatus());
		
		return "Protected/view-order";
	}
	
	
	
//	User and Admin Both
	@RequestMapping(value="/viewProfile/{emailId}", method=RequestMethod.GET)
	public String viewProfile(@PathVariable("emailId") String emailId, Model model, Principal principal) {
//		System.out.println("-->"+emailId+" is the emaid id"+principal.getName());
		UserDetails userDetails = userGetter.getUserDetails(principal.getName());
		System.out.println(userDetails);
		model.addAttribute("userDetails", userDetails);
		
		List<AddressDetails> addressList = addressGetter.getAddress(principal.getName());
		System.out.println(addressList);
		model.addAttribute("addressList", addressList);
		
		List<String> orderList = orderGetter.getOrderList(principal.getName());
		System.out.println(orderList);
		model.addAttribute("orderList", orderList);
		
		model.addAttribute("size", orderList.size());
		
		return "Protected/view-profile";
	}
	
	
	
	@GetMapping("/access-denied")
	public String showAccessDenied() {
		
		return "access-denied";
		
	}
}