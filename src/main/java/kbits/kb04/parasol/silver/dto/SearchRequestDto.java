package kbits.kb04.parasol.silver.dto;

import lombok.Data;
import lombok.Getter;

@Data
public class SearchRequestDto {
	private String stName;
	// 주거타입 근교, 도심..
	private Integer stType;
	private String city;
	private Integer stScale;
	// 세대수
	private Integer stdOccupancy;
	private Integer stdDeposit;
	private Integer stdMonthlyCost;
	private Integer stdRoomSize;
	private Integer stPeriod;

}
