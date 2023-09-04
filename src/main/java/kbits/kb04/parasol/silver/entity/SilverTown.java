package kbits.kb04.parasol.silver.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class SilverTown {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "silver_SEQ")
	@SequenceGenerator(sequenceName = "silver_SEQ", allocationSize = 1, name = "silver_SEQ")
	private int userNo;

	@NotNull
	private String user_id;
	@NotNull
	private String user_pw;
	@NotNull
	private String user_name;
	@NotNull
	private int user_age;

	public SilverTown(int userNo, String user_id, String user_pw, String user_name, int user_age) {
		this.userNo = userNo;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_age = user_age;
	}

}
