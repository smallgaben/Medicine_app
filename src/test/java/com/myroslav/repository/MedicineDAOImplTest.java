package com.myroslav.repository;

import com.myroslav.model.Company;
import com.myroslav.model.Medicine;
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
public class MedicineDAOImplTest {

    @Autowired
    private MedicineDAO medicineDAO;

    private static final String ID="63832943-7e41-435d-bc4b-a030b8c8f6f2";

    /**
     * Number of objects you can find in test_dump.sql
     */
    private static final int TOTAL_OBJECTS=1;

    @Test
    @Transactional
    @Rollback()
    public void shouldGenerateIdWhileCreatingMedicineObject() throws Exception {
        Medicine medicine=new Medicine();
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

    @Test
    @Transactional
    public void shouldReadMedicineObject() throws Exception {
        Assert.assertNotNull(medicineDAO.readById(ID));
    }

    @Test
    @Transactional
    @Rollback
    public void shouldUpdateDataOfMedicineObject() throws Exception {
        Medicine medicine = medicineDAO.readById(ID);
        String oldName=medicine.getName();
        medicine.setName("test_name");
        medicineDAO.readById(ID);
        Assert.assertNotEquals(medicine.getName(), oldName);
    }

    @Test
    @Transactional
    @Rollback
    public void shouldRemoveMedicineObjectFromDB() throws Exception {
        medicineDAO.delete(ID);
        Assert.assertNull(medicineDAO.readById(ID));
    }

    @Test
    @Transactional
    public void shouldFindAllOccurrence() throws Exception{
        Assert.assertEquals(medicineDAO.readAll().size(), TOTAL_OBJECTS);
    }
}
