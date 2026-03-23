package cl.cachoza.server.fhirhl7.api.controllers;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

    
    @GetMapping("/server")
    public  ResponseEntity<String> getServer() {
        return ResponseEntity.ok("{'Hello': 'World!'}"  );
    }   


}



