package com.eatogether.Consumer.Transformation.Implementation;

import com.eatogether.Consumer.Transformation.ITransformation;
import com.eatogether.Repository.RepositoryBean.UserBean;
import com.eatogether.Repository.UtilisateurPersistance;

import java.sql.Timestamp;

public class TransformationUser implements ITransformation {

    public UtilisateurPersistance fromUserBeanToUser(UserBean user)
    {
        UtilisateurPersistance userpersistance= new UtilisateurPersistance();
        userpersistance.setNom(user.getNom());
        userpersistance.setPrenom(user.getPrenom());
        userpersistance.setPseudo(user.getPseudo());
        userpersistance.setAdressemail(user.getMail());
        userpersistance.setMotpasse(user.getMotdepasse());
        userpersistance.setDatedenaissance(new Timestamp(user.getDatenaissance().getTime()));
        return userpersistance;

    }

    @Override
    public UserBean fromUserToUserBean(UtilisateurPersistance user) {
        UserBean userBean= new UserBean();
        userBean.setNom(user.getNom());
        userBean.setPrenom(user.getPrenom());
        userBean.setPseudo(user.getPseudo());
        userBean.setMail(user.getAdressemail());
        userBean.setMotdepasse(user.getMotpasse());
        userBean.setDatenaissance(new Timestamp(user.getDatedenaissance().getTime()));
        return userBean;
    }
}
