package kbits.kb04.parasol.info.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String signin() {
		List<Information> list = infoService.findAllByInfoNo();
		
		for(Information posts : list) {
			System.out.println(posts.getInfoTitle());
			System.out.println(posts.getInfoContent());
			System.out.println(posts.getInfoDate());
		}
		
		return "info/info";
	}
    
    @GetMapping("/info/{detail}")
	public String infoDetail() {
		
		return "info/{detail}";
	}
    
}
