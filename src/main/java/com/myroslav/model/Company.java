package com.myroslav.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="company")
@ToString
@EqualsAndHashCode(exclude = {"name", "medicine"})
public class Company implements Serializable{
    private static final long serialVersionUID = 4372722969943318684L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id")
    private @Getter @Setter String id;

    @Column(name="name", unique = true, length = 300)
    private @Getter @Setter String name;

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL, orphanRemoval = true)
    private @Getter @Setter List<Medicine> medicine=new ArrayList<Medicine>();
}
