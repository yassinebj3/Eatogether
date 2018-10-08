package com.eatogether.Consumer;

import com.eatogether.Repository.RepositoryBean.UserBean;
import com.eatogether.Repository.UtilisateurPersistance;

public interface IUsers {

    public void persistuser(UtilisateurPersistance user);
}
