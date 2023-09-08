package kbits.kb04.parasol.info.dto;

import java.util.Date;

import lombok.Getter;

@Getter
public class PostDto {
	private Long infoNo;
	private String infoTitle;
	private String infoContent;
	private Date infoDate;
	private String infoImg;
	
	public PostDto(Long infoNo, String infoTitle, String infoContent, Date infoDate, String infoImg) {
		super();
		this.infoNo = infoNo;
		this.infoTitle = infoTitle;
		this.infoContent = infoContent;
		this.infoDate = infoDate;
		this.infoImg = infoImg;
	}
}