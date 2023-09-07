package kbits.kb04.parasol.users.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import kbits.kb04.parasol.users.enums.Role;
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
	private Long userNo;
	
	
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
	private Integer userAge;
	
	@Enumerated(EnumType.STRING)
	private Role role;

	@OneToOne(mappedBy="users", optional=true)
	private UserAsset userAsset;

	
	public Users(@NotNull Long userNo, @NotNull String userId, @NotNull String userPw, @NotNull String userName,
			@NotNull int userAge) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userAge = userAge;
		this.role = Role.ROLE_USER;
	}




}