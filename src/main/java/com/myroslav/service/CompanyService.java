package com.myroslav.service;

import com.myroslav.model.dto.LazyCompanyDTO;

import java.util.List;

public interface CompanyService {
    List<LazyCompanyDTO> findAll();
}
