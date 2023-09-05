package kbits.kb04.parasol.finance.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data

public class SavingDto {
	private Long fin_no;
	private Integer saving_period;
	private Integer max_cost;
	private Float saving_rate;
}