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
@Table(name="medicine")
@ToString(exclude = {"components", "illnesses"})
@EqualsAndHashCode(exclude = {"name","company","description","components","illnesses"})
public class Medicine {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 100)
    private @Getter @Setter String id;

    @Column(name="name", unique = true, length = 300)
    private @Getter @Setter String name;

    @ManyToOne
    @JoinColumn(name="company_id")
    private @Getter @Setter Company company;

    @Column(name="description", length = 500)
    private @Getter @Setter String description;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(
            name="medicine_component",
            joinColumns=@JoinColumn(name="medicine_id"),
            inverseJoinColumns = @JoinColumn(name="component_id")
    )
    private @Getter @Setter List<Component> components=new ArrayList<Component>();

    @ManyToMany
    @JoinTable(
            name="medicine_illness",
            joinColumns = @JoinColumn(name="medicine_id"),
            inverseJoinColumns = @JoinColumn(name="illness_id")
    )
    private @Getter @Setter List<Illness> illnesses=new ArrayList<Illness>();
}
