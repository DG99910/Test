package com.green.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public  String  home( Model model ) {		
		model.addAttribute("name", "윈터" );
		model.addAttribute("tel",  "010-1234-5678" );
		return  "home";     //  /WEB-INF/views/home.jsp
	}
	
	@RequestMapping("/List")
	public  String  list(Model model) {
		model.addAttribute("name", "미나" );
		model.addAttribute("tel",  "010-4321-5678" );
		return  "list";
	}
}







