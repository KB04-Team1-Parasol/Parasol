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
	private int saving_period;
	private int max_cost;
	private float saving_rate;
}
