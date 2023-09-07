package kbits.kb04.parasol.info.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kbits.kb04.parasol.info.entity.Information;
import kbits.kb04.parasol.info.repository.InfoRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InfoService {

	// Repository 객체 생성
	@Autowired
	private final InfoRepository infoRepository;

	@Transactional
	public List<Information> findAllByInfoNo() {
		List<Information> posts = infoRepository.findAll();
		posts.forEach(System.out::println);
		
		return posts;
	}

}
