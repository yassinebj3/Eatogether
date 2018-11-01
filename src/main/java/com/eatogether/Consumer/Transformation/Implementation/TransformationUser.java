package com.eatogether.Consumer.Transformation.Implementation;

import com.eatogether.Consumer.Transformation.IUserTransformation;
import com.eatogether.Repository.User;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;

import java.sql.Timestamp;

public class TransformationUser implements IUserTransformation {

    public UtilisateurBean fromUserToUserBean(User user)
    {
        UtilisateurBean userpersistance= new UtilisateurBean();
        userpersistance.setNom(user.getNom());
        userpersistance.setPrenom(user.getPrenom());
        userpersistance.setPseudo(user.getPseudo());
        userpersistance.setAdressemail(user.getMail());
        userpersistance.setMotpasse(user.getMotdepasse());
        userpersistance.setDatedenaissance(user.getDatenaissance());
        return userpersistance;

    }

    @Override
    public User fromUserBeanToUser(UtilisateurBean user) {
        User userBean= new User();
        System.out.println("---------------"+user.getNom());
        userBean.setNom(user.getNom());
        userBean.setPrenom(user.getPrenom());
        userBean.setPseudo(user.getPseudo());
        userBean.setMail(user.getAdressemail());
        userBean.setMotdepasse(user.getMotpasse());
        userBean.setDatenaissance(new Timestamp(user.getDatedenaissance().getTime()));
        return userBean;
    }
}
