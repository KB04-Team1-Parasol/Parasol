/**
 * 채권 Entity
 * 채권 식별번호, 상품이름, 만기 날짜, 수익률, 위험도, 신용등급, 링크, 이미지
 */



package kbits.kb04.parasol.finance.entity;
import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "bond")
public class Bond {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "bond_SEQ")
	@SequenceGenerator(sequenceName = "bond_SEQ", allocationSize = 1, name = "bond_SEQ")	
	private Long bondNo;

	@Column(name = "bond_name")
	private String bondName;
	
	@Column(name = "bond_code")
	private String bondCode;
	
	@Column(name = "bond_date")
	private Date bondDate;
	
	@Column(name = "bond_rate")
	private Float bondRate;

	@Column(name = "bond_risk")
	private Integer bondRisk;
	
	@Column(name = "bond_credit")
	private String bondCredit;
	
	@Column(name = "bond_type")
	private Integer bondType;

	@Column(name = "bond_cycle")
	private Integer bondCycle;

	// constructor
	public Bond(Long bondNo, String bondName, String bondCode, Date bondDate, Float bondRate, Integer bondRisk,
			String bondCredit, Integer bondType, Integer bondCycle) {
		super();
		this.bondNo = bondNo;
		this.bondName = bondName;
		this.bondCode = bondCode;
		this.bondDate = bondDate;
		this.bondRate = bondRate;
		this.bondRisk = bondRisk;
		this.bondCredit = bondCredit;
		this.bondType = bondType;
		this.bondCycle = bondCycle;
	}

	public int getYear() {
		return bondDate.getYear() + 1900;
	}
	
	public int getMonth() {
		return bondDate.getMonth() + 4 - LocalDate.now().getDayOfMonth();
	}

	
}
