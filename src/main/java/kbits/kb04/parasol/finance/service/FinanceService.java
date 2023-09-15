package kbits.kb04.parasol.finance.service;


import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kbits.kb04.parasol.auth.SecurityUtil;
import kbits.kb04.parasol.finance.dto.*;
import kbits.kb04.parasol.finance.entity.*;
import kbits.kb04.parasol.finance.repository.*;
import kbits.kb04.parasol.users.dto.AssetInputRequestDto;
import kbits.kb04.parasol.users.dto.UsersDto;
import kbits.kb04.parasol.users.entity.UserAsset;
import kbits.kb04.parasol.users.entity.Users;
import kbits.kb04.parasol.users.repository.UsersRepository;
import kbits.kb04.parasol.users.service.UsersService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // 생성자 주입 
public class FinanceService {
	
	// Repository 객체 생성
	@Autowired
	private final DepositRepository depositRepository;	
	private final SavingRepository savingRepository;
	private final BondRepository bondRepository;
	
	// 사용자 재산, 나이를 위함
	private final UsersService usersService;
	private final UsersRepository usersRepository;
	
	
	/**
	 * 1. 예금 paging
	 * @param page
	 * @param pageSize
	 * @return
	 */
	 public Page<DepositDto> getDeposits(int page, int pageSize) {
		 Pageable pageable = PageRequest.of(Math.max(page - 1, 0), pageSize);
		 Page<Deposit> depositPage = depositRepository.findAll(pageable);
	        return depositPage.map(this::convertToDto);
	 }
	 
     private DepositDto convertToDto(Deposit deposit) {
        return new DepositDto(
            deposit.getDepositNo(),
            deposit.getDepositName(),
            deposit.getDepositPeriod(),
            deposit.getDepositRate(),
            deposit.getDepositLink(),
            deposit.getDepositImg()
        );
     }

     
	/**
	 * 2. 적금 Paging
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Page<SavingDto> getSavings(int page, int pageSize) {
			Pageable pageable = PageRequest.of(Math.max(page - 1, 0), pageSize);
	        Page<Saving> savingPage = savingRepository.findAll(pageable);
	        return savingPage.map(this::convertToDto);
	}
	private SavingDto convertToDto(Saving saving) {
        return new SavingDto(	 
        		saving.getSavingNo(),
        		saving.getSavingName(),
        		saving.getSavingPeriod(),
        		saving.getSavingMax(),
        		saving.getSavingRate(),
        		saving.getSavingLink(),
        		saving.getSavingImg()
  
        );
    }
	
	
	/**
	 * 3. 채권 Paging
	 * @param page
	 * @param pageSize
	 * @return
	 */	
	public Page<BondDto> getBonds(int page, int pageSize){
		Pageable pageable = PageRequest.of(page - 1, pageSize);
		Page<Bond> bondPage = bondRepository.findAll(pageable);
		return bondPage.map(this::convertToDto);
	}
	private BondDto convertToDto(Bond bond) {
		return new BondDto(
			bond.getBondNo(),
			bond.getBondName(),
			bond.getBondCode(),
			bond.getBondDate(),	
			bond.getBondRate(),
			bond.getBondRisk(),
			bond.getBondCredit(),
			bond.getBondType(),
			bond.getBondCycle()
		);
	}
	

	
	// 페이지에서 번호 받아오기
	public Optional<Deposit> findByDepositNo(Long depositNo) {
        return depositRepository.findBydepositNo(depositNo);
    }
	
	public Optional<Saving> findBySavingNo(Long SavingNo) {
        return savingRepository.findBySavingNo(SavingNo);
    }
	
	public Optional<Bond> findBybondNo(Long bondNo){
		return bondRepository.findBybondNo(bondNo);
	}
	
	
	
	

	@Transactional
	public int calculateResult(PersonalDto personaldto) {
		int sum = personaldto.getAge() + personaldto.getIncome()
		+personaldto.getInvest()+personaldto.getFinance() + personaldto.getDerivatives()
		+personaldto.getLossprofit() + personaldto.getUnderstand();		
		
		
		//sum을 기준으로 이것저것 나눠보기
		//합계는 최소 7, 하나라도 선택안할시 제출 불가하도록 설정할 것
		int danger = 0;
		
		if(sum < 11) {
			danger = 1; // 위험도 제일 낮은 것
		}
		else if(sum < 15){
			danger = 2;
		}
		else if(sum < 19){
			danger = 3;
		}
		else if(sum < 24) {
			danger = 4;
		}
		else if(sum >= 24) {
			danger = 5; // 제일 위험한 것
		}
		return danger;	
	}
	


// 채권추천은 설문지 기반, usersdto X 
	public BondDto bondRecommendation(PersonalDto personaldto) {
		// 계산합
		int sum = personaldto.getAge() + personaldto.getIncome()
		+personaldto.getInvest()+personaldto.getFinance() + personaldto.getDerivatives()
		+personaldto.getLossprofit() + personaldto.getUnderstand();		
		// 위험도
		int danger = 0;
		if(sum < 11) {
			danger = 1; }
		else if(sum < 15){
			danger = 2; }
		else if(sum < 19){
			danger = 3; }
		else if(sum < 24) {
			danger = 4; }
		else if(sum >= 24) {
			danger = 5; // 제일 위험한 것
		}
	    System.out.println(danger);
		// 반환할 DTO
		BondDto largeRateBondDto = null;

		float largeRate = Integer.MIN_VALUE;
		// 채권은 여러개, 이 중에서 danger와 risk가 같음 +  그 중에서 가장 높은 수익률인 것 하나		
		// 채권 전체를 순회하기	
		// 채권 목록을 데이터베이스에서 조회
        List<Bond> bondList = bondRepository.findAll(); 
		// System.out.println(bondList);
        for(Bond bond : bondList) {
			int bondrisk = bond.getBondRisk(); //위험도 
			float bondRate = bond.getBondRate();		
			// 고객 설문 결과보다 위험도가 낮은 것 중에서 
			if(danger>=bondrisk && bondRate > largeRate) {
				largeRateBondDto = new BondDto(); // 차례로 이름, 이율, 위험도
				// 링크의 경우 KB증권으로 대체
                largeRateBondDto.setBondName(bond.getBondName());
                largeRateBondDto.setBondRate(bond.getBondRate());
                largeRateBondDto.setBondRisk(bond.getBondRisk());
                largeRateBondDto.setBondNo(bond.getBondNo());
                largeRate = bondRate; // swap
                }
		}	
        System.out.println(largeRateBondDto);
        return largeRateBondDto;	
	}
	

// 예금추천
	public DepositDto depositRecommendation(PersonalDto personaldto) {
		// 계산합
		DepositDto largeRateDepositDto = null;
		float largeRate = Integer.MIN_VALUE;
		List<Deposit> depositList = depositRepository.findAll(); // 전체 예금가져오기
		System.out.println("예금들" + depositList);
		
		// 설문에서 응답한 투자 기간
		int myPeriod = personaldto.getPeriodtime();
		
		// 반복문으로 추천할 예금목록 찾기
	    for(Deposit deposit : depositList) {
				long depositPeriod = deposit.getDepositPeriod(); //기간
				float depositRate = deposit.getDepositRate();
				// 응답한 투자기간보다 기간이 낮은것들 중에서, 가장 이율이 높은 것을 추천해준다
				if(depositPeriod <= myPeriod && depositRate > largeRate) {
					largeRateDepositDto = new DepositDto(); // 차례로 이름, 기간, 이율, 링크 반환
					largeRateDepositDto.setDepositName(deposit.getDepositName());
					largeRateDepositDto.setDepositPeriod(deposit.getDepositPeriod());
					largeRateDepositDto.setDepositRate(deposit.getDepositRate());
					largeRateDepositDto.setDepositLink(deposit.getDepositLink());
					largeRateDepositDto.setDepositNo(deposit.getDepositNo());
					largeRate = depositRate; // swap
					
				}
		}	
     System.out.println(largeRateDepositDto);
     return largeRateDepositDto;	
	}
	
	// 예금추천
		public SavingDto savingRecommendation(PersonalDto personaldto, Long monthIncome) {
			// 계산합
			SavingDto largeRateDepositDto = null;
			float largeRate = Integer.MIN_VALUE;
			List<Saving> savingList = savingRepository.findAll(); // 전체 예금가져오기
			System.out.println("적금들" + savingList);
			
			// 설문에서 응답한 투자 기간
			int myPeriod = personaldto.getPeriodtime();
			Long myIncome = monthIncome / 100 * 60;
			
			// 반복문으로 추천할 예금목록 찾기
		    for(Saving saving : savingList) {
					long savingPeriod = saving.getSavingPeriod(); // 기간
					float savingRate = saving.getSavingRate();	//	
					long savingMax = saving.getSavingMax();		//	적금 가능 액수
					// 응답한 투자기간보다 기간이 낮은것들 중에서, 가장 이율이 높은 것을 추천해준다
					if(savingPeriod <= myPeriod && savingRate > largeRate && savingMax <= myIncome) {
						largeRateDepositDto = new SavingDto(); // 차례로 이름, 기간, 이율, 링크 반환
						largeRateDepositDto.setSavingName(saving.getSavingName());
						largeRateDepositDto.setSavingPeriod(saving.getSavingPeriod());
						largeRateDepositDto.setSavingRate(saving.getSavingRate());
						largeRateDepositDto.setSavingLink(saving.getSavingLink());
						largeRateDepositDto.setSavingNo(saving.getSavingNo());
						largeRate = savingRate; // swap
						
					}
			}	
	     System.out.println(largeRateDepositDto);
	     return largeRateDepositDto;	
		}	
	
}

