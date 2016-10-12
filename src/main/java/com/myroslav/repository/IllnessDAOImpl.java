package com.myroslav.repository;

import com.myroslav.model.Illness;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collection;

@Repository
@Transactional
public class IllnessDAOImpl implements IllnessDAO{
    @PersistenceContext
    private @Getter @Setter EntityManager entityManager;

    public Illness create(Illness model) {
        entityManager.persist(model);
        return entityManager.find(model.getClass(), model.getId());
    }

    public Illness readById(String id) {
        return entityManager.find(Illness.class, id);
    }

    public Illness readByName(String name) {
        return entityManager.createQuery("select i from Illness i where i.name like :name", Illness.class)
                .setParameter("name", name)
                .getSingleResult();
    }

    public Collection<Illness> readAll() {
        return entityManager.createQuery("select i from Illness i", Illness.class).getResultList();
    }

    public void delete(String id) {
        entityManager.remove(readById(id));
    }
}
