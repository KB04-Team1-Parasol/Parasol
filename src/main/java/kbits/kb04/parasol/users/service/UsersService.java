package kbits.kb04.parasol.users.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kbits.kb04.parasol.auth.JwtProvider;
import kbits.kb04.parasol.auth.RefreshToken;
import kbits.kb04.parasol.auth.RefreshTokenRepository;
import kbits.kb04.parasol.auth.TokenDto;
import kbits.kb04.parasol.users.dto.LoginRequestDto;
import kbits.kb04.parasol.users.dto.SignUpRequestDto;
import kbits.kb04.parasol.users.dto.UserAssetDto;
import kbits.kb04.parasol.users.dto.UsersDto;
import kbits.kb04.parasol.users.entity.UserAsset;
import kbits.kb04.parasol.users.entity.Users;
import kbits.kb04.parasol.users.exception.UsersNotFoundException;
import kbits.kb04.parasol.users.repository.UserAssetRepository;
import kbits.kb04.parasol.users.repository.UsersRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UsersService {

    private final UsersRepository userRepository;
    private final UserAssetRepository userAssetRepository;
    private final AuthenticationManagerBuilder authenticationManagerBuilder;
	private final JwtProvider jwtProvider;
	private final RefreshTokenRepository refreshTokenRepository;
    
    // 아이디 조회 -> 존재 -> 개인 정보 출력
    // 아이디 조회 -> 존재 -> 자산 정보 조회 -> 존재 -> 자산 정보 출력
    Users user=null;

    public Users findByUserId(String id) {
        Optional<Users> userById = userRepository.findByUserId(id);
        user = userById.get();
        
        return user;
    }
    
    public UserAsset findByUserNo(Integer no) {
    	
        // 사용자 정보 조회
    	// 사용자가 없는 경우 null을 반환하거나 예외 처리를 수행
        if (user == null) {
        	return null; 
        }

        // USERASSET 테이블에서 데이터 조회
        Optional<UserAsset> userAssetByNo = userAssetRepository.findByUserNo(user.getUserNo());
        UserAsset userAsset = userAssetByNo.get();
        
        return userAsset;
    }
    // 회원가입 처리 함수
    @Transactional
    public String signUp(SignUpRequestDto requestDto) {
        Optional<Users> userById = userRepository.findByUserId(requestDto.getUser_id());
        if (userById.isPresent()) {
            throw new RuntimeException();   //TODO 이미 존재합니다 exception
        }
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodePW = encoder.encode(requestDto.getUser_pw());
        requestDto.setUser_pw(encodePW);
        Users user = requestDto.userFromDto();
        userRepository.save(user);

        return user.getUserId();
    }
    // 로그인 처리 함수
    @Transactional
	public TokenDto login(LoginRequestDto dto) {
		// 1. Login ID/PW 를 기반으로 AuthenticationToken 생성
		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
				dto.getUser_id(), dto.getUser_pw());

		// 2. 실제로 검증 (사용자 비밀번호 체크) 이 이루어지는 부분
		// authenticate 메서드가 실행이 될 때 CustomUserDetailsService 에서 만들었던 loadUserByUsername
		// 메서드가 실행됨
		Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);

		// 3. 인증 정보를 기반으로 JWT 생성
		TokenDto tokenDto = jwtProvider.generateToken(authentication);

		// 4. RefreshToken 저장
		RefreshToken refreshToken = RefreshToken.builder().key(authentication.getName())
				.value(tokenDto.getRefreshToken()).build();
		refreshTokenRepository.save(refreshToken);

		return tokenDto;
	}

	public Users findUserById(String userId) {
		Optional<Users> userById = userRepository.findByUserId(userId);
		Users user = userById.get();
		return user;
	}

}
