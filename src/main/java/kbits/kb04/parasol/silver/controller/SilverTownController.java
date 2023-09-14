package kbits.kb04.parasol.silver.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kbits.kb04.parasol.silver.dto.SearchRequestDto;
import kbits.kb04.parasol.silver.dto.SearchResponseDto;
import kbits.kb04.parasol.silver.dto.SilverTownCustomResponseDto;
import kbits.kb04.parasol.silver.dto.SilverTownDetailCustomResponseDto;
import kbits.kb04.parasol.silver.dto.SilverTownDetailResponseDto;
import kbits.kb04.parasol.silver.entity.SilverTown;
import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import kbits.kb04.parasol.silver.service.SilverTownService;
import kbits.kb04.parasol.users.entity.Users;
import kbits.kb04.parasol.users.enums.UserAssetStatus;
import kbits.kb04.parasol.users.service.UsersService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/silver")
public class SilverTownController {
	private final SilverTownService silverTownService;
	// 실버타운 검색어로 검색
	private final UsersService usersService;

	// 실버타운 검색 메뉴 클릭시 이동
	@GetMapping("/search")
	public String silver_search(Model model) {
		List<SilverTownDetail> list = silverTownService.townList();
		List<SearchResponseDto> response = new ArrayList<SearchResponseDto>();

		for (SilverTownDetail silverTownDetail : list) {
			String townName = silverTownDetail.getSilverTown().getStName();
			String typeName = silverTownDetail.getStdRoomType();
			Integer deposit = silverTownDetail.getStdDeposit();
			Integer monCost = silverTownDetail.getStdMonthlyCost();
			String imgUrl = silverTownDetail.getSilverTown().getStImgUrl();
			Long stdNo = silverTownDetail.getStdNo();

			SearchResponseDto responseDto = new SearchResponseDto(townName, typeName, deposit, monCost, imgUrl, stdNo);
			response.add(responseDto);
		}
		model.addAttribute("responseDto", response);

		return "silver/search";
	}

	// 검색창에서 실버타운 검색어로 검색
	@GetMapping("/search_keyword")
	public String silver_keyword_search(@RequestParam("keyword") String keyword, Model model) {
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
				Long stdNo = silverTownDetail.getStdNo();

				SearchResponseDto responseDto = new SearchResponseDto(townName, typeName, deposit, monCost, imgUrl,
						stdNo);
				response.add(responseDto);
			}
		}

		model.addAttribute("responseDto", response);

		return "silver/search";
	}

	// 실버타운 필터링 검색
	@PostMapping("/search")
	public String silver_filter_search(SearchRequestDto requestDto, Model model) {
		List<SilverTownDetail> list = silverTownService.searchByFilter(requestDto);
		List<SearchResponseDto> response = new ArrayList<SearchResponseDto>();

		for (SilverTownDetail silverTownDetail : list) {
			String townName = silverTownDetail.getSilverTown().getStName();
			String typeName = silverTownDetail.getStdRoomType();
			Integer deposit = silverTownDetail.getStdDeposit();
			Integer monCost = silverTownDetail.getStdMonthlyCost();
			String imgUrl = silverTownDetail.getSilverTown().getStImgUrl();
			Long stdNo = silverTownDetail.getStdNo();

			SearchResponseDto responseDto = new SearchResponseDto(townName, typeName, deposit, monCost, imgUrl, stdNo);
			response.add(responseDto);
		}
		model.addAttribute("responseDto", response);

		return "silver/search";
	}

	// 맞춤 실버타운 찾기(필터링)
	@GetMapping("/custom")
	public String silver_custom(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// 로그인 정보 없을 때
		if (!isUserLoggedIn(authentication, model)) {
			return "common/confirm";
		}

		// 자산 정보 없을 때
		if (!isUserAssetInputComplete(authentication, model)) {
			return "common/confirm";
		}

		return "silver/custom_filter";
	}

	// 맞춤 실버타운 찾기(리스트)
	@PostMapping("/custom")
	public String silver_custom_list(SearchRequestDto requestDto, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Users user = usersService.findByUserId(authentication.getName());

		// 로그인 정보 없을 때
		if (!isUserLoggedIn(authentication, model)) {
			return "common/confirm";
		}

		// 자산 정보 없을 때
		if (!isUserAssetInputComplete(authentication, model)) {
			return "common/confirm";
		}

		List<SilverTownCustomResponseDto> silverTownCustomList = silverTownService.getSilverTownFiltering(user,
				requestDto);
		model.addAttribute("silverTownCustomList", silverTownCustomList);

		return "silver/custom_list";
	}

	// 상세보기(순수 검색)
	@GetMapping("/detail/{std_no}")
	public String silver_detail(@PathVariable("std_no") long std_no, Model model) {
		SilverTownDetailResponseDto dto = silverTownService.getSilverTownDetail(std_no);
		model.addAttribute("dto", dto);

		return "silver/detail";
	}

	// 상세보기(맞춤 검색)
	@GetMapping("/detail_custom/{std_no}")
	public String silver_detail_custom(@PathVariable("std_no") long std_no, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Users user = usersService.findByUserId(authentication.getName());

		// 로그인 정보 없을 때
		if (!isUserLoggedIn(authentication, model)) {
			return "common/confirm";
		}

		// 자산 정보 없을 때
		if (!isUserAssetInputComplete(authentication, model)) {
			return "common/confirm";
		}

		SilverTownDetailCustomResponseDto dto = silverTownService.getSilverTownDetailCustom(std_no, user);
		model.addAttribute("dto", dto);

		return "silver/detail";
	}

	// 로그인 상태를 확인하고 필요한 메시지 및 URL을 설정하여 처리하는 함수
	private boolean isUserLoggedIn(Authentication authentication, Model model) {
		if (authentication.getName().equals("anonymousUser")) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다. 로그인 창으로 이동하시겠습니까?");
			model.addAttribute("url", "/user/login");
			return false;
		}
		return true;
	}

	// 사용자 자산 정보 상태를 확인하고 필요한 메시지 및 URL을 설정하여 처리하는 함수
	private boolean isUserAssetInputComplete(Authentication authentication, Model model) {
		Users user = usersService.findByUserId(authentication.getName());
		if (user.getUserAssetStatus() == UserAssetStatus.INPUT_NO) {
			model.addAttribute("msg", "자산 정보 입력이 필요한 서비스입니다. 자산 정보 기입창으로 이동하시겠습니까?");
			model.addAttribute("url", "/user/assetinput");
			return false;
		}
		return true;
	}

}
