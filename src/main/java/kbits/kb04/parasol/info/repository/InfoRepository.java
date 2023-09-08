package kbits.kb04.parasol.info.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kbits.kb04.parasol.info.entity.Information;


@Repository
public interface InfoRepository extends JpaRepository<Information, Long> {
	Optional<Information> findByInfoNo(Long infoNo);
}

