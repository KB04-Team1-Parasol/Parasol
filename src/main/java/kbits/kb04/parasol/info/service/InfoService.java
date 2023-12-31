package kbits.kb04.parasol.info.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kbits.kb04.parasol.info.dto.PostDto;
import kbits.kb04.parasol.info.entity.Information;
import kbits.kb04.parasol.info.repository.InfoRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InfoService {

	// Repository 객체 생성
	@Autowired
	private final InfoRepository infoRepository;

	public Page<PostDto> getPosts(int page, int pageSize) {
		Pageable pageable = PageRequest.of(page - 1, pageSize); // 페이지 번호는 1부터 시작하므로 1을 빼줍니다.
		Page<Information> InfoPage = infoRepository.findAll(pageable);

		return InfoPage.map(this::convertToDto);
	}

	
	
	private PostDto convertToDto(Information info) {
		return new PostDto(info.getInfoNo(), 
				info.getInfoTitle(), 
				info.getInfoContent(),
				info.getInfoDate(),
				info.getInfoImg());
	}

	// 페이지에서 번호 받아오기
	public Optional<Information> findByInfoNo(Long infoNo) {
		return infoRepository.findByInfoNo(infoNo);
	}

}
