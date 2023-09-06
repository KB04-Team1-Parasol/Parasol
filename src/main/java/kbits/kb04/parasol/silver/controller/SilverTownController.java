package kbits.kb04.parasol.silver.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kbits.kb04.parasol.silver.dto.SearchResponseDto;
import kbits.kb04.parasol.silver.entity.SilverTown;
import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import kbits.kb04.parasol.silver.service.SilverTownService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/silver")
public class SilverTownController {
	private final SilverTownService silverTownService;

	// 실버타운 검색어로 검색
	@GetMapping("/search")
	public String silver_search(@RequestParam("keyword") String keyword, Model model) {
		List<SilverTown> list = silverTownService.searchByKeyword(keyword);
		List<SearchResponseDto> response = new ArrayList<SearchResponseDto>();

		for (SilverTown silverTown : list) {
			List<SilverTownDetail> std = silverTown.getDetails();
			for (SilverTownDetail silverTownDetail : std) {
				String townName = silverTown.getStName();
				String typeName = silverTownDetail.getStdRoomType();
				Integer deposit = silverTownDetail.getStdDeposit();
				Integer monCost = silverTownDetail.getStdMonthlyCost();
				String imgUrl = silverTown.getStImgUrl();
				SearchResponseDto responseDto = new SearchResponseDto(townName, typeName, deposit, monCost, imgUrl);
				response.add(responseDto);
			}
		}

		model.addAttribute("reponseDto", response);

		return "silver/search";
	}

	// 맞춤 실버타운 찾기
	@GetMapping("/custom")
	public String silver_custom() {
		return "silver/custom";
	}

	// 상세보기
	@GetMapping("/detail")
	public String silver_detail(@RequestParam("no") long no, Model model) {
		return "silver/detail";
	}

}
