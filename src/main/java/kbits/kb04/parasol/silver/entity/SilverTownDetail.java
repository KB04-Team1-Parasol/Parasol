package kbits.kb04.parasol.silver.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class SilverTownDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "silver_detail_SEQ")
	@SequenceGenerator(sequenceName = "silver_detail_SEQ", allocationSize = 1, name = "silver_detail_SEQ")
	private Long stdNo;

	@NotNull
	private String stdRoomType;
	@NotNull
	private Integer stdDeposit;
	@NotNull
	private Integer stdMonthlyCost;
	@NotNull
	private Integer stdRoomSize;
	@NotNull
	private Integer stdOccupancy;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "st_no")
	private SilverTown silverTown;

	public SilverTownDetail(@NotNull String stdRoomType, @NotNull Integer stdDeposit, @NotNull Integer stdMonthlyCost,
			@NotNull Integer stdRoomSize, @NotNull Integer stdOccupancy, SilverTown silverTown) {
		super();
		this.stdRoomType = stdRoomType;
		this.stdDeposit = stdDeposit;
		this.stdMonthlyCost = stdMonthlyCost;
		this.stdRoomSize = stdRoomSize;
		this.stdOccupancy = stdOccupancy;
		this.silverTown = silverTown;
	}

}