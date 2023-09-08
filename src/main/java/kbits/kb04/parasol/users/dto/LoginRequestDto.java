package kbits.kb04.parasol.users.dto;

import lombok.Getter;

@Getter
public class LoginRequestDto {
    private String user_id;
    private String user_pw;
}