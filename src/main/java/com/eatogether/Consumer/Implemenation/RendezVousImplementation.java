package com.eatogether.Consumer.Implemenation;

import com.eatogether.Consumer.IRendezVous;
import com.eatogether.Repository.RepositoryBean.CategoriesBean;
import com.eatogether.Repository.RepositoryBean.RendezVousBean;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.Date;

public class RendezVousImplementation implements IRendezVous {

    EntityManagerFactory EntityManagerfactory = Persistence.createEntityManagerFactory("org.hibernate.tutorial.jpa");
    EntityManager entityManager = EntityManagerfactory.createEntityManager();

    String GET_LISTE_RDVS="select u from RendezVousBean u where u.idsource= :user";
    String DELETE_RDV="Delete from RendezVousBean u where u.idsource= :userliker AND u.idvise =:usertarget";
    String UPDATE_RDV="Update  RendezVousBean u set u.daterdv =:Date where u.idRdv =:id";

    @Override
    public void createRendezvous(RendezVousBean rdv) {
        entityManager.getTransaction().begin();

            entityManager.persist(rdv);

        entityManager.getTransaction().commit();
    }

    @Override
    public ArrayList<RendezVousBean> ConsulterRdv(UtilisateurBean user) {
        entityManager.getTransaction().begin();

        Query details =entityManager.createQuery(GET_LISTE_RDVS);
        details.setParameter("user",user);
        entityManager.getTransaction().commit();

        return (ArrayList<RendezVousBean>) details.getResultList();
    }

    @Override
    public void deleteRdv(UtilisateurBean userconnected, UtilisateurBean userTodelete) {
        entityManager.getTransaction().begin();

        Query query = entityManager.createQuery(DELETE_RDV);
        query.setParameter("userliker",userconnected);
        query.setParameter("usertarget",userTodelete);
        query.executeUpdate();
        entityManager.getTransaction().commit();

    }

    @Override
    public void UpdateDateRdv(RendezVousBean rdv,Date daterdv) {

        entityManager.getTransaction().begin();

        Query query = entityManager.createQuery(UPDATE_RDV);
        query.setParameter("Date",daterdv);
        query.setParameter("id",rdv.getIdRdv());
        query.executeUpdate();
        entityManager.getTransaction().commit();


    }
}
