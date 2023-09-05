package kbits.kb04.parasol.silver.service;

import org.springframework.stereotype.Service;

import kbits.kb04.parasol.silver.entity.SilverTown;
import kbits.kb04.parasol.silver.entity.SilverTownDetail;
import kbits.kb04.parasol.silver.repository.SilverTownDetailRepository;
import kbits.kb04.parasol.silver.repository.SilverTownRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SilverTownInitService {
	
	private final SilverTownRepository stRepo;
	private final SilverTownDetailRepository stdRepo;
	
	public void dbInit1() {
		SilverTown st = insertSilverTown("노블레스 타워", "서울", "서울시 성북구 종암로90", "testimg1", 2, 1, "사우나, 찜질방, 헬스, 에스테틱, 영화관, 의료시설", "http://n-tower.co.kr/index.php", 2);
		insertSilverTownDetail("소형-1", 33300, 125, 18, 1, st);
		insertSilverTownDetail("소형-2", 35000, 128, 19, 1, st);
		insertSilverTownDetail("소형-3", 42000, 138, 22, 1, st);
		insertSilverTownDetail("중형-1", 55000, 230, 33, 2, st);
		insertSilverTownDetail("중형-2", 58000, 236, 37, 2, st);
		insertSilverTownDetail("중형-3", 70000, 258, 45, 2, st);
		st = insertSilverTown("더 클래스 500", "서울", "서울특별시 광진구 능동로 90", "testimg2", 3, 1, "사우나, 헬스, 골프, 수영장", "https://www.theclassic500.com/index.do", 3);
		insertSilverTownDetail("A, A-1, B, B-1", 90000, 487, 56, 2, st);
		st = insertSilverTown("하이원 빌리지", "서울", "서울 용산구 한강대로40가길 24", "testimg3", 1, 1, "헬스, 사우나, 찜질방, 골프, 당구", "http://highwon.kr/", 3);
		insertSilverTownDetail("22형", 33000, 99, 10, 1, st);
		insertSilverTownDetail("32형", 43000, 139, 14, 2, st);
		insertSilverTownDetail("44형", 57000, 167, 19, 2, st);
		insertSilverTownDetail("46형", 57000, 170, 21, 2, st);
		insertSilverTownDetail("59형", 70000, 200, 26, 2, st);
    }
	
	public SilverTown insertSilverTown(
			String stName, 
			String city,
			String address,
			String stImgUrl, 
			int stScale,
			int stType,
			String stFacility,
			String stUrl,
			int stPeriod
			) {
		SilverTown st = new SilverTown(stName, city, address, stImgUrl, stScale, stType, stFacility, stUrl, stPeriod, null);
		stRepo.save(st);
		return st;
	}

	public void insertSilverTownDetail(
			String stdRoomType,
			int stdDeposit,
			int stdMonthlyCost,
			int stdRoomSize,
			int stdOccupancy,
			SilverTown silverTown
			) {
		SilverTownDetail std = new SilverTownDetail(stdRoomType, stdDeposit, stdMonthlyCost, stdRoomSize, stdOccupancy, silverTown);
		stdRepo.save(std);
	}
	
}
