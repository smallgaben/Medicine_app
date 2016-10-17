package com.myroslav;

import com.myroslav.resource.CompanyResource;
import org.glassfish.jersey.jackson.JacksonFeature;
import org.glassfish.jersey.server.ResourceConfig;

public class Application extends ResourceConfig {
    public Application() {
        packages(CompanyResource.class.getPackage().getName());
        register(JacksonFeature.class);
    }
}
