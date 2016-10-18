package com.myroslav.integration;

import org.junit.Assert;
import org.junit.Test;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

public class CompanyResourceIntegrationTest extends IntegrationConfig {
    @Test
    public void shouldReturnCompanies() throws Exception {
        Response response = getClient().target(BASE_URL + "companies").request(MediaType.APPLICATION_JSON).get();
        List list = response.readEntity(List.class);
        Assert.assertNotNull(list);
    }
}
