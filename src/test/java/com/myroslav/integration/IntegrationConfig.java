package com.myroslav.integration;

import org.glassfish.jersey.client.ClientConfig;
import org.glassfish.jersey.jackson.JacksonFeature;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;

abstract class IntegrationConfig {
    final static String BASE_URL = "http://localhost:8080/medicineapp/";

    private Client configureClient() {
        ClientConfig clientConfig = new ClientConfig().register(JacksonFeature.class);
        return ClientBuilder.newClient(clientConfig);
    }

    Client getClient() {
        return configureClient();
    }
}
