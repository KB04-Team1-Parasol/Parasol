package kbits.kb04.parasol.users.dto;

import kbits.kb04.parasol.users.entity.UserAsset;
import kbits.kb04.parasol.users.entity.Users;
import lombok.Data;


@Data
public class AssetInputRequestDto {

	private Long user_no,pure_asset,fin_asset,real_asset,
	debt,monthly_income,annuity,hope_age,hope_period;


	// 자산정보 담을 Dto에 Users 테이블 추가로 담기 
	public UserAsset userAssetFromDto() {
		return new UserAsset(user_no,pure_asset,fin_asset,real_asset,
	debt,monthly_income,annuity,hope_age,hope_period);
	}
	
}
