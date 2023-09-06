package kbits.kb04.parasol.users.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access=AccessLevel.PROTECTED)
public class UserAsset {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_asset_SEQ")
	@SequenceGenerator(sequenceName = "user_asset_SEQ", allocationSize = 1, name = "user_asset_SEQ")	
	@NotNull
	@Column(name = "user_no")
	private int userNo;
	
	
	
	@Column(name = "pure_asset")
	private int pureAsset;
	
	
	@Column(name = "fin_asset")
	private int finAsset;
	
	
	@Column(name = "real_asset")
	private int realAsset;
	
	
	@Column(name = "debt")
	private int debt;
	
	// 저축 가능 금액 (로직 계산 시 참고)
	@Column(name = "monthly_income")
	private int monthlyIncome;
	
	
	@Column(name = "annuity")
	private int annuity;
	
	
	@Column(name = "hope_age")
	private int hopeAge;
	
	
	@Column(name = "hope_period")
	private int hopePeriod;

	@OneToOne
	@JoinColumn(name="user_no")
	private Users users;
	
	public UserAsset(@NotNull int userNo, int pureAsset, int finAsset, int realAsset, int debt, int monthlyIncome, int annuity,
			int hopeAge, int hopePeriod) {
		super();
		this.userNo = userNo;
		this.pureAsset = pureAsset;
		this.finAsset = finAsset;
		this.realAsset = realAsset;
		this.debt = debt;
		this.monthlyIncome = monthlyIncome;
		this.annuity = annuity;
		this.hopeAge = hopeAge;
		this.hopePeriod = hopePeriod;
	}
	
	
	




}