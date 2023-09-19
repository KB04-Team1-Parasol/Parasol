package kbits.kb04.parasol.info.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Information {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "INFO_SEQ")
	@SequenceGenerator(sequenceName = "INFO_SEQ", allocationSize = 1, name = "INFO_SEQ")
	private Long infoNo;

	@NotNull
	private String infoTitle;
	@NotNull
	private String infoContent;
	@NotNull
	private Date infoDate;
	
	private String infoImg;
	
	public Information(@NotNull String infoTitle, @NotNull String infoContent, @NotNull Date infoDate,
			String infoImg) {
		super();
		this.infoTitle = infoTitle;
		this.infoContent = infoContent;
		this.infoDate = infoDate;
		this.infoImg = infoImg;

	}
}
