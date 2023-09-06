package kbits.kb04.parasol.silver.dto;

import kbits.kb04.parasol.silver.entity.SilverTown;
import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import lombok.Getter;

@Getter
public class SilverTownDetailResponseDto {
	private long stNo;
	private String address;
	private String stFacility;
	private String stImgUrl;
	private String stName;
	private int stPeriod;
	private int stScale;
	private int stType;
	private String stUrl;
	
	private long stdNo;
	private int stdDeposit;
	private int stdMonthlyCost;
	private int stdOccupancy;
	private int stdRoomSize;
	private String stdRoomType;
	
	public SilverTownDetailResponseDto(SilverTown silverTown, SilverTownDetail silverTownDetail) {
		super();
		this.stNo = silverTown.getStNo();
		this.address = silverTown.getAddress();
		this.stFacility = silverTown.getStFacility();
		this.stImgUrl = silverTown.getStImgUrl();
		this.stName = silverTown.getStName();
		this.stPeriod = silverTown.getStPeriod();
		this.stScale = silverTown.getStScale();
		this.stType = silverTown.getStType();
		this.stUrl = silverTown.getStUrl();
		this.stdNo = silverTownDetail.getStdNo();
		this.stdDeposit = silverTownDetail.getStdDeposit();
		this.stdMonthlyCost = silverTownDetail.getStdMonthlyCost();
		this.stdOccupancy = silverTownDetail.getStdOccupancy();
		this.stdRoomSize = silverTownDetail.getStdRoomSize();
		this.stdRoomType = silverTownDetail.getStdRoomType();
	}
	
}
