package kbits.kb04.parasol.info.controller;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kbits.kb04.parasol.auth.SecurityUtil;
import kbits.kb04.parasol.finance.entity.Deposit;
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
    public ModelAndView getInfo(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(defaultValue = "3") int pageSize
    ) {
    	Page<PostDto> infoList = infoService.getPosts(page, pageSize);
        ModelAndView modelAndView = new ModelAndView("info/info");
        modelAndView.addObject("infoList", infoList); // 데이터를 모델에 추가
        System.out.println(infoList);
        return modelAndView;
    }
    
    @GetMapping("/info/{infoNo}")
	public String infoDetail(@PathVariable Long infoNo, Model model) {
    	Optional<Information> infoDetailNo = infoService.findByInfoNo(infoNo);

        if (infoDetailNo.isPresent()) {
        	Information infoDetail = infoDetailNo.get();
            model.addAttribute("infoDetail", infoDetail);
            return "info/detail"; // 상세 정보를 보여줄 JSP 페이지 이름
        } else {
            // 데이터 없을 때
            return "ErrorPage"; // 상품이 없을 때 보여줄 JSP 페이지 이름
        }
	}
    
    
 	
}
