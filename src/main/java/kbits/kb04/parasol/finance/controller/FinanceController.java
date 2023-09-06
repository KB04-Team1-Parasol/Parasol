// Swagger 적용예정

package kbits.kb04.parasol.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kbits.kb04.parasol.finance.dto.DepositDto;
import kbits.kb04.parasol.finance.service.FinanceService;

@Controller
@RequestMapping("/finance")
public class FinanceController {
	
	private final FinanceService financeService;

    @Autowired
    public FinanceController(FinanceService financeService) {
        this.financeService = financeService;
    }
	
    @GetMapping("/deposits")
    public ModelAndView getDeposits(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(defaultValue = "3") int pageSize
    ) {
    	Page<DepositDto> depositList = financeService.getDeposits(page, pageSize);
        
        ModelAndView modelAndView = new ModelAndView("finance/info");
        modelAndView.addObject("depositList", depositList); // 데이터를 모델에 추가
        return modelAndView;
    }
	
	// 적금 상품 조회

	// 펀드 상품 조회
}
