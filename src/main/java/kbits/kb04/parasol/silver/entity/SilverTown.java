package kbits.kb04.parasol.silver.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class SilverTown {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "silver_SEQ")
	@SequenceGenerator(sequenceName = "silver_SEQ", allocationSize = 1, name = "silver_SEQ")
	private int stNo;

	@NotNull
	private String stName;
	@NotNull
	private String city;
	@NotNull
	private String address;
	@NotNull
	private String stImgUrl;
	@NotNull
	private int stScale;
	@NotNull
	private int stType;
	private String stFacility;
	@NotNull
	private String stUrl;
	@NotNull
	private int stPeriod; 

	@OneToMany(mappedBy = "silverTown")
	private List<SilverTownDetail> details = new ArrayList<SilverTownDetail>();

	public SilverTown(@NotNull String stName, @NotNull String city, @NotNull String address,
			@NotNull String stImgUrl, @NotNull int stScale, @NotNull int stType, String stFacility,
			@NotNull String stUrl, @NotNull int stPeriod, List<SilverTownDetail> details) {
		super();
		this.stName = stName;
		this.city = city;
		this.address = address;
		this.stImgUrl = stImgUrl;
		this.stScale = stScale;
		this.stType = stType;
		this.stFacility = stFacility;
		this.stUrl = stUrl;
		this.stPeriod = stPeriod;
		this.details = details;
	}

}
