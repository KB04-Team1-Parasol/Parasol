package kbits.kb04.parasol.finance.entity;

import javax.persistence.*;

import kbits.kb04.parasol.finance.dto.FinanceDto;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table(name = "finance")
public class FinanceEntity2 {
	@Id
	//시퀀스 생성기 사용 
	@GeneratedValue(
            strategy=GenerationType.SEQUENCE, // 시퀀스 생성 
            generator="fin_SEQ" // 생성기 이름 
            )
	@SequenceGenerator(sequenceName = "fin_SEQ", allocationSize = 1, name = "fin_SEQ")
	@Column(name = "fin_no")
	private Long fin_no;

	@Column(name = "fin_name")
	private String fin_name;
	
	@Column(name = "fin_type")
	private int fin_type;
	
	@Column(name = "fin_link")
	private String fin_link;

	@Builder
	public String toString() {
		return "FinanceEntity2 [fin_no=" + fin_no + ", fin_name=" + fin_name + ", fin_type=" + fin_type + ", fin_link="
				+ fin_link + "]";
	}
	
	
	
}
