package com.myroslav.service;

import com.myroslav.model.Company;
import com.myroslav.model.dto.CompanyDTO;
import com.myroslav.model.dto.LazyCompanyDTO;
import com.myroslav.repository.CompanyDAO;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Transactional
@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDAO companyDAO;

    @Autowired
    private Mapper mapper;

    public List<LazyCompanyDTO> findAll() {
        Collection<Company> companies = companyDAO.readAll();

        List<LazyCompanyDTO> lazyCompanyDTOs =new ArrayList<LazyCompanyDTO>(companies.size());

        for(Company company: companies){
            lazyCompanyDTOs.add(mapper.map(company, LazyCompanyDTO.class));
        }

        return lazyCompanyDTOs;
    }

    public CompanyDTO findById(String id) {
        Company company = companyDAO.readById(id);
        return mapper.map(company, CompanyDTO.class);
    }

    public CompanyDTO findByName(String name) {
        Company company= companyDAO.readByName(name);
        return mapper.map(company, CompanyDTO.class);
    }

    public void createCompany(CompanyDTO companyDTO) {
        Company company=mapper.map(companyDTO, Company.class);
        companyDAO.create(company);
    }
}
