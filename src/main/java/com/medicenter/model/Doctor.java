package com.medicenter.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Getter
    @Setter
    private String nom;

    @Getter
    @Setter
    private String prenom;

    @Getter
    @Setter
    private String email;

    @Getter
    @Setter
    @OneToOne
    @JoinColumn(name = "id")
    private Contact id_contact;


}