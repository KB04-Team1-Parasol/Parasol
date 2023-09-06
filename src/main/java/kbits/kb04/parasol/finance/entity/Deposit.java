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
	private Long depositNo;

	@Column(name = "deposit_name")
	private String depositName;
	
	@Column(name = "deposit_period")
	private Long depositPeriod;
	
	@Column(name = "deposit_rate")
	private Float depositRate;
	
	@Column(name = "deposit_link")
	private String depositLink;
	
	// constructor
	public Deposit(long depositNo, String depositName, long depositPeriod, float depositRate, String depositLink) {
		super();
		this.depositNo = depositNo;
		this.depositName = depositName;
		this.depositPeriod = depositPeriod;
		this.depositRate = depositRate;
		this.depositLink = depositLink;
	}
}