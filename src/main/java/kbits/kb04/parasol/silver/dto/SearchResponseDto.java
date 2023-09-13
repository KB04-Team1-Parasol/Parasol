package kbits.kb04.parasol.silver.dto;

import java.text.DecimalFormat;

import lombok.Getter;

@Getter
public class SearchResponseDto {
	private String townName;
	private String typeName;
	private String deposit;
	private String monCost;
	private String imgUrl;
	private Long stdNo;

	DecimalFormat df = new DecimalFormat("###,###");

	public SearchResponseDto(String townName, String typeName, Integer deposit, Integer monCost, String imgUrl, Long stdNo) {
		super();
		this.townName = townName;
		this.typeName = typeName;
		this.deposit = df.format(deposit * 10000);
		this.monCost = df.format(monCost * 10000);
		this.imgUrl = imgUrl;
		this.stdNo = stdNo;
	}

}
