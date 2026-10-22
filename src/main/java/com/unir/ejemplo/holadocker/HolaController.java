package com.unir.ejemplo.holadocker;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HolaController {

    @GetMapping("/hello")
    public String saludar() {
        return "========================================================\n" +
               "      Universidad Internacional de La Rioja (UNIR)      \n" +
               "========================================================\n\n" +
               "Actividad: Scripting - Bash y despliegue local mediante Docker\n\n" +
               "Presentado por: Andrés Guillermo Rodríguez Molina\n" +
               "Fecha: Octubre 2026\n";
    }
}
