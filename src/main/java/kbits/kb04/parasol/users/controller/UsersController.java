package kbits.kb04.parasol.users.controller;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import io.jsonwebtoken.io.IOException;
import kbits.kb04.parasol.auth.SecurityUtil;
import kbits.kb04.parasol.auth.TokenDto;
import kbits.kb04.parasol.users.dto.AssetInputRequestDto;

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

    // 마이페이지에서 기본 정보, 자산 정보 조회
    @GetMapping("/myinfo")
    public String getUserInfo(Model model) throws UsersNotFoundException {
        // UserService를 통해 사용자 정보를 조회
        Users user = userService.findByUserId(SecurityUtil.getCurrentUserId()); 
        UserAsset userAsset = userService.findByUserNo(user.getUserNo());

    	// Model에 사용자 정보를 추가
        model.addAttribute("user", user);
        model.addAttribute("userAsset", userAsset);
        
        // 사용자 정보를 보여줄 JSP 페이지로 이동
        return "user/myinfo"; // myinfo.jsp로 이동
    }
    
    // 마이페이지 -> 자산정보 기입 페이지로 이동
    @GetMapping("/assetinput")
    public String showAssetInputForm(Model model) {
        // 자산 정보 입력 폼을 보여주는 로직 추가
        return "user/assetinput"; // JSP 파일의 경로와 이름
    }
    
    
    // 
    @PostMapping("/assetinput_action")
    public String saveAssetInputForm(@ModelAttribute AssetInputRequestDto assetInputDto
    		,Model model) {
        // 폼에서 입력된 자산 정보를 서비스에 전달하여 저장 및 업데이트
        userService.assetInput(assetInputDto);
        return "redirect:/user/myinfo"; // 입력 후 다시 마이 페이지로 리디렉션
    }
    
    // 로그인 화면
    @GetMapping("/login")
	public String signin() {
		
		return "user/login";
	}
    
    // 회원가입 화면
    @GetMapping("/signup")
	public String signup() {
		
		return "user/signup";
	}
    
    // 회원가입 화면
    @GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
    
    // 회원가입 처리
    @PostMapping("/signup_action")
	public String signup_action(@ModelAttribute SignUpRequestDto signupDto, Model model) {
		userService.signUp(signupDto);
		return "redirect:/user/login";
	}
    
    // 로그인 처리
    @PostMapping("/login")
	public String login_action(@ModelAttribute("Users") LoginRequestDto loginDto, Model model, HttpSession session) {
//		BCryptPasswordEncoder enc<oder = new BCryptPasswordEncoder();
//      String encodePW = encoder.encode(loginDto.getUser_pw());
//      System.out.println(encodePW);
		TokenDto tokenDto = userService.login(loginDto);
		session.setAttribute("tokenDto", tokenDto);
		model.addAttribute("tokenDto", tokenDto);
		
		return "redirect:/";
	}
    
    @PostMapping("/reissue")
    public ResponseEntity<String> reissue(HttpServletRequest request) throws java.io.IOException {
        StringBuilder requestBody = new StringBuilder();
        try {
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                requestBody.append(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error reading request body");
        }

        // requestBody에는 JSON 데이터가 포함됩니다. 이를 파싱하고 처리할 수 있습니다.
        String json = requestBody.toString();

        return ResponseEntity.ok("Request body received: " + json);
    }
}
