package com.myroslav.repository;

import com.myroslav.model.Company;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import java.util.Collection;

import static org.hibernate.FetchMode.JOIN;
import static org.hibernate.hql.internal.antlr.HqlTokenTypes.FETCH;

@Repository
public class CompanyDAOImpl implements CompanyDAO {

    @PersistenceContext
    private @Getter @Setter EntityManager entityManager;

    public Company create(Company model) {
        entityManager.persist(model);
        return entityManager.find(model.getClass(), model.getId());
    }

    public Company readById(String id) {
        return entityManager.createQuery("select c from Company c join fetch c.medicine m where c.id = :id", Company.class)
                .setHint("org.hibernate.readOnly", true)
                .setParameter("id", id)
                .getSingleResult();
    }

    public Company readByName(String name) {
        return entityManager.createQuery("select c from Company c where c.name like :name", Company.class)
                .setHint("org.hibernate.readOnly", true)
                .setParameter("name", name)
                .getSingleResult();
    }

    public Collection<Company> readAll() {
        return entityManager.createQuery("select c from Company c", Company.class).setHint("org.hibernate.readOnly", true).getResultList();
    }

    public void delete(String id) {
        entityManager.remove(readById(id));
    }
}
