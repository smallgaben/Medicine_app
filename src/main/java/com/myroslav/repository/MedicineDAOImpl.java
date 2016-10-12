package com.myroslav.repository;

import com.myroslav.model.Medicine;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collection;

@Repository
@Transactional
public class MedicineDAOImpl implements MedicineDAO {

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
        return entityManager.createQuery("select m from Medicine m where m.name like :name", Medicine.class)
                .setParameter("name", name)
                .getSingleResult();
    }

    public Collection<Medicine> readAll() {
        return entityManager.createQuery("select m from Medicine m", Medicine.class).getResultList();
    }

    public void delete(String id) {
        entityManager.remove(readById(id));
    }
}
