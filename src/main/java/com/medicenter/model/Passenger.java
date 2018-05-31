package com.medicenter.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class Passenger {

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
    private long id_contact;

    @Getter
    @Setter
    private long id_doctor;
}
