package com.myroslav.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "illness")
@ToString
@EqualsAndHashCode(exclude = {"name","medicines"})
public class Illness {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 100)
    private @Getter @Setter String id;

    @Column(name="name", unique = true, length = 300)
    private @Getter @Setter String name;

    @ManyToMany(mappedBy = "illnesses")
    private @Getter @Setter List<Medicine> medicines=new ArrayList<Medicine>();
}
