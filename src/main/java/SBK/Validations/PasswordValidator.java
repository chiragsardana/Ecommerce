package SBK.Validations;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordValidator implements ConstraintValidator<Password, String> {
	public boolean isValid(String value, ConstraintValidatorContext context) {
		// TODO Auto-generated method stub
		
		System.out.println(value);
		//Length of Password Greater than 8
		if(value!=null && value.length() >= 8) {
			
			//First Character Capital
			if(!Character.isUpperCase(value.charAt(0))) {
				return false;
			}
			Pattern pattern = Pattern.compile("[a-zA-Z0-9]*");
			Matcher matcher = pattern.matcher(value);
			
			return !matcher.matches();
		}
		return false;
	}
}
