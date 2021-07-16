package SBK.Controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.mail.internet.MimeMessage;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import SBK.DAO.AccountVerifiedDAO;
import SBK.DAO.CartDetailsDAO;
import SBK.DAO.ItemDetailsDAO;
import SBK.DAO.UserDetailsDAO;
import SBK.Model.CartValue;
import SBK.Model.ItemDetails;
import SBK.Model.OTPDetails;
import SBK.Model.OrderConfirmationSender;
import SBK.Model.UserDetails;
import SBK.Utilities.RandomNumberGenerator;

@Controller
@RequestMapping("/")
@PropertySource("classpath:order-confirmation-message.properties")
public class LoginController {
	
	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	@Autowired
	private UserDetailsDAO userInsertor;
	@Autowired
	private AccountVerifiedDAO accountVerfication;
	@Autowired
	private ItemDetailsDAO itemGetter;
	@Autowired 
	private CartDetailsDAO cartIdAdder;
	
	// set up variable to hold the properties
	
	@Autowired
	private Environment env;
	@Autowired
	private JavaMailSender mailSenderObj;
	
	public void sendOTP(String emailId, String otp) {
		mailSenderObj.send(
				new MimeMessagePreparator() {
			
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				mimeMessageHelper.setTo(emailId);
				mimeMessageHelper.setText(env.getProperty("SBK.OTPMessage")+otp);
				mimeMessageHelper.setSubject(env.getProperty("SBK.OTPMessageSubject"));
			}
		});
	}
	@GetMapping("/login")
	public String showMyLoginPage(Model model) {
//		model.addAttribute("cartValue", new CartValue());
		return "login-form1";
		
	}
	
	@GetMapping("/accessdenie")
	public String showMyDeniedPage() {
		
		return "accessdenie";
		
	}
	@GetMapping("")
	public String showHome(Model model, Principal principal) {

//		logger.info("Home Page .");
		
		if(!Objects.isNull(principal)) {
			Date date = new Date();
			System.out.println(date);
			logger.info("-->SBK UserName: "+principal.getName()+" Timing: "+date);
			System.out.println(principal.getName());
			System.out.println("SBK Principal Testing");
		}
		List<ItemDetails> itemDetailsList = new ArrayList<>();
		itemDetailsList = itemGetter.getAllItemDetails();
		List<ItemDetails> temp = new ArrayList<>();
		for(Integer i = 0;i < itemDetailsList.size();i++) {
			if(itemDetailsList.get(i).getCategory().equals("mens")) {
				temp.add(itemDetailsList.get(i));
			}
		}
		List<ItemDetails> temp1 = new ArrayList<>();
		for(Integer i = 0;i < itemDetailsList.size();i++) {
			if(itemDetailsList.get(i).getCategory().equals("kids")) {
				temp1.add(itemDetailsList.get(i));
			}
		}
		List<ItemDetails> temp2 = new ArrayList<>();
		for(Integer i = 0;i < itemDetailsList.size();i++) {
			if(itemDetailsList.get(i).getCategory().equals("ladies")) {
				temp2.add(itemDetailsList.get(i));
			}
		}
		System.out.println(temp2+"<-------------");
		model.addAttribute("kidsItemDetailsList", temp1);
		model.addAttribute("ladiesItemDetailsList", temp2);
		itemDetailsList = temp;
		System.out.println(itemDetailsList+""+itemDetailsList.size()+"");
		ArrayList<String> str = new ArrayList<String>();
		str.add("sasjashjdgksa");
		model.addAttribute("str", str);
		model.addAttribute("mensItemDetailsList", itemDetailsList);
		
		
		
		
		
		return "home";
	}
	@PostMapping("/otp")
	public String getOTP(@Valid  @ModelAttribute("userDetails") UserDetails userDetails, BindingResult theBindingResult, Model model) {
		//Basically Generate OTP Here And Send It using Java Mail Object and there is flag in database 
//		also writes the otp in the database for sake of my eaziness
		
		if (theBindingResult.hasErrors()) {
			model.addAttribute("userDetails",userDetails);
			model.addAttribute("errorMessage","Password Should Contain First Letter Capital And AtLeast One"
			+ " Special Character and Contain a total of Eight and More!");
			return "signup-form1";
		}
		
		
		RandomNumberGenerator generator = new RandomNumberGenerator();
		String number = generator.getRandomNumberString();
		
//		Intially the Flag in the Table is False;
		userDetails.setOtp(number);
		System.out.println(userDetails);	
//		Add All the Data in a table of USer Details
		OTPDetails otpDetails=new OTPDetails();
		model.addAttribute("otpDetails", otpDetails);
		model.addAttribute("emailId", userDetails.getEmailId());
		
		userInsertor.insertDetails(userDetails);
		
		sendOTP(userDetails.getEmailId(), number);
		
		return "signup-verification-form";
	}
	@GetMapping("/signup")
	public String signupPage(Model model) {
		model.addAttribute("userDetails", new UserDetails());
		return "signup-form1";
	}
	@PostMapping("signup/verified")
	public String getVerified(Model model, @ModelAttribute("otpDetails") OTPDetails otpDetails) {
//		System.out.println(userDetails);
		System.out.println(otpDetails);
//		Take Otp from data base and match them with the input otp
//		System.out.println(number);
//		if(otp is matched) return Login Page
		model.addAttribute("emailId", otpDetails.getEmailId());
		model.addAttribute("otpDetails", otpDetails);
		model.addAttribute("errorMessage","You Have Entered Wrong Otp");
		
		
//		if otp is correct redirect to login page and addd one message with them you have succesfully signed up
		
//		When Its Verified Insert the Record in spring Security Tables also;
//		Also update the value verify flag in userdetails table
		
		UserDetails user = userInsertor.getUserDetails(otpDetails.getEmailId());
		System.out.println(user.getOtp()+"and "+otpDetails.getOtp());
		if(user.getOtp().equals(otpDetails.getOtp())) {
			System.out.println("Runnning");
			accountVerfication.insert(user);
			user.setVerifiedChecker(true);
			userInsertor.updateDetails(user);
			
			RandomNumberGenerator random = new RandomNumberGenerator();
			String cartId = random.getRandomNumberString();
			String emailId = otpDetails.getEmailId();
			cartIdAdder.insertCartId(cartId, emailId);
			return "signup-verification-successfull";
		}
		return "signup-verification-failed-form";
	}
	
}