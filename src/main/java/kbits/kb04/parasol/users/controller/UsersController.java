package kbits.kb04.parasol.users.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kbits.kb04.parasol.auth.TokenDto;
import kbits.kb04.parasol.users.dto.LoginRequestDto;
import kbits.kb04.parasol.users.dto.SignUpRequestDto;
import kbits.kb04.parasol.users.entity.UserAsset;
import kbits.kb04.parasol.users.entity.Users;
import kbits.kb04.parasol.users.exception.UsersNotFoundException;
import kbits.kb04.parasol.users.service.UsersService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UsersController {

    private final UsersService userService;

    // 사용자 개인 정보 가져오기 
    @GetMapping("/myinfo")
    public String getUserInfo(Model model) throws UsersNotFoundException {
        // UserService를 통해 사용자 정보를 조회
        // Users user = userService.findByUserId("test"); // user_id가 dndud1024인 사용자 정보 조회
        Users user = userService.findByUserId("d"); // user_id가 dndud1024인 사용자 정보 조회
        UserAsset userAsset = userService.findByUserNo(1);

    	
    	// Model에 사용자 정보를 추가
        model.addAttribute("user", user);
        model.addAttribute("userAsset", userAsset);
        
        System.out.println(user);
        System.out.println("1111");
        // 사용자 정보를 보여줄 JSP 페이지로 이동
        return "user/myinfo"; // myinfo.jsp로 이동
    }
    
    // 로그인 화면
    @GetMapping("/signin")
	public String signin() {
		
		return "user/signin";
	}
    
    // 회원가입 화면
    @GetMapping("/signup")
	public String signup() {
		
		return "user/signup";
	}
    
    // 회원가입 처리
    @PostMapping("/signup_action")
	public String signup_action(@ModelAttribute SignUpRequestDto signupDto, Model model) {
		String id = userService.signUp(signupDto);
		System.out.println("signupDtoId: "+ signupDto.getUser_id());
		System.out.println("signupDtoPw: " + signupDto.getUser_pw());
		System.out.println("signupDtoName: " + signupDto.getUser_name());
		System.out.println("signupDtoAge: " + signupDto.getUser_age());
		model.addAttribute("signupDto", signupDto);
		return "redirect:/user/signin";
	}
    
    // 로그인 처리
    @PostMapping("/login_action")
	public String login_action(@ModelAttribute LoginRequestDto loginDto, Model model) {
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//      String encodePW = encoder.encode(loginDto.getUser_pw());
//      System.out.println(encodePW);
		TokenDto tokenDto = userService.login(loginDto);
		model.addAttribute("tokenDto", tokenDto);
		return "redirect:/index"; // 로그인 성공 시 보여줄 뷰 이름
	}
    
}
