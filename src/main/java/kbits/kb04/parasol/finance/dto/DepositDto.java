
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
	private Long depositNo;
	private String depositName;
	private Long depositPeriod;
	private Float depositRate;
	private String depositLink;
	private String depositImg;
}