/**
 * 펀드 Entity
 * 펀드 식별번호, 상품이름, 3년 수익률, 위험도, 링크 
 */



package kbits.kb04.parasol.finance.entity;
import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "fund")
public class Fund {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "fund_SEQ")
	@SequenceGenerator(sequenceName = "fund_SEQ", allocationSize = 1, name = "fund_SEQ")	
	private Long fundNo;

	@Column(name = "fund_name")
	private String fundName;
	
	@Column(name = "fund_rate")
	private Float fundRate;
	

	@Column(name = "fund_risk")
	private Integer fundRisk;
	
	@Column(name = "fund_link")
	private String fundLink;

	public Fund(Long fundNo, String fundName, Float fundRate, Integer fundRisk, String fundLink) {
		super();
		this.fundNo = fundNo;
		this.fundName = fundName;
		this.fundRate = fundRate;
		this.fundRisk = fundRisk;
		this.fundLink = fundLink;
	}

}
