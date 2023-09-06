package kbits.kb04.parasol.users.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}