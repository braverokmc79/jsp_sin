package config;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;


public class MyValidatorFactory {

	//유효성체크
	public static Validator createValidator(){
		ValidatorFactory factory=Validation.buildDefaultValidatorFactory();
		return factory.getValidator();
	}
	
	
	
	
}





