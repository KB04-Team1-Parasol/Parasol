package kbits.kb04.parasol.silver.dto;

import java.text.DecimalFormat;

import lombok.Getter;

@Getter
public class SilverTownCustomResponseDto {
	private Long stdNo;
	private String stName;
	private String stRoomType;
	private String stdDeposit;
	private String stdMonthlyCost;
	private String stImgUrl;
	
	private int depositCnt;
	private int savingCnt;
	private int bondCnt;
	
	DecimalFormat df = new DecimalFormat("###,###");
	
	public SilverTownCustomResponseDto(Long stdNo, String stName, String stRoomType, Integer stdDeposit,
			Integer stdMonthlyCost, String stImgUrl, int depositCnt, int savingCnt, int bondCnt) {
		super();
		this.stdNo = stdNo;
		this.stName = stName;
		this.stRoomType = stRoomType;
		this.stdDeposit = df.format(stdDeposit*10000);
		this.stdMonthlyCost = df.format(stdMonthlyCost*10000);
		this.stImgUrl = stImgUrl;
		this.depositCnt = depositCnt;
		this.savingCnt = savingCnt;
		this.bondCnt = bondCnt;
	}
	
}
