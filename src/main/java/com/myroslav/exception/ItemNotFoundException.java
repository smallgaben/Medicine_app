package com.myroslav.exception;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

public class ItemNotFoundException extends WebApplicationException {
    public ItemNotFoundException() {
        super(Response.status(Response.Status.NOT_FOUND).build());
    }

    public ItemNotFoundException(String message) {
        super(Response.status(Response.Status.NOT_FOUND).entity(message).type(MediaType.TEXT_PLAIN).build());
    }

}
