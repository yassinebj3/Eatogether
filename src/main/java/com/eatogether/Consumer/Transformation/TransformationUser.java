package com.eatogether.Consumer.Transformation;

import com.eatogether.Repository.RepositoryBean.UserBean;
import com.eatogether.Repository.UtilisateurPersistance;

public class TransformationUser implements ITransformation {

    public UtilisateurPersistance fromUserBeanToUser(UserBean user)
    {
        UtilisateurPersistance userpersistance= new UtilisateurPersistance();
        userpersistance.setNom(user.getNom());
        return userpersistance;

    }
}
