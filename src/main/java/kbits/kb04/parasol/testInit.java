package kbits.kb04.parasol;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import kbits.kb04.parasol.silver.service.SilverTownInitService;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class testInit {
	private final SilverTownInitService silverTownInitService; 
	
	@PostConstruct
    public void init() {
        silverTownInitService.dbInit1();
    }
}
