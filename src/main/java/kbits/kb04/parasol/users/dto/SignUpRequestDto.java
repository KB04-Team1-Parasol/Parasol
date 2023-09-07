package kbits.kb04.parasol.users.dto;

import kbits.kb04.parasol.users.entity.Users;
import lombok.Data;

@Data
public class SignUpRequestDto {
	private Long user_no;
    private String user_id;
    private String user_pw;
    private String user_name;
    private Integer user_age;

    public Users userFromDto() {
        return new Users(user_id, user_pw, user_name, user_age);
    }
}