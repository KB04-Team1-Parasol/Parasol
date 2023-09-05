/**
 * 적금 Entity
 * 적금 식별번호, 상품이름, 기간, 최대금액, 이자율, 링크 
 */

package kbits.kb04.parasol.finance.entity;
import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "saving")
public class Saving {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "saving_SEQ")
	@SequenceGenerator(sequenceName = "saving_SEQ", allocationSize = 1, name = "saving_SEQ")	
	private long saving_no;

	@Column(name = "saving_name")
	private String savingName;
	
	@Column(name = "saving_period")
	private long savingPeriod;
	
	@Column(name = "max_cost")
	private long maxCost;
	
	@Column(name = "saving_max")
	private float savingMax;
	
	@Column(name = "saving_link")
	private String savingLink;
	
}
