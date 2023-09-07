package kbits.kb04.parasol.finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kbits.kb04.parasol.finance.entity.Bond;

public interface BondRepository extends JpaRepository<Bond, Long>{

}
