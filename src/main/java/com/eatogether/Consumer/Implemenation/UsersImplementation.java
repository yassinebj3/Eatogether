package com.eatogether.Consumer.Implemenation;
import com.eatogether.Consumer.IUsers;
import com.eatogether.Repository.RepositoryBean.UserBean;
import com.eatogether.Repository.UtilisateurPersistance;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsersImplementation implements IUsers {

    EntityManagerFactory EntityManagerfactory = Persistence.createEntityManagerFactory("org.hibernate.tutorial.jpa");

    EntityManager entityManager = EntityManagerfactory.createEntityManager();

    private String USER_DETAILS="Select u from UtilisateurPersistance u where u.adressemail =:newmail";


    @Override
    public void persistuser(UtilisateurPersistance user) {
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
    }

    @Override
    public void deleteUser(UtilisateurPersistance user) {

        entityManager.getTransaction().begin();
        entityManager.remove(user);
        entityManager.getTransaction().commit();

    }

    @Override
    public UtilisateurPersistance getUserDetails(String mail) {
        Query details =entityManager.createQuery(USER_DETAILS);
        details.setParameter("newmail",mail);

        return (UtilisateurPersistance) details.getSingleResult();
    }

    @Override
    public UtilisateurPersistance updateUserInformations(UtilisateurPersistance user) {
        return entityManager.merge(user);

    }


}
