package net.macaronics.web.controll.factory;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.IndexAction;
import net.macaronics.web.controll.ProductDetailAction;
import net.macaronics.web.controll.ProductKindAction;
import net.macaronics.web.controll.action.Action;

public class ActionFactory {
	final Logger logger =LogManager.getLogger(ActionFactory.class);
	//싱글톤설정
	private static ActionFactory instance;
	private ActionFactory(){
		super();
	}
	public static ActionFactory getInstance(){
		if(instance==null){
			instance=new ActionFactory();
		}
		return instance;
	}
	
	
	//command 에서 넘어온 파라미터 값이 존재하면 실행
	//즉 ,존재하면 url 만 실행된다. 
	public Action getAction(String command){
		Action action=null;
		logger.info("ActionFactory : {}  ", command);
		
		if(command.equals("index")) action=new IndexAction();  
		else if(command.equals("product_detail")) action=new ProductDetailAction();
		else if(command.equals("category")) action=new ProductKindAction();
		
		return action;
	}
	
	
}
