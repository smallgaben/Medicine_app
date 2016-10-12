package com.myroslav.repository;

import com.myroslav.model.Company;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collection;

@Repository
@Transactional
public class CompanyDAOImpl implements CompanyDAO{

    @PersistenceContext
    private @Getter @Setter EntityManager entityManager;

    public Company create(Company model) {
        entityManager.persist(model);
        return entityManager.find(model.getClass(), model.getId());
    }

    public Company readById(String id) {
        return entityManager.find(Company.class, id);
    }

    public Company readByName(String name) {
        return entityManager.createQuery("select c from Company c where c.name like :name", Company.class)
                .setParameter("name",name)
                .getSingleResult();
    }

    public Collection<Company> readAll() {
        return entityManager.createQuery("select c from Company c", Company.class).getResultList();
    }

    public void delete(String id) {
        entityManager.remove(readById(id));
    }
}
