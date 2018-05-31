package com.medicenter.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class NavSystem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Getter
    @Setter
    private String navId;

    @Getter
    @Setter
    private String nom;

    @Getter
    @Setter
    private String carModel;

    @Getter
    @Setter
    private long userId;
}
