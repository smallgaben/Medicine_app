package com.myroslav.listener;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class WebAppInitialiser implements ServletContextListener {
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();
        ConfigurableApplicationContext springContext = new ClassPathXmlApplicationContext("core-conf.xml");
        servletContext.setAttribute("spring-context", springContext);
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
