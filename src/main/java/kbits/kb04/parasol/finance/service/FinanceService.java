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
	

	// 설문 조사에 따른 계산 및 위험도 분석
	public int calculateResult(PersonalDto personaldto) {
		int sum = personaldto.getAge() + personaldto.getIncome()
		+personaldto.getInvest()+personaldto.getFinance() + personaldto.getDerivatives()
		+personaldto.getLossprofit() + personaldto.getUnderstand();
		
		return sum;
		
	}
	

}
		

	

