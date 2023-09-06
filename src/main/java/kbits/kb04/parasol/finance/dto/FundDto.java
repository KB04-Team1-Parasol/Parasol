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
	private Long fundNo;
	private String fundName;
	private Float fundRate;
	private Integer fundRisk;
	private String fundLink;
}