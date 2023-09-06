package kbits.kb04.parasol.silver.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kbits.kb04.parasol.silver.entity.SilverTown;
import kbits.kb04.parasol.silver.repository.SilverTownRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SilverTownService {

	private final SilverTownRepository silverTownRepository;

	@Transactional
	public List<SilverTown> searchByKeyword(String keyword) {
		List<SilverTown> silverTowns = this.silverTownRepository.findByStNameContaining(keyword);

		return silverTowns;
	}

}
