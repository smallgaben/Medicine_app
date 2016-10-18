package com.myroslav.repository;

import com.myroslav.model.Component;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collection;

@Repository
public class ComponentDAOImpl implements ComponentDAO{
    @PersistenceContext
    private @Getter @Setter EntityManager entityManager;

    public Component create(Component model) {
        entityManager.persist(model);
        return entityManager.find(model.getClass(), model.getId());
    }

    public Component readById(String id) {
        return entityManager.find(Component.class, id);
    }

    public Component readByName(String name) {
        return entityManager.createQuery("select c from Component c where c.name like :name", Component.class)
                .setParameter("name", name)
                .getSingleResult();
    }

    public Collection<Component> readAll() {
        return entityManager.createQuery("select c from Component c", Component.class).getResultList();
    }

    public void delete(String id) {
        entityManager.remove(readById(id));
    }
}
