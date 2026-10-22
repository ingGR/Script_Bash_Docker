# Scripting - Bash y despliegue local mediante Docker

## 📖 Descripción del Proyecto
Este proyecto automatiza la compilación, empaquetado y despliegue de una aplicación Java Spring Boot dentro de un contenedor Docker, orquestado íntegramente a través de scripts de Bash.

El proyecto se inicializó originalmente utilizando **Spring Initializr** (`start.spring.io`) para establecer la arquitectura base de la aplicación. Posteriormente, durante la fase de validación y pruebas de despliegue en una **máquina virtual Linux en AWS (Amazon EC2 - Amazon Linux 2023)**, se realizaron modificaciones estructurales esenciales:
* Se reestructuró la jerarquía de paquetes Java (`com.unir.ejemplo.holadocker`) para resolver conflictos en el escaneo de componentes (`@RestController`).
* Se creó script gestión de contenedores para automatizar el ciclo de vida del software:
* Opciones del gestor:

  1.Verificar dependencias: Comprueba que Maven, Java y Docker estén instalados.

  2.Compilar y empaquetar: Ejecuta mvn clean package -DskipTests para generar el .jar.

  3.Construir imagen Docker: Ejecuta docker build utilizando el Dockerfile del proyecto.

  4.Ejecutar contenedor: Lanza el contenedor mapeando el puerto 8080:8080. (Permite sobreescribir contenedores anteriores).

  5.Ver estado del contenedor: Muestra los contenedores en ejecución (docker ps).

  6.Salir: Finaliza el script

## 🛠️ Preparación del Entorno (AWS EC2 / Linux)
instalar y configurar todas las dependencias necesarias:
* Git
* Java 17 (Amazon Corretto)
* Docker (con configuración de permisos de grupo)
* Apache Maven (v3.9.9)

