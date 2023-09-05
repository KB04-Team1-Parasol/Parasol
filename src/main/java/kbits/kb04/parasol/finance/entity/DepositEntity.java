package kbits.kb04.parasol.finance.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "deposit")
public class DepositEntity {

	@Id
	@JoinColumn(name = "fin_no", nullable = false)
	private long fin_no;
	
	
	@OneToOne
	@MapsId
	@JoinColumn(name="fin_no")
	private FinanceEntity financeEntity;

	
	@Column(name = "deposit_period")
	private int deposit_period;
	
	@Column(name = "deposit_rate")
	private float deposit_rate;
	
	// constructor 

	public DepositEntity(Long fin_no, int deposit_period, float deposit_rate) {
		super();
		this.fin_no = fin_no;
		this.deposit_period = deposit_period;
		this.deposit_rate = deposit_rate;
	}
}
