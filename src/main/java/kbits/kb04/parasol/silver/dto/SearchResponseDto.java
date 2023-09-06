package kbits.kb04.parasol.silver.dto;

import lombok.Getter;

@Getter
public class SearchResponseDto {
	private String townName;
	private String typeName;
	private Integer deposit;
	private Integer monCost;
	private String imgUrl;

	public SearchResponseDto(String townName, String typeName, Integer deposit, Integer monCost, String imgUrl) {
		super();
		this.townName = townName;
		this.typeName = typeName;
		this.deposit = deposit;
		this.monCost = monCost;
		this.imgUrl = imgUrl;
	}

}
