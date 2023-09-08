package kbits.kb04.parasol.users.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kbits.kb04.parasol.users.entity.Users;

/*JpaRepository<User, Long>에서 첫 번째 인자 User는 해당 리파지토리가 관리하는 엔티티 타입을 나타내며, 
두 번째 인자 Long은 엔티티의 주요 키 (Primary Key)의 데이터 타입을 나타냅니다. 
이 경우 User 엔티티를 관리하며, User 엔티티의 주요 키는 Long 타입입니다.
이 UserRepository 인터페이스는 Spring Data JPA를 사용하여 User 엔티티에 대한 CRUD (Create, Read, Update, Delete) 작업을 
수행할 수 있도록 도와주는 메서드를 자동으로 생성합니다. 
이러한 메서드를 사용하여 데이터베이스와 상호작용할 수 있으며, 별도의 SQL 쿼리를 작성할 필요가 없습니다. 
Repository 인터페이스를 사용하여 데이터베이스 연동 코드를 간단하게 작성할 수 있습니다.*/

@Repository
public interface UsersRepository extends JpaRepository<Users, Long> {
    Optional<Users> findByUserId(String userid);

}