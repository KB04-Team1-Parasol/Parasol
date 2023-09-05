/**
 * 예금 Entity
 * 예금 식별번호, 상품이름, 기간, 만기이자율, 링크
 */

package kbits.kb04.parasol.finance.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "deposit")
public class Deposit {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "deposit_SEQ")
	@SequenceGenerator(sequenceName = "deposit_SEQ", allocationSize = 1, name = "deposit_SEQ")	
	private long deposit_no;

	@Column(name = "deposit_name")
	private String depositName;
	
	@Column(name = "deposit_period")
	private long depositPeriod;
	
	@Column(name = "deposit_rate")
	private float depositRate;
	
	@Column(name = "deposit_link")
	private String depositLink;
	
	// constructor
	public Deposit(long deposit_no, String depositName, long depositPeriod, float depositRate, String depositLink) {
		super();
		this.deposit_no = deposit_no;
		this.depositName = depositName;
		this.depositPeriod = depositPeriod;
		this.depositRate = depositRate;
		this.depositLink = depositLink;
	}
}
