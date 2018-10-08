package com.eatogether.Consumer.Transformation;

import com.eatogether.Repository.RepositoryBean.UserBean;
import com.eatogether.Repository.UtilisateurPersistance;

public interface ITransformation {
    public UtilisateurPersistance fromUserBeanToUser(UserBean user);
}
