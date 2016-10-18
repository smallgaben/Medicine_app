package com.myroslav.model.dto;

import com.myroslav.model.Medicine;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@ToString
public class CompanyDTO implements Serializable {
    private static final long serialVersionUID = 9059465463481173170L;

    private @Getter @Setter String id;

    private @Getter @Setter String name;

    private @Getter @Setter List<Medicine> medicine;
}