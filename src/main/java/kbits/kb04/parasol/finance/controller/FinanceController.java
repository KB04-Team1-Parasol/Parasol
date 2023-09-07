// Swagger 적용예정

package kbits.kb04.parasol.finance.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kbits.kb04.parasol.finance.dto.DepositDto;
import kbits.kb04.parasol.finance.dto.SavingDto;
import kbits.kb04.parasol.finance.entity.Deposit;
import kbits.kb04.parasol.finance.repository.DepositRepository;
import kbits.kb04.parasol.finance.service.FinanceService;

@Controller
@RequestMapping("/finance")
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
    
    @GetMapping("/personal")
    public String personalInvest() {
    	
    	return "finance/personal";
    }
    
    @PostMapping("/twoja")
    public String personalInvest(@RequestParam int age, @RequestParam int income) {
    	
    	int sum = age + income;
    	if(sum <2) {
    		return null;
    	} else if(sum <4) {
    		return null;
    	} else {
    		return null;
    	}
    }
    
 	@GetMapping("deposit/{depositNo}")
    public String showDepositDetail(@PathVariable Long depositNo, Model model) {
        Optional<Deposit> optionalDeposit = financeService.findByDepositNo(depositNo);

        if (optionalDeposit.isPresent()) {
            Deposit deposit = optionalDeposit.get();
            model.addAttribute("deposit", deposit);
            return "finance/detail"; // 상세 정보를 보여줄 JSP 페이지 이름
        } else {
            // 데이터를 찾을 수 없을 때의 처리
            return "depositNotFoundPage"; // 상품이 없을 때 보여줄 JSP 페이지 이름
        }
    }
 	
}
