package kbits.kb04.parasol.users.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kbits.kb04.parasol.users.dto.UsersDto;
import kbits.kb04.parasol.users.entity.Users;
import kbits.kb04.parasol.users.exception.UsersNotFoundException;
import kbits.kb04.parasol.users.repository.UsersRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UsersService {

    private final UsersRepository userRepository;

    public Users findByUserId(String id) {
        Optional<Users> userById = userRepository.findByUserId(id);
        Users user = userById.get();
        
        return user;
    }
}