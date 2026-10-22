# Scripting - Bash y despliegue local mediante Docker

## 📖 Descripción del Proyecto
Este proyecto automatiza la compilación, empaquetado y despliegue de una aplicación Java Spring Boot dentro de un contenedor Docker, orquestado íntegramente a través de scripts de Bash.

El proyecto se inicializó originalmente utilizando **Spring Initializr** (`start.spring.io`) para establecer la arquitectura base de la aplicación. Posteriormente, durante la fase de validación y pruebas de despliegue en una **máquina virtual Linux en AWS (Amazon EC2 - Amazon Linux 2023)**, se realizaron modificaciones estructurales esenciales:
* Se reestructuró la jerarquía de paquetes Java (`com.unir.ejemplo.holadocker`) para resolver conflictos en el escaneo de componentes (`@RestController`).
* Se crearon scripts de aprovisionamiento de entorno y gestión de contenedores para automatizar el ciclo de vida del software de forma desatendida.

## 🛠️ Preparación del Entorno (AWS EC2 / Linux)
instalar y configurar todas las dependencias necesarias:
* Git
* Java 17 (Amazon Corretto)
* Docker (con configuración de permisos de grupo)
* Apache Maven (v3.9.9)

