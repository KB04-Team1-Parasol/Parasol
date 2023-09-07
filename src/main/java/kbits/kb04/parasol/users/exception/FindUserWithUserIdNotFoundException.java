package kbits.kb04.parasol.users.exception;

public class FindUserWithUserIdNotFoundException extends RuntimeException{
    public FindUserWithUserIdNotFoundException() {
        super("해당 유저를 찾을 수 없습니다.");
    }
}