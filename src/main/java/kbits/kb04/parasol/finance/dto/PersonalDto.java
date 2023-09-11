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
	
	int age;
	int income;
	int finance;
	int invest;
	int understand;
	int lossprofit;
	int derivatives;
	int result;
	
}
