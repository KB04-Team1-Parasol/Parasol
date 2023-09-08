package kbits.kb04.parasol.info.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kbits.kb04.parasol.finance.dto.DepositDto;
import kbits.kb04.parasol.info.dto.PostDto;
import kbits.kb04.parasol.info.entity.Information;
import kbits.kb04.parasol.info.service.InfoService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/info")
@RequiredArgsConstructor
public class InfoController {
	
	private final InfoService infoService;
	
    // Information 화면
    @GetMapping("/info")
    public ModelAndView getDeposits(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(defaultValue = "3") int pageSize
    ) {
    	Page<PostDto> infoList = infoService.getPosts(page, pageSize);
        ModelAndView modelAndView = new ModelAndView("info/info");
        modelAndView.addObject("infoList", infoList); // 데이터를 모델에 추가
        return modelAndView;
    }
    
    @GetMapping("/info/{detail}")
	public String infoDetail() {
		
		return "info/{detail}";
	}
    
}
