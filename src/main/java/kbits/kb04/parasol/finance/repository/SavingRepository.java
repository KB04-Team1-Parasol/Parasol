package kbits.kb04.parasol.finance.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kbits.kb04.parasol.finance.entity.Saving;

@Repository
public interface SavingRepository extends JpaRepository<Saving, Long>{
	Optional<Saving> findBySavingNo(Long savingNo);
}
