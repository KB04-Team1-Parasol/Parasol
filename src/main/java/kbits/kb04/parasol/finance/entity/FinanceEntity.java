package kbits.kb04.parasol.finance.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "finance")
public class FinanceEntity {
	@Id
	//시퀀스 생성기 사용 
	@GeneratedValue(
            strategy=GenerationType.SEQUENCE, // 시퀀스 생성 
            generator="fin_SEQ" // 생성기 이름 
            )
	@SequenceGenerator(sequenceName = "fin_SEQ", allocationSize = 1, name = "fin_SEQ")
    private Long fin_no;

	@Column(name = "fin_name")
	private String fin_name;
	
	@Column(name = "fin_type")
	private int fin_type;
	
	@Column(name = "fin_link")
	private String fin_link;
	
	// constructor 
	public FinanceEntity(Long fin_no, String fin_name, int fin_type, String fin_link) {
		super();
		this.fin_no = fin_no;
		this.fin_name = fin_name;
		this.fin_type = fin_type;
		this.fin_link = fin_link;
	}
}
