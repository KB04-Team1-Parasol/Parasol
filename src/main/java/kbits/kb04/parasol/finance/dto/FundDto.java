package kbits.kb04.parasol.finance.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data

public class FundDto {
	private Long fund_no;
	private String fund_name;
	private Float fund_rate;
	private Integer fund_risk;
	private String fund_link;
}