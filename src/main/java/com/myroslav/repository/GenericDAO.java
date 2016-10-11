package com.myroslav.repository;

import java.io.Serializable;

public interface GenericDAO<T extends Serializable> {
    T create(T model);

    T readById(String id);

    T readByName(String name);

    void update(T model);

    void delete(String id);
}
