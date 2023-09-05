package kbits.kb04.parasol.silver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kbits.kb04.parasol.silver.entity.SilverTownDetail;

@Repository
public interface SilverTownDetailRepository extends JpaRepository<SilverTownDetail, Long>{

}
