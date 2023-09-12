package kbits.kb04.parasol.silver.dto;

import lombok.Getter;

@Getter
public class SilverTownCustomResponseDto {
	private long stdNo;
	private String stName;
	private String stRoomType;
	private Integer stdDeposit;
	private Integer stdMonthlyCost;
	private String stImgUrl;
	
	public SilverTownCustomResponseDto(long stdNo, String stName, String stRoomType, Integer stdDeposit,
			Integer stdMonthlyCost, String stImgUrl) {
		super();
		this.stdNo = stdNo;
		this.stName = stName;
		this.stRoomType = stRoomType;
		this.stdDeposit = stdDeposit;
		this.stdMonthlyCost = stdMonthlyCost;
		this.stImgUrl = stImgUrl;
	}
	
}
