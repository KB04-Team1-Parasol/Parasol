package kbits.kb04.parasol.finance.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data

public class DepositDto {
	private Long deposit_no;
	private String deposit_name;
	private Integer deposit_period;
	private Float deposit_rate;
	private String deposit_link;
	
	
}