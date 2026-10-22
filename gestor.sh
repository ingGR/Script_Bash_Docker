#!/bin/bash

while true; do
    echo "========================================"
    echo "  GESTOR - hola-docker"
    echo "========================================"
    echo "1. Verificar prerrequisitos"
    echo "2. Compilar y empaquetar"
    echo "3. Construir imagen Docker"
    echo "4. Ejecutar contenedor Docker"
    echo "5. Mostrar estado actual"
    echo "6. Salir"
    read -p "Selecciona una opción [1-6]: " opcion
    echo ""

    case $opcion in
        1)
            echo "--- 1. Prerrequisitos ---"
            for cmd in java docker mvn; do
                if command -v "$cmd" &> /dev/null; then
                    echo "[OK] $cmd está instalado."
                else
                    echo "[X]  $cmd NO está instalado."
                fi
            done
            ;;

        2)
            echo "--- 2. Compilando aplicación ---"
            if [ -f "./mvnw" ]; then
                ./mvnw clean package -DskipTests
            else
                mvn clean package -DskipTests
            fi

            if [ -f "target/hola-docker-0.0.1-SNAPSHOT.jar" ]; then
                echo "-> Éxito: JAR creado en target/hola-docker-0.0.1-SNAPSHOT.jar"
            else
                echo "-> Error: No se pudo generar el JAR."
            fi
            ;;

        3)
            echo "--- 3. Construyendo Imagen ---"
            if [ -f "target/hola-docker-0.0.1-SNAPSHOT.jar" ]; then
                docker build -t hola-docker-image .
            else
                echo "-> Error: Primero debes compilar (Opción 2)."
            fi
            ;;

        4)
            echo "--- 4. Ejecutando Contenedor ---"
            if [ -z "$(docker images -q hola-docker-image 2>/dev/null)" ]; then
                echo "-> Error: La imagen no existe. Ejecuta primero la opción 3."
            else
                if [ -n "$(docker ps -a -q -f name=^/hola-docker-container$)" ]; then
                    read -p "El contenedor ya existe. ¿Deseas eliminarlo y recrearlo? (s/n): " resp
                    if [ "$resp" = "s" ]; then
                        docker stop hola-docker-container &>/dev/null
                        docker rm hola-docker-container &>/dev/null
                    else
                        echo "Operación cancelada."
                        continue
                    fi
                fi
                docker run -d -p 8080:8080 --name hola-docker-container hola-docker-image
                echo "-> Contenedor listo en: http://localhost:8080/hello"
            fi
            ;;

        5)
            echo "--- 5. Estado Actual ---"
            if [ -f "target/hola-docker-0.0.1-SNAPSHOT.jar" ]; then
                echo "JAR: Existe ($(ls -lh target/hola-docker-0.0.1-SNAPSHOT.jar | awk '{print $5}'))"
            else
                echo "JAR: No existe"
            fi

            if [ -n "$(docker images -q hola-docker-image 2>/dev/null)" ]; then
                echo "Imagen Docker: Existe"
            else
                echo "Imagen Docker: No existe"
            fi

            if [ -n "$(docker ps -q -f name=^/hola-docker-container$)" ]; then
                echo "Contenedor: En ejecución"
            else
                echo "Contenedor: Detenido / No existe"
            fi
            ;;

        6)
            echo "¡Saliendo!"
            exit 0
            ;;

        *)
            echo "Opción no válida."
            ;;
    esac
    echo ""
done
