package com.myroslav.repository;

import com.myroslav.model.Medicine;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class MedicineDAO implements GenericDAO<Medicine> {

    @PersistenceContext
    private @Getter @Setter EntityManager entityManager;

    public Medicine create(Medicine model) {
        entityManager.persist(model);
        return entityManager.find(model.getClass(), model.getId());
    }

    public Medicine readById(String id) {
        return entityManager.find(Medicine.class, id);
    }

    public Medicine readByName(String name) {
        return entityManager.find(Medicine.class, name);
    }

    public void update(Medicine model) {
        entityManager.persist(model);
    }

    public void delete(String id) {
        entityManager.detach(readById(id));
    }
}
