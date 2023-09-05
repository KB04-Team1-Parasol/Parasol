package kbits.kb04.parasol.finance.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "fund")
public class FundEntity {
	
	
	@Id
	@JoinColumn(name = "fin_no", nullable = false)
	private long fin_no;
	
	
	@OneToOne
	@MapsId
	@JoinColumn(name="fin_no")
	private FinanceEntity financeEntity;
	
	@Column(name = "fund_rate")
	private float fund_rate;
	
	@Column(name = "fund_risk")
	private int fund_risk;
	
	
	// constructor
	
	public FundEntity(Long fin_no, float fund_rate, int fund_risk) {
		super();
		this.fin_no = fin_no;
		this.fund_rate = fund_rate;
		this.fund_risk = fund_risk;
	}
}
