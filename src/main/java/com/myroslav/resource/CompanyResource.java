package com.myroslav.resource;

import com.myroslav.exception.ItemNotFoundException;
import com.myroslav.model.dto.CompanyDTO;
import com.myroslav.model.dto.LazyCompanyDTO;
import com.myroslav.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.persistence.NoResultException;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
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
    public CompanyDTO findCompany(@PathParam("id") String id) {
        CompanyDTO companyDTO;
        try {
            companyDTO = companyService.findById(id);
        } catch (NoResultException e) {
            throw new ItemNotFoundException("Company with id= " + id + " not found");
        }
        return companyDTO;
    }

    @GET
    @Path("/name/{name}")
    public CompanyDTO findByName(@PathParam("name") String name) {
        CompanyDTO companyDTO;
        try {
            companyDTO = companyService.findByName(name);
        } catch (NoResultException e) {
            throw new ItemNotFoundException("Company with name= " + name + " not found");
        }

        return companyDTO;
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createCompany(CompanyDTO companyDTO) {
        try {
            companyService.createCompany(companyDTO);
        }catch (Exception e){
            return Response.status(Response.Status.BAD_REQUEST).entity("illegal parameters in request").type(MediaType.TEXT_PLAIN).build();
        }

        return Response.status(Response.Status.OK).build();
    }
}
