package com.myroslav.repository;

import com.myroslav.model.Company;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/test-conf.xml"})
public class CompanyDAOImplTest {
    private static final String ID="68831943-7e41-435d-bc4b-a030b8c8f6f2";
    private static final String COMPANY_NAME="Frais Luxury Products";
    private static final int OCCURRENCES_COUNT =47;
    @Autowired
    private CompanyDAO companyDAO;


    @Test
    @Transactional
    @Rollback
    public void shouldGenerateIdWhileCreatingCompanyObject() throws Exception {
        Company company=new Company();
        company.setName("Test_name");
        String oldId=company.getId();
        companyDAO.create(company);
        String newId=company.getId();

        Assert.assertNotEquals(oldId, newId);
    }

    @Test
    public void shouldReadCompanyObjectById() throws Exception {
        Company company = companyDAO.readById(ID);
        Assert.assertEquals(company.getName(),COMPANY_NAME);
    }

    @Test
    public void shouldReadCompanyObjectByName() throws Exception {
        Company company=companyDAO.readByName(COMPANY_NAME);
        Assert.assertEquals(ID, company.getId());
    }

    @Test
    @Transactional
    @Rollback
    public void shouldChangeCompanyObjectData() throws Exception {
        String newName="test_name";
        Company company = companyDAO.readById(ID);
        String oldName=company.getName();
        company.setName(newName);

        Assert.assertNotEquals(oldName, companyDAO.readById(ID).getName());
    }

    @Test
    public void shouldReturnAllOccurrences(){
        Assert.assertEquals(companyDAO.readAll().size(), OCCURRENCES_COUNT);
    }

    @Test
    @Transactional
    @Rollback
    public void shouldRemoveCompanyObjectFromDB() throws Exception {
        companyDAO.delete(ID);
        Assert.assertNull(companyDAO.readById(ID));
    }
}
