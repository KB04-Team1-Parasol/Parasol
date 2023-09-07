package kbits.kb04.parasol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {
	
	@GetMapping("/index")
	public String hello() {
		
		return "index";
	}

	@GetMapping("/signin")
	public String signin() {
		
		return "signin";
	}
	
	@GetMapping("/information")
	public String information() {
		return "information";
	}
}
