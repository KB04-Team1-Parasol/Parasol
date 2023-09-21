// Swagger 적용예정
package kbits.kb04.parasol.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import kbits.kb04.parasol.auth.SecurityUtil;
import kbits.kb04.parasol.finance.dto.BondDto;
import kbits.kb04.parasol.finance.dto.DepositDto;
import kbits.kb04.parasol.finance.service.FinanceService;
import kbits.kb04.parasol.silver.service.*;
import kbits.kb04.parasol.users.dto.AssetInputRequestDto;
import kbits.kb04.parasol.users.dto.UsersDto;
import kbits.kb04.parasol.users.entity.UserAsset;
import kbits.kb04.parasol.users.entity.Users;
import kbits.kb04.parasol.users.enums.UserAssetStatus;
import kbits.kb04.parasol.users.service.UsersService;
import lombok.RequiredArgsConstructor;
import kbits.kb04.parasol.finance.repository.DepositRepository;
import kbits.kb04.parasol.finance.dto.PersonalDto;
import kbits.kb04.parasol.finance.dto.SavingDto;
import kbits.kb04.parasol.finance.entity.Bond;
import kbits.kb04.parasol.finance.entity.Deposit;
import kbits.kb04.parasol.finance.entity.Saving;

// import kbits.kb04.parasol.users.dto.SignUpRequestDto;

@Controller
@RequestMapping("/finance")
@RequiredArgsConstructor
public class FinanceController {
	
	@Autowired
	private final FinanceService financeService;
	private final UsersService userService;

    /**
     * 1. 예금상품조회
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/deposit")
    public ModelAndView getDeposits(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(defaultValue = "3") int pageSize
    ) {
    	Page<DepositDto> depositList = financeService.getDeposits(page, pageSize);
        ModelAndView modelAndView = new ModelAndView("finance/deposit");
        modelAndView.addObject("depositList", depositList); // 데이터를 모델에 추가
        return modelAndView;
    }
	
    
	/**
	 * 2.적금상품조회
	 * @param page
	 * @param pageSize
	 * @return
	 */
    @GetMapping("/saving")
    public ModelAndView getSavings(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(defaultValue = "3") int pageSize
    ) {
        Page<SavingDto> savingList = financeService.getSavings(page, pageSize);
        ModelAndView modelAndView = new ModelAndView("finance/saving");
        modelAndView.addObject("savingList", savingList); // 데이터를 모델에 추가
        return modelAndView;
    }
    
    
    
    /**
	 * 3. 채권상품조회
	 * @param page
	 * @param pageSize
	 * @return
	 */

    @GetMapping("/bond")
    public ModelAndView getbonds(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(defaultValue = "3") int pageSize
    ) {
        Page<BondDto> bondList = financeService.getBonds(page, pageSize);
        ModelAndView modelAndView = new ModelAndView("finance/bond");
        modelAndView.addObject("bondList", bondList); // 데이터를 모델에 추가
        return modelAndView;
    }
    

    /**
     * 5. 예금 상품 상세 조회
     * @param depositNo
     * @param model
     * @return
     */
    @GetMapping("deposit/{depositNo}")
    public String showDepositDetail(@PathVariable Long depositNo, Model model) {
        Optional<Deposit> optionalDeposit = financeService.findByDepositNo(depositNo);

        if (optionalDeposit.isPresent()) {
            Deposit deposit = optionalDeposit.get();
            model.addAttribute("deposit", deposit);
            return "finance/depositDetail"; // 상세 정보를 보여줄 JSP 페이지 이름
        } else {
            // 데이터 없을 때
            return "depositNotFoundPage"; // 상품이 없을 때 보여줄 JSP 페이지 이름
        }
    }
    
    @GetMapping("saving/{savingNo}")
    public String showSavingDetail(@PathVariable Long savingNo, Model model) {
        Optional<Saving> optionalSaving = financeService.findBySavingNo(savingNo);

        if (optionalSaving.isPresent()) {
            Saving saving = optionalSaving.get();
            model.addAttribute("saving", saving);
            return "finance/savingDetail"; // 상세 정보를 보여줄 JSP 페이지 이름
        } else {
            // 데이터 없을 때
            return "depositNotFoundPage"; // 상품이 없을 때 보여줄 JSP 페이지 이름
        }
    }
    
    @GetMapping("bond/{bondNo}")
    public String showBondDetail(@PathVariable Long bondNo, Model model) {
        Optional<Bond> optionalBond = financeService.findBybondNo(bondNo);
        LocalDate now = LocalDate.now();
        int nyear = (now.getYear()-2000) * 12;	// 23년 X 12월 = 276년
        int nmonth = now.getMonthValue();
        int nnyear = now.getYear();
        int summonth = nyear + nmonth;	// OO년 X 12 + OO월  ex) 23*12 + 9
        
        
        if (optionalBond.isPresent()) {
            Bond bond = optionalBond.get();
            
            int money = Math.round(( (((bond.getYear() - nnyear) * 12 + bond.getMonth() ) / 12 * bond.getBondRate() ) +100) * 100000 );
            NumberFormat format = NumberFormat.getInstance();
            String formattedMoney = format.format(money);
            model.addAttribute("money", formattedMoney);
            
            System.out.println( Math.round(( (((bond.getYear() - nnyear) * 12 + bond.getMonth() ) / 12 * bond.getBondRate() ) +100) * 100000 ));
//            Math.round(( ((bond.year - currentYear) * 12 + bond.month)  / 12 * bond.bondRate +100) * 100000)
//            ${(bond.year - currentYear) * 12 + bond.month }
            model.addAttribute("bond", bond);
            model.addAttribute("currentYear", LocalDate.now().getYear());
            model.addAttribute("nyear", nyear);
            return "finance/bondDetail"; // 상세 정보를 보여줄 JSP 페이지 이름
        } else {
            return "depositNotFoundPage"; // 상품이 없을 때 보여줄 JSP 페이지 이름
        }
    }
 	
    

    /**
     * 5. 맞춤 상품 조회 페이지
     * 회원일 경우 설문지로 넘기기, 회원이 아니라면 로그인으로 바로 이동하기
     * 
     * @return
     */
    
	// 맞춤 실버타운 찾기(필터링)
	@GetMapping("/personal")
	public String finance_custom(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// 로그인 정보 없을 때
		if (!isUserLoggedIn(authentication, model)) {
			return "common/confirm";
		}

		// 자산 정보 없을 때
		if (!isUserAssetInputComplete(authentication, model)) {
			return "common/confirm";
		}
		
		Users user = userService.findByUserId(SecurityUtil.getCurrentUserId()); 
    	String uname = user.getUserName();
    	
    	model.addAttribute("uname", uname);

		return "finance/personal";
	}
    
    
    /**
     * 6. 맞춤 상품 페이지의 결과 페이지
     * @param personalDto
     * @return
     */
    @PostMapping("/personal/result")
    public String personalInvestAction
    (@ModelAttribute("toja")
    		PersonalDto personalDto,
    		UsersDto usersdto,
    		AssetInputRequestDto assetdto,
    		Model model
    ) {
    	// 설문 결과
    	model.addAttribute("personal", personalDto); 	
    	System.out.println("설문 dto" + personalDto);
    	//사용자로부터 입력받은 값들을 계산결과 personalDto.Result 에 넣어주기
    	personalDto.setResult(financeService.calculateResult(personalDto));
    
    	Users user = userService.findByUserId(SecurityUtil.getCurrentUserId()); 
    	UserAsset userAsset = userService.findByUserNo(user.getUserNo());
    	Long monthIncome = userAsset.getMonthlyIncome();
    	String uname = user.getUserName();
    	
    	System.out.println("월수입"+ monthIncome);
    	BondDto recommendedBond = financeService.bondRecommendation(personalDto);
    	DepositDto recommendedDeposit = financeService.depositRecommendation(personalDto);
    	SavingDto recommendedSaving = financeService.savingRecommendation(personalDto, monthIncome);
    	// UsersDto currentUser = UsersService
    	
    	
    	model.addAttribute("recommendedBond", recommendedBond);
    	model.addAttribute("recommendedDeposit", recommendedDeposit);
    	model.addAttribute("recommendedSaving", recommendedSaving);
    	model.addAttribute("uname", uname);
    	
    	System.out.println("넘겨줄채권 " + recommendedBond);
    	System.out.println("넘겨줄예금 " + recommendedDeposit);
    	System.out.println("넘겨줄적금 " + recommendedSaving);
    	return "finance/result";
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
 		Users user = userService.findByUserId(authentication.getName());
 		if (user.getUserAssetStatus() == UserAssetStatus.INPUT_NO) {
 			model.addAttribute("msg", "자산 정보 입력이 필요한 서비스입니다. 자산 정보 기입창으로 이동하시겠습니까?");
 			model.addAttribute("url", "/user/assetinput");
 			return false;
 		}
 		return true;
 	}
    

}
