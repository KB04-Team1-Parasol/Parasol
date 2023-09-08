package kbits.kb04.parasol.users.dto;

import lombok.Data;

@Data
public class LoginRequestDto {
    private String user_id;
    private String user_pw;
}