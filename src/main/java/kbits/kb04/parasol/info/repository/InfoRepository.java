package kbits.kb04.parasol.info.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kbits.kb04.parasol.info.entity.Information;
import kbits.kb04.parasol.silver.entity.SilverTown;


@Repository
public interface InfoRepository extends JpaRepository<Information, Long> {
	
}

