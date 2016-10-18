package com.myroslav.resource;

import com.myroslav.model.dto.CompanyDTO;
import com.myroslav.model.dto.LazyCompanyDTO;
import com.myroslav.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/companies")
@Produces({MediaType.APPLICATION_JSON})
@Controller
public class CompanyResource {
    @Autowired
    private CompanyService companyService;

    @GET
    public List<LazyCompanyDTO> findAllCompanies() {
        return companyService.findAll();
    }

    @GET
    @Path("{id}")
    public CompanyDTO findCompany(@PathParam("id") String id){
        return companyService.findById(id);
    }
}
