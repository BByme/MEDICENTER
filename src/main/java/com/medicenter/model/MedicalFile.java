package com.medicenter.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class MedicalFile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;


    @Getter
    @Setter
    private long owner;

    @Getter
    @Setter
    private double tension;

    @Getter
    @Setter
    private double glycemie;

    @Getter
    @Setter
    private double vision;

    @Getter
    @Setter
    private String seuilAlert;

    @Getter
    @Setter
    private String messageAlert;

}
