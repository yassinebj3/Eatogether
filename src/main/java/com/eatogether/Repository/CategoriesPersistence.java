package com.eatogether.Repository;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Categories")
public class CategoriesPersistence {

    @Id
    @Column(name = "id")
    private int idcategorie;

    @Column(name = "nameCategory")
    private String nomCategorie;

    @Column(name = "descriptionCategory")
    private String descriptionCategorie;

    public CategoriesPersistence(int idcategorie, String nomCategorie, String descriptionCategorie) {
        this.idcategorie = idcategorie;
        this.nomCategorie = nomCategorie;
        this.descriptionCategorie = descriptionCategorie;
    }

    public CategoriesPersistence() {
    }
}
