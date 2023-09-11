// Swagger 적용예정
package kbits.kb04.parasol.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.data.domain.Page;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

import kbits.kb04.parasol.finance.dto.DepositDto;
import kbits.kb04.parasol.finance.service.FinanceService;
import kbits.kb04.parasol.finance.repository.DepositRepository;
import kbits.kb04.parasol.finance.dto.PersonalDto;
import kbits.kb04.parasol.finance.dto.SavingDto;
import kbits.kb04.parasol.finance.entity.Deposit;

// import kbits.kb04.parasol.users.dto.SignUpRequestDto;

@Controller
@RequestMapping("/finance")
//@Tag(name = "경제", description = "템플릿 API Document")
public class FinanceController {
	
	private final FinanceService financeService;

    @Autowired
    public FinanceController(FinanceService financeService) {
        this.financeService = financeService;
    }
    @Autowired
    private DepositRepository depositRepository;
	
    /**
     * 1. 예금상품조회
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/deposit")
//    @Operation(summary = "예금상품조회", description = "DB의 예금 상품 출력")
    
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
        Page<SavingDto> bondList = financeService.getSavings(page, pageSize);
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
            return "finance/detail"; // 상세 정보를 보여줄 JSP 페이지 이름
        } else {
            // 데이터 없을 때
            return "depositNotFoundPage"; // 상품이 없을 때 보여줄 JSP 페이지 이름
        }
    }
 	
    

    /**
     * 5. 맞춤 상품 조회 페이지
     * @return
     */
    
    @GetMapping("/personal")
    public String personalInvest() {	
    	
    	
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
    		Model personal
    ) {
    	personal.addAttribute("personal", personalDto); 	
    	//사용자로부터 입력받은 값들을 계산결과 personalDto.Result 에 넣어주기
    	personalDto.setResult(financeService.calculateResult(personalDto));
    	return "finance/result";
    }    

}
