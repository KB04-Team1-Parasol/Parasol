package kbits.kb04.parasol.users.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access=AccessLevel.PROTECTED)
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "users_SEQ")
	@SequenceGenerator(sequenceName = "users_SEQ", allocationSize = 1, name = "users_SEQ")
	@NotNull
	@Column(name = "user_no")
	private int userNo;
	
	
	@NotNull
	@Column(name = "user_id")
	private String userId;
	
	@NotNull
	@Column(name = "user_pw")
	private String userPw;
	
	@NotNull
	@Column(name = "user_name")
	private String userName;
	
	@NotNull
	@Column(name = "user_age")
	private int userAge;

	@OneToOne(mappedBy="users", optional=true)
	private UserAsset userAsset;

	
	public Users(@NotNull int userNo, @NotNull String userId, @NotNull String userPw, @NotNull String userName,
			@NotNull int userAge) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userAge = userAge;
	}




}