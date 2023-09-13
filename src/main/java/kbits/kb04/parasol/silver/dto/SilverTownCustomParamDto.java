package kbits.kb04.parasol.silver.dto;

import lombok.Getter;

@Getter
public class SilverTownCustomParamDto {
	private String city;
	private int stType;
	
	public SilverTownCustomParamDto(String city, int stType) {
		super();
		this.city = city;
		this.stType = stType;
	}
	
}