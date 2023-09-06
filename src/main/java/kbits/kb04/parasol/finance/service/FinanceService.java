package kbits.kb04.parasol.finance.service;

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
	private final DepositRepository depositRepository;
	private final FundRepository fundRepository;
	private final SavingRepository savingRepository;
	
	// 1. 예금Dto Paging
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
	            deposit.getDepositLink()
	        );
	    }

}
		
	
	
	
	// 3. 펀드 보여주기 - 전체
	
	

