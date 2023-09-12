package kbits.kb04.parasol.finance.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kbits.kb04.parasol.finance.entity.Bond;
@Repository
public interface BondRepository extends JpaRepository<Bond, Long>{
	Optional<Bond> findBybondNo(Long bondNo);
}
