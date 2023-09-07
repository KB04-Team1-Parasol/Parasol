package kbits.kb04.parasol.finance.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class BondDto {
	private Long bondNo;
	private String bondName;
	private String bondCode;
	private Date bondDate;
	private Float bondRate;
	private Integer bondRisk;
	private String bondCredit;
	private Integer bondType;
	private String bondCycle;


}
