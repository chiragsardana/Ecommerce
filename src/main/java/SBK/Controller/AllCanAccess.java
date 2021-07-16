package SBK.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import SBK.DAO.ItemDetailsDAO;
import SBK.Model.ItemDetails;
import SBK.Utilities.Covid19FAQ;

@Controller
@RequestMapping("AllCanAccess")
public class AllCanAccess {
	
	@Autowired
	private ItemDetailsDAO itemGetter;
	
	@GetMapping("/aboutUs")
	public String aboutUs(Model model) {
		return "AllCanAccess/about-us";
	}
	
	@GetMapping("/products")
	public String viewAllProduct(Model model) {
		List<ItemDetails> itemDetailsList = new ArrayList<>();
		itemDetailsList = itemGetter.getAllItemDetails();
		System.out.println(itemDetailsList+""+itemDetailsList.size()+"");
		ArrayList<String> str = new ArrayList<String>();
		str.add("sasjashjdgksa");
		model.addAttribute("str", str);
		model.addAttribute("itemDetailsList", itemDetailsList);
		model.addAttribute("SBK", "SBK is Hero");
		return "AllCanAccess/products";
	}
	@GetMapping("/products/mens")
	public String viewAllMensProduct(Model model) {
		List<ItemDetails> itemDetailsList = new ArrayList<>();
		itemDetailsList = itemGetter.getAllItemDetails();
		System.out.println(itemDetailsList+""+itemDetailsList.size()+"");
		ArrayList<String> str = new ArrayList<String>();
		
		List<ItemDetails> temp = new ArrayList<>();
		for(Integer i = 0;i < itemDetailsList.size();i++) {
			if(itemDetailsList.get(i).getCategory().equals("mens")) {
				temp.add(itemDetailsList.get(i));
			}
		}
		itemDetailsList = temp;
		str.add("sasjashjdgksa");
		model.addAttribute("str", str);
		model.addAttribute("itemDetailsList", itemDetailsList);
		model.addAttribute("SBK", "SBK is Hero");
		return "AllCanAccess/productsMen";
	}
	@GetMapping("/products/ladies")
	public String viewAllLadiesProduct(Model model) {
		List<ItemDetails> itemDetailsList = new ArrayList<>();
		itemDetailsList = itemGetter.getAllItemDetails();
		System.out.println(itemDetailsList+""+itemDetailsList.size()+"");
		ArrayList<String> str = new ArrayList<String>();
		
		List<ItemDetails> temp = new ArrayList<>();
		for(Integer i = 0;i < itemDetailsList.size();i++) {
			if(itemDetailsList.get(i).getCategory().equals("ladies")) {
				temp.add(itemDetailsList.get(i));
			}
		}
		itemDetailsList = temp;
		str.add("sasjashjdgksa");
		model.addAttribute("str", str);
		model.addAttribute("itemDetailsList", itemDetailsList);
		model.addAttribute("SBK", "SBK is Hero");
		return "AllCanAccess/productsLadies";
	}
	@GetMapping("/products/kids")
	public String viewAllKidsProduct(Model model) {
		List<ItemDetails> itemDetailsList = new ArrayList<>();
		itemDetailsList = itemGetter.getAllItemDetails();
		System.out.println(itemDetailsList+""+itemDetailsList.size()+"");
		ArrayList<String> str = new ArrayList<String>();
		
		List<ItemDetails> temp = new ArrayList<>();
		for(Integer i = 0;i < itemDetailsList.size();i++) {
			if(itemDetailsList.get(i).getCategory().equals("kids")) {
				temp.add(itemDetailsList.get(i));
			}
		}
		itemDetailsList = temp;
		str.add("sasjashjdgksa");
		model.addAttribute("str", str);
		model.addAttribute("itemDetailsList", itemDetailsList);
		model.addAttribute("SBK", "SBK is Hero");
		return "AllCanAccess/productsKids";
	}
//	Basically to see product
	@RequestMapping(value="/product/{itemId}", method=RequestMethod.GET)
	public String viewProduct(@PathVariable("itemId") String itemId, Model model) {
		System.out.println(itemId);
		ItemDetails itemDetails = itemGetter.getItemDetails(itemId);
		System.out.println(itemDetails.getItemName());
		System.out.println(itemDetails.getItemId());
		model.addAttribute("itemDetails", itemDetails);
		return "AllCanAccess/product";
	}
	@GetMapping("sale")
	public String sale(Model model) {
		List<ItemDetails> itemDetailsList = new ArrayList<>();
		itemDetailsList = itemGetter.getAllItemDetails();
		List<ItemDetails> temp = new ArrayList<>();
		for(Integer i = 0;i < itemDetailsList.size();i++) {
			if(itemDetailsList.get(i).getCategory().equals("sale")) {
				temp.add(itemDetailsList.get(i));
			}
		}
		itemDetailsList = temp;
		System.out.println(itemDetailsList+""+itemDetailsList.size()+"");
		ArrayList<String> str = new ArrayList<String>();
		str.add("sasjashjdgksa");
		model.addAttribute("str", str);
		model.addAttribute("itemDetailsList", itemDetailsList);
		model.addAttribute("SBK", "SBK is Hero");
		return "AllCanAccess/exclusive-products";
	}
	@GetMapping("/contact")
	public String contact(Model model) {
		return "AllCanAccess/contact-form";
	}

	@GetMapping("/helpCenter")
	public String getHelpCenter(Model model) {
		return "AllCanAccess/help-center";
	}
	@GetMapping("/covid19")
	public String getCovid19FAQ(Model model) {
		Covid19FAQ covid19 = new Covid19FAQ();
		covid19.setQuestion("Can A Person GET VACINATED WITHOUT VACINATION ?");
		covid19.setAnswer("REGISTRATION IS MANDATORY ONLY AFTER REGISTRATION, THE INFORMATION ON"
				+ " THESESSION SITE & TIME WILL BE SHARED");
		model.addAttribute("covid19", covid19);
		
		return "AllCanAccess/covid19-faq";
	}
}
