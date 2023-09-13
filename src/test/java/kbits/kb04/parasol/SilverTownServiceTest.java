package kbits.kb04.parasol;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.web.WebAppConfiguration;

import kbits.kb04.parasol.finance.entity.Saving;
import kbits.kb04.parasol.silver.dto.SilverTownCustomUserDto;
import kbits.kb04.parasol.silver.entity.SilverTown;
import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import kbits.kb04.parasol.silver.repository.SilverTownDetailRepository;
import kbits.kb04.parasol.silver.service.SilverTownService;
import kbits.kb04.parasol.users.entity.UserAsset;
import kbits.kb04.parasol.users.entity.Users;
import kbits.kb04.parasol.users.service.UsersService;

@SpringBootTest
@WebAppConfiguration
class SilverTownServiceTest {
	@Autowired
	private SilverTownService silverTownService;
	@Autowired
	private UsersService userService;
	@Autowired
	private SilverTownDetailRepository silverTownDetailRepository;

	@Test
	void 예치금계산() {
		Users user = userService.findByUserId("d");
		SilverTownCustomUserDto userDto = silverTownService.setUserDto(user);

		int yechigeum = silverTownService.getYechigeum(userDto);
		System.out.println("예치금: " + yechigeum);
	}

	@Test
	void 미래기준총자산() {
		Users user = userService.findByUserId("d");
		SilverTownCustomUserDto userDto = silverTownService.setUserDto(user);

		int futureAsset = silverTownService.getFutureAsset(userDto);
		System.out.println("총자산: " + futureAsset);
	}

}
