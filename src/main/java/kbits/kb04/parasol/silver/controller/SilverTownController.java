package kbits.kb04.parasol.silver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SilverTownController {
	
	// 실버타운 검색
	@GetMapping("/silver/search")
	public String silver_search() {
		return "silver/search";
	}
	
	//맞춤 실버타운 찾기
	@GetMapping("/silver/custom")
	public String silver_custom() {
		return "silver/custom";
	}
}
