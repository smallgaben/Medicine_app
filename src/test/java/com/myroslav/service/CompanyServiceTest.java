package com.myroslav.service;

import com.myroslav.model.dto.LazyCompanyDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/test-conf.xml"})
public class CompanyServiceTest {

    @Autowired
    private CompanyServiceImpl companyService = new CompanyServiceImpl();

    @Test
    public void shouldReturnLazyCompanyDTOList() throws Exception {
        List<LazyCompanyDTO> companies = companyService.findAll();
        assertFalse(companies.isEmpty());
        assertNotNull(companies.get(0));
    }
}
