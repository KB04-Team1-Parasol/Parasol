package kbits.kb04.parasol.finance.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PersonalDto {
	
	/*	총 7 문항
	 *  연령 ( 20대, 30대, 40대, 50대, 60대 이상)
		연소득 (5천만원 이하, 7천만원대, 9천만원대, 1억이상)
		자산 중 금융 자산 비중
		금융 자산 중 투자성상품 비중
		이해도
		수익과 손실
		파생상품 이해도
	 */
	
	int age;
	int income;
	int finance;
	int invest;
	int understand;
	int lossprofit;
	int derivatives;
	int result;
	
}
