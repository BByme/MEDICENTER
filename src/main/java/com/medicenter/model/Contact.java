package com.medicenter.model;





import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class Contact {
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
    private String tel;

    @Getter
    @Setter
    @OneToOne
    @JoinColumn(name = "id")
    private Passenger id_passenger;

    @Getter
    @Setter
    @OneToOne
    @JoinColumn(name = "id")
    private Driver id_driver;

}
