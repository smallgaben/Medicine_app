package com.myroslav.service;

import com.myroslav.model.Company;
import com.myroslav.model.dto.LazyCompanyDTO;
import com.myroslav.repository.CompanyDAO;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDAO companyDAO;

    @Autowired
    private Mapper mapper;

    public List<LazyCompanyDTO> findAll() {
        Collection<Company> companies = companyDAO.readAll();

        List<LazyCompanyDTO> lazyCompanyDTOs =new ArrayList<LazyCompanyDTO>();

        for(Company company: companies){
            lazyCompanyDTOs.add(mapper.map(company, LazyCompanyDTO.class));
        }

        return lazyCompanyDTOs;
    }
}
