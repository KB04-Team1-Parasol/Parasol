package kbits.kb04.parasol.silver.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kbits.kb04.parasol.silver.entity.SilverTown;

@Repository
public interface SilverTownRepository extends JpaRepository<SilverTown, Long> {
	List<SilverTown> findByStName(String stName);
}
