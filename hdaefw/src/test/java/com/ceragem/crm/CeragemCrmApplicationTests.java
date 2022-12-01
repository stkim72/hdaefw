package com.ceragem.crm;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.ceragem.crm.common.util.Utilities;

@SpringBootTest
class CeragemCrmApplicationTests {

	@Test
	void contextLoads() {
		Utilities.trace("test");
	}

}
