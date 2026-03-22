package cl.cachoza.server.fhir_hl7.api.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

    @GetMapping("/server/")
    public String getServer() {
        return "Hello, World!";
    }   

}



