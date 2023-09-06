package kbits.kb04.parasol.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kbits.kb04.parasol.users.dto.UsersDto;
import kbits.kb04.parasol.users.entity.Users;
import kbits.kb04.parasol.users.exception.UsersNotFoundException;
import kbits.kb04.parasol.users.repository.UsersRepository;
import kbits.kb04.parasol.users.service.UsersService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
//@RequestMapping("/myinfo")
@RequiredArgsConstructor
@Slf4j
public class UsersController {

    private final UsersService userService;



    // 사용자 개인 정보 가져오기 
    @GetMapping("/myinfo")
    public String getUserInfo(Model model) throws UsersNotFoundException {
        // UserService를 통해 사용자 정보를 조회
        Users user = userService.findByUserId("wnsghks2"); // user_id가 dndud1024인 사용자 정보 조회
        // Model에 사용자 정보를 추가
        model.addAttribute("user", user);
        model.addAttribute("tmp", "temppppppppppppp");

        System.out.println(user);
        System.out.println("1111");
        // 사용자 정보를 보여줄 JSP 페이지로 이동
        return "myinfo"; // myinfo.jsp로 이동
    }
    

}
