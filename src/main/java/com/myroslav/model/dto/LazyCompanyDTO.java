package com.myroslav.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@ToString
public class LazyCompanyDTO implements Serializable {
    private static final long serialVersionUID = 4372722969943318684L;

    private @Getter @Setter String id;

    private @Getter @Setter String name;
}
