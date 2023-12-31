package kbits.kb04.parasol.silver.service;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import kbits.kb04.parasol.silver.dto.SearchRequestDto;
import kbits.kb04.parasol.silver.dto.SearchResponseDto;
import kbits.kb04.parasol.finance.entity.Bond;
import kbits.kb04.parasol.finance.entity.Deposit;
import kbits.kb04.parasol.finance.entity.Saving;
import kbits.kb04.parasol.finance.repository.BondRepository;
import kbits.kb04.parasol.finance.repository.DepositRepository;
import kbits.kb04.parasol.finance.repository.SavingRepository;
import kbits.kb04.parasol.silver.dto.SilverTownCustomUserDto;
import kbits.kb04.parasol.silver.dto.SilverTownDetailCustomResponseDto;
import kbits.kb04.parasol.silver.dto.SilverTownDetailResponseDto;
import kbits.kb04.parasol.silver.dto.SilverTownCustomResponseDto;
import kbits.kb04.parasol.silver.entity.SilverTown;
import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import kbits.kb04.parasol.silver.repository.SilverTownDetailRepository;
import kbits.kb04.parasol.silver.repository.SilverTownRepository;
//import kbits.kb04.parasol.users.service.SilverTownSpecification;
import kbits.kb04.parasol.users.entity.Users;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SilverTownService {

	private final SilverTownRepository silverTownRepository;
	private final SilverTownDetailRepository silverTownDetailRepository;
	private final DepositRepository depositRepository;
	private final SavingRepository savingRepository;
	private final BondRepository bondRepository;
	
	// 평균 물가 상승률(최근 10년 평균)
	private final double inflationRate = 0.0167;
	// 투자 가능 비율(임시)
	private final double investRate = 0.7;
	// 이자 과세율
	private final double interestTaxRate = 0.154;

	
	// 실버타운 검색
	// 기본 화면위한 전체 리스트
	public List<SilverTownDetail> townList(){
		return silverTownDetailRepository.findAll();
	}
	
	
	// 실버타운 검색
	// 키워드를 포함한 검색
	public List<SilverTown> searchByKeyword(String keyword) {
		List<SilverTown> silverTowns = this.silverTownRepository.findByStNameContaining(keyword);

		return silverTowns;
	}
	
	// 조건 검색
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
			spec = spec.and(SilverTownDetailSpecification.findLessRoomSize(stdRoomSize));
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
	
	// 상세 보기(순수 검색)
	public SilverTownDetailResponseDto getSilverTownDetail(long stdNo) {
		SilverTownDetail stDetail = this.silverTownDetailRepository.findById(stdNo).get();
		return new SilverTownDetailResponseDto(stDetail);
	}
	
	// 맞춤 실버타운 찾기
	// 유저 정보 받기
	public SilverTownCustomUserDto setUserDto(Users user) {
		int pureAsset = user.getUserAsset().getPureAsset().intValue();
		int monthlyIncome = (int)(user.getUserAsset().getMonthlyIncome() + user.getUserAsset().getAnnuity());
		int hopeAge = user.getUserAsset().getHopeAge().intValue();
		int userAge = user.getUserAge();
		int hopePeriod = user.getUserAsset().getHopePeriod().intValue();
		
		return new SilverTownCustomUserDto(pureAsset, monthlyIncome, hopeAge, userAge, hopePeriod);
	}
	
	// 총 자산(미래 기준, 금융상품 x) 구하기
	public int getFutureAsset(SilverTownCustomUserDto userDto) {
		// { 순자산 + (월 저축 금액 * 12) * (입주예상나이 - 현재나이) } * ( 1 + 평균물가상승률 ) * 투자가능비율
		int pureAsset = userDto.getPureAsset();
		int monthlyIncome = userDto.getMonthlyIncome();
		int hopeAge = userDto.getHopeAge();
		int userAge = userDto.getUserAge();
		int tempAsset = pureAsset + (monthlyIncome*12) * (hopeAge - userAge);
		
		return (int)(tempAsset*(1+inflationRate)*investRate);
	}
	
	// 실버타운 필터링
	public List<SilverTownCustomResponseDto> getSilverTownFiltering(Users user, SearchRequestDto searchRequestDto) {
		SilverTownCustomUserDto userDto = setUserDto(user);
		
		// 총 자산
		int futureAsset = this.getFutureAsset(userDto);
		
		Specification<SilverTownDetail> spec = (root, query, criteriaBuilder) -> null;
		Integer stType = searchRequestDto.getStType();
		String city = searchRequestDto.getCity();
		if(stType != null)
			spec = spec.and(SilverTownDetailSpecification.equalStType(searchRequestDto.getStType()));
		if(city != null)
			spec = spec.and(SilverTownDetailSpecification.equalCity(searchRequestDto.getCity()));
		List<SilverTownDetail> silverTownDetailList_total = silverTownDetailRepository.findAll(spec);
		List<SilverTownCustomResponseDto> silverTownDetailList = new ArrayList<SilverTownCustomResponseDto>();
		for (SilverTownDetail silverTownDetail : silverTownDetailList_total) {
			// 총 필요 비용
			int totalCost = this.getTotalCost(silverTownDetail, userDto.getHopePeriod());
			
			// 총 필요 비용 > 총 자산(금융상품 x)인 실버타운 필터링
			if(totalCost > futureAsset/2) { 
				List<Deposit> depositFiltering = this.getDepositFiltering(silverTownDetail, userDto);
				List<Saving> savingFiltering = this.getSavingFiltering(silverTownDetail, userDto);
				List<Bond> bondFiltering = this.getBondFiltering(silverTownDetail, userDto);

				// 추천 금융상품이 존재하는 실버타운 필터링
				int depositCnt = depositFiltering.size();
				int savingCnt = savingFiltering.size();
				int bondCnt = bondFiltering.size();
				if(depositFiltering.size() > 0 || savingFiltering.size() > 0 || bondFiltering.size() > 0) {
					Long stdNo = silverTownDetail.getStdNo();
					String stName = silverTownDetail.getSilverTown().getStName();
					int stdDeposit = silverTownDetail.getStdDeposit();
					int stdMonthlyCost = silverTownDetail.getStdMonthlyCost();
					String stdRoomType = silverTownDetail.getStdRoomType();
					String stImgUrl = silverTownDetail.getSilverTown().getStImgUrl();
					
					SilverTownCustomResponseDto silverTownCustomResponseDto = 
							new SilverTownCustomResponseDto(stdNo, stName, stdRoomType, stdDeposit, stdMonthlyCost, stImgUrl, depositCnt, savingCnt, bondCnt);
					silverTownDetailList.add(silverTownCustomResponseDto);
				}
			}
		}
		
		silverTownDetailList = 
				silverTownDetailList.stream()
				.sorted(Comparator.comparing(SilverTownCustomResponseDto::getStdMonthlyCost))
				.collect(Collectors.toList());
		
		return silverTownDetailList;
	}
	
	// 상세 보기(맞춤 검색)
	public SilverTownDetailCustomResponseDto getSilverTownDetailCustom(long stdNo, Users user) {
		SilverTownCustomUserDto userDto = this.setUserDto(user);
		
		// 실버타운 정보
		SilverTownDetail silverTownDetail = this.silverTownDetailRepository.findById(stdNo).get();
		
		// 금융상품 필터링
		List<Deposit> depositList = this.getDepositFiltering(silverTownDetail, userDto);
		List<Saving> savingList = this.getSavingFiltering(silverTownDetail, userDto);
		List<Bond> bondList = this.getBondFiltering(silverTownDetail, userDto);
		
		SilverTownDetailCustomResponseDto dto = 
				new SilverTownDetailCustomResponseDto(silverTownDetail, depositList, savingList, bondList);
		return dto;
	}
	
	// 예금 필터링
	public List<Deposit> getDepositFiltering(
			SilverTownDetail silverTownDetail, 
			SilverTownCustomUserDto userDto){
		int yechigeum = this.getYechigeum(userDto);
		int totalCost = this.getTotalCost(silverTownDetail, userDto.getHopePeriod());
		
		List<Deposit> depositList_total = depositRepository.findAll();
		List<Deposit> depositList = new ArrayList<Deposit>();
		for (Deposit deposit : depositList_total) {
			// 갯수 제한
			if(depositList.size() >= 2) continue;
			
			// 이자: 예치금 * 만기이자율 * 연수(기간/12)
			// 이자과세: 이자 * 이자과세율
			// 총 저축금: 예치금 + 이자 - 이자과세
			int invest = (int)(yechigeum * deposit.getDepositRate()/100 * deposit.getDepositPeriod()/12);
			int investTax = (int)(invest * interestTaxRate);
			int result = yechigeum + invest - investTax;
			
			if(result >= totalCost) {
				depositList.add(deposit);
			}
		}
		
		return depositList;
	}
	
	// 적금 필터링
	public List<Saving> getSavingFiltering(
			SilverTownDetail silverTownDetail, 
			SilverTownCustomUserDto userDto){
		int yechigeum = this.getYechigeum(userDto);
		int totalCost = this.getTotalCost(silverTownDetail, userDto.getHopePeriod());
		
		List<Saving> savingList_total = savingRepository.findAll();
		List<Saving> savingList = new ArrayList<Saving>();
		for (Saving saving : savingList_total) {
			// 갯수 제한
			if(savingList.size() >= 2) continue;
			
			// 총 원금: 월 저축액 * 기간 => 조건 필요(예치금 ≥ 총 원금)
			// 총 이자: 월 저축액 * ( 이자율 / 12 ) * 개월수 * (개월수 + 1) / 2
			// 이자과세: 총 이자 * 이자과세율
			// 총 저축금: 총 원금 + 총 이자 - 이자과세
			int totalOrigMoney = (int)(saving.getSavingMax() * saving.getSavingPeriod());
			if(yechigeum < totalOrigMoney) continue; // 예치금이 총 원금보다 작을 경우 skip
			int months = (int)(saving.getSavingPeriod()*1);
			int totalInterest = (int)(saving.getSavingMax() * (saving.getSavingRate()/100/12) * months * (months+1) / 2);
			int interestTax = (int)(totalInterest * interestTaxRate);
			int result = totalOrigMoney + totalInterest - interestTax;
			
			if(result >= totalCost) {
				savingList.add(saving);
			}
		}
		
		return savingList;
	}
	
	// 채권 필터링
	public List<Bond> getBondFiltering(
			SilverTownDetail silverTownDetail, 
			SilverTownCustomUserDto userDto){
		int yechigeum = this.getYechigeum(userDto);
		int totalCost = this.getTotalCost(silverTownDetail, userDto.getHopePeriod());
		
		List<Bond> bondList_total = bondRepository.findAll();
		List<Bond> bondList = new ArrayList<Bond>();
		for (Bond bond : bondList_total) {	
			// 갯수 제한
			if(bondList.size() >= 2) continue;
			
			// 신용등급 필터링(AA등급 미만 제외)
			String[] creditFilterArr = {"AA-", "AA0", "AA+", "AAA"};
			List<String> creditFilterList = new ArrayList<String>(Arrays.asList(creditFilterArr));
			if(!creditFilterList.contains(bond.getBondCredit())) continue;
			
			// 만기일자 필터링(남은 기간 2년 이상)
			LocalDate dueDate = bond.getBondDate().toLocalDate();
			LocalDate nowDate = LocalDate.now();
			Period diff = Period.between(nowDate, dueDate);
			int remainYear = diff.getYears(); 
			if(remainYear < 2) continue;
			
			// 총 저축금: 예치금 * ( 1 + 은행환산수익률 * 남은 기간 )
			int result = (int)(yechigeum * (1 + bond.getBondRate()/100 * remainYear));
			if(result >= totalCost) {
				bondList.add(bond);
			}
		}
		
		return bondList;
	}
	
	// 예치금 계산
	public int getYechigeum(SilverTownCustomUserDto userDto) {
		return (int)(userDto.getPureAsset() * investRate);
	}

	// 실버타운 총 필요 비용 계산
	public int getTotalCost(SilverTownDetail silverTownDetail, int hopePeriod) {
		// (보증금 + 월세 * 12 * 희망거주기간 ) * ( 1 + 평균물가상승률 )
		int stdDeposit = silverTownDetail.getStdDeposit();
		int stdMonthlyCost = silverTownDetail.getStdMonthlyCost();
		System.out.println(hopePeriod);
		return (int)((stdDeposit + stdMonthlyCost*12*hopePeriod) * (1 + inflationRate));
	}
	
}
