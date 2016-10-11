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
@Table(name="component")
@ToString
@EqualsAndHashCode(exclude = {"name","medicines"})
public class Component implements Serializable{
    private static final long serialVersionUID = 1426633781527331306L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id")
    private @Getter @Setter String id;

    @Column(name="name", unique = true, length = 300)
    private @Getter @Setter String name;

    @ManyToMany(mappedBy = "components")
    private @Getter @Setter List<Medicine> medicines=new ArrayList<Medicine>();
}
