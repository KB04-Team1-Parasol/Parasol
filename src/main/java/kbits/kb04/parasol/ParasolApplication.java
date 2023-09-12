package kbits.kb04.parasol;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class ParasolApplication {

	public static void main(String[] args) {
		SpringApplication.run(ParasolApplication.class, args);
	}
}