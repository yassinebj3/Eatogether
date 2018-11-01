package com.eatogether.Consumer.Implementation;
import com.eatogether.Consumer.IUsers;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.transaction.Transactional;

public class UsersImplementation implements IUsers {

    EntityManagerFactory EntityManagerfactory = Persistence.createEntityManagerFactory("org.hibernate.tutorial.jpa");

    EntityManager entityManager = EntityManagerfactory.createEntityManager();

    private String USER_DETAILS="Select u from UtilisateurBean u where u.adressemail =:newmail";
    private String USER_DETAILS_BY_ID="Select u from UtilisateurBean u where u.id =: id";


    @Override
    public void persistuser(UtilisateurBean user) {
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
    }

    @Override
    public void deleteUser(UtilisateurBean user) {

        entityManager.getTransaction().begin();
        entityManager.remove(user);
        entityManager.getTransaction().commit();

    }

    @Override
    public UtilisateurBean getUserDetails(String mail) {
        Query details =entityManager.createQuery(USER_DETAILS);
        details.setParameter("newmail",mail);

        return (UtilisateurBean) details.getSingleResult();
    }

    @Override
    @Transactional
    public UtilisateurBean updateUserInformations(UtilisateurBean user) {
        UtilisateurBean utilisateurBean= entityManager.merge(user);
        //entityManager.flush();
        return utilisateurBean;



    }

    @Override
    public UtilisateurBean getUserByID(int id) {
        Query details =entityManager.createQuery(USER_DETAILS_BY_ID);
        details.setParameter("id",id);

        return (UtilisateurBean) details.getSingleResult();
    }


}