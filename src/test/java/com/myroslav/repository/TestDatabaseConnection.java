package com.myroslav.repository;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/test-conf.xml"})
public class TestDatabaseConnection {

    @PersistenceContext
    private EntityManager entityManager;

    @Test
    public void entityManagerShouldExists() throws Exception {
        Assert.assertNotNull(entityManager);
    }
}
