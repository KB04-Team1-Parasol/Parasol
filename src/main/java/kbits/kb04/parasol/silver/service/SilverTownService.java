package kbits.kb04.parasol.silver.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kbits.kb04.parasol.silver.dto.SilverTownDetailResponseDto;
import kbits.kb04.parasol.silver.entity.SilverTown;
import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import kbits.kb04.parasol.silver.repository.SilverTownDetailRepository;
import kbits.kb04.parasol.silver.repository.SilverTownRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SilverTownService {

	private final SilverTownRepository silverTownRepository;
	private final SilverTownDetailRepository silverTownDetailRepository;

	@Transactional
	public List<SilverTown> searchByKeyword(String keyword) {
		List<SilverTown> silverTowns = this.silverTownRepository.findByStNameContaining(keyword);

		return silverTowns;
	}

	@Transactional
	public SilverTownDetailResponseDto getSilverTownDetail(long stdNo) {
		SilverTownDetail stDetail = this.silverTownDetailRepository.findById(stdNo).get();
		long stNo = stDetail.getSilverTown().getStNo();
		SilverTown st = this.silverTownRepository.findById(stNo).get();
		SilverTownDetailResponseDto dto = new SilverTownDetailResponseDto(st, stDetail);

		return dto;
	}

}
