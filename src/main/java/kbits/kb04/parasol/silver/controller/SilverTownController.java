package kbits.kb04.parasol.silver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SilverTownController {

	// 실버타운 검색어로 검색
	@GetMapping("/silver/search")
	public String silver_search(@RequestParam("keyword") String keyword) {

		return "silver/search";
	}

	// 맞춤 실버타운 찾기
	@GetMapping("/silver/custom")
	public String silver_custom() {
		return "silver/custom";
	}

	// 상세보기
	@GetMapping("/silver/detail")
	public String silver_detail(@RequestParam("no") long no, Model model) {
		return "silver/detail";
	}

}
