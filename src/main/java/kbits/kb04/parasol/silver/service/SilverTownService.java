package kbits.kb04.parasol.silver.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kbits.kb04.parasol.silver.dto.SearchRequestDto;
import kbits.kb04.parasol.silver.dto.SilverTownDetailResponseDto;
import kbits.kb04.parasol.silver.entity.SilverTown;
import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import kbits.kb04.parasol.silver.repository.SilverTownDetailRepository;
import kbits.kb04.parasol.silver.repository.SilverTownRepository;
//import kbits.kb04.parasol.users.service.SilverTownSpecification;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SilverTownService {

	private final SilverTownRepository silverTownRepository;
	private final SilverTownDetailRepository silverTownDetailRepository;

	// 키워드를 포함한 검색
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

	public List<SilverTownDetail> searchByFilter(SearchRequestDto requestDto) {
		String stName = requestDto.getStName();
		Integer stType = requestDto.getStType();
		String city = requestDto.getCity();
		Integer stScale = requestDto.getStScale();
		// 세대수
		Integer stdOccupancy = requestDto.getStdOccupancy();
		Integer stdDeposit = requestDto.getStdDeposit();
		Integer stdMonthlyCost = requestDto.getStdMonthlyCost();

		Integer stdRoomSize = requestDto.getStdRoomSize();
		Integer stPeriod = requestDto.getStPeriod();

		System.out.println("name" + stName + "ttt");
		System.out.println("city" + city + "ttt");
		System.out.println("stType" + stType);
		System.out.println("stScale" + stScale);

		Specification<SilverTownDetail> spec = (root, query, criteriaBuilder) -> null;

		if (stName != null)
			spec = spec.and(SilverTownDetailSpecification.equalStName(stName));
		if (stType != null)
			spec = spec.and(SilverTownDetailSpecification.equalStType(stType));
		if (city != null)
			spec = spec.and(SilverTownDetailSpecification.equalCity(city));
		if (stScale != null)
			spec = spec.and(SilverTownDetailSpecification.equalStScale(stScale));
		if (stdRoomSize != null)
			spec = spec.and(SilverTownDetailSpecification.equalStdRoomSize(stdRoomSize));
		if (stdOccupancy != null)
			spec = spec.and(SilverTownDetailSpecification.equalStdOccupancy(stdOccupancy));

		if (stdDeposit != null)
			spec = spec.and(SilverTownDetailSpecification.findLessDeposit(stdDeposit));
		if (stdMonthlyCost != null)
			spec = spec.and(SilverTownDetailSpecification.findLessMonthlyCost(stdMonthlyCost));
		if (stPeriod != null)
			spec = spec.and(SilverTownDetailSpecification.findLessStPeriod(stPeriod));

		return silverTownDetailRepository.findAll(spec);
	}

}
