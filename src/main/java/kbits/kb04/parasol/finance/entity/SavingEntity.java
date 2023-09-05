package kbits.kb04.parasol.finance.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "saving")
public class SavingEntity {
	@Id
	@JoinColumn(name = "fin_no", nullable = false)
    private Long fin_no;
	
	@OneToOne
	@MapsId
	@JoinColumn(name="fin_no")
	private FinanceEntity financeEntity;

	
	@Column(name = "saving_period")
	private int saving_period;
	
	@Column(name = "max_cost")
	private int max_cost;
	
	@Column(name = "saving_rate")
	private float saving_rate;
	
	// constructor 

	public SavingEntity(Long fin_no, int saving_period, int max_cost, float saving_rate) {
		super();
		this.fin_no = fin_no;
		this.saving_period = saving_period;
		this.max_cost = max_cost;
		this.saving_rate = saving_rate;
	}
}
