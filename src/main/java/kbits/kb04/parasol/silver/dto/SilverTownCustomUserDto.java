package kbits.kb04.parasol.silver.dto;

import lombok.Getter;

@Getter
public class SilverTownCustomUserDto {
	private int pureAsset;
	private int monthlyIncome;
	private int hopeAge;
	private int userAge;
	
	public SilverTownCustomUserDto(int pureAsset, int monthlyIncome, int hopeAge, int userAge) {
		super();
		this.pureAsset = pureAsset;
		this.monthlyIncome = monthlyIncome;
		this.hopeAge = hopeAge;
		this.userAge = userAge;
	}
	
	
}
