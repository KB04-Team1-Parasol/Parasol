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
	private Long fund_no;

	@Column(name = "fund_name")
	private String fund_name;
	
	@Column(name = "fund_rate")
	private Float fund_rate;
	

	@Column(name = "fund_risk")
	private Integer fund_risk;
	
	@Column(name = "fund_link")
	private String fund_link;
	
	// constructor

}
