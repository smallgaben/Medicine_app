package com.myroslav.repository;

import com.myroslav.model.Company;
import com.myroslav.model.Medicine;
import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/test-conf.xml"})
public class MedicineDAOTest {

    @Autowired
    private MedicineDAO medicineDAO;
    private Medicine medicine;

    @Test
    public void shouldChangeGeneratedIdWhileCreating() throws Exception {
        medicine=new Medicine();
        medicine.setName("Test_name");
        Company company=new Company();
        company.setName("Test_company");
        medicine.setCompany(company);
        medicine.setDescription("Test_description");

        String idBefore=medicine.getId();
        medicineDAO.create(medicine);
        String idAfter=medicine.getId();

        Assert.assertNotEquals(idBefore, idAfter);
    }

    @After
    public void cleanTestData(){
        medicineDAO.delete(medicine.getId());
    }
}
