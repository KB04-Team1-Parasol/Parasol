package kbits.kb04.parasol.finance.service;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import kbits.kb04.parasol.finance.dto.*;
import kbits.kb04.parasol.finance.entity.*;
import kbits.kb04.parasol.finance.repository.*;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // 생성자 주입 
public class FinanceService {
	
	// Repository 객체 생성
	@Autowired
	private final DepositRepository depositRepository;	
	private final SavingRepository savingRepository;
	private final BondRepository bondRepository;
	
	
	/**
	 * 1. 예금 paging
	 * @param page
	 * @param pageSize
	 * @return
	 */
	 public Page<DepositDto> getDeposits(int page, int pageSize) {
	        Pageable pageable = PageRequest.of(page - 1, pageSize); // 페이지 번호는 1부터 시작하므로 1을 빼줍니다.
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
			Pageable pageable = PageRequest.of(page - 1, pageSize); // 페이지 번호는 1부터 시작하므로 1을 빼줍니다.
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
		Page<Bond> BondPage = bondRepository.findAll(pageable);
		return BondPage.map(this::convertToDto);
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
	

	// 설문 조사에 따른 계산 및 위험도 분석
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
}
		

	

