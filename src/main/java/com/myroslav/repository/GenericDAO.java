package com.myroslav.repository;

import java.io.Serializable;
import java.util.Collection;

public interface GenericDAO<T extends Serializable> {
    T create(T model);

    T readById(String id);

    T readByName(String name);

    Collection<T> readAll();

    void delete(String id);
}
