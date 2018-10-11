package com.eatogether.Consumer.Implemenation;

import com.eatogether.Consumer.ICategories;
import com.eatogether.Repository.CategoriesPersistence;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.ArrayList;

public class CategoriesImplementation implements ICategories {
    EntityManagerFactory EntityManagerfactory = Persistence.createEntityManagerFactory("org.hibernate.tutorial.jpa");

    EntityManager entityManager = EntityManagerfactory.createEntityManager();

    @Override
    public void persistListCateories(ArrayList<CategoriesPersistence> liste) {
        entityManager.getTransaction().begin();
        for(CategoriesPersistence categoriePersistence :liste)
        {
            entityManager.persist(categoriePersistence);
        }
        entityManager.getTransaction().commit();


    }
}
