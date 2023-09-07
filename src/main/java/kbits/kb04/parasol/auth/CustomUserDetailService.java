package kbits.kb04.parasol.auth;

import javax.transaction.Transactional;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kbits.kb04.parasol.users.exception.FindUserWithUserIdNotFoundException;
import kbits.kb04.parasol.users.entity.Users;
import kbits.kb04.parasol.users.repository.UsersRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class CustomUserDetailService implements UserDetailsService {
    private final UsersRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        Users user = userRepository.findByUserId(id).orElseThrow(FindUserWithUserIdNotFoundException::new);
        return new CustomUserDetails(user);
    }
}