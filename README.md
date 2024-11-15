# Ejercicio: Dockerización de una Aplicación Full Stack

## Objetivo
Crear los Dockerfiles correctos para hacer funcionar una aplicación de lista de tareas que usa:
- Frontend: React + Vite
- Backend: Flask

## Requisitos
1. Crear dos Dockerfiles:
   - `front/Dockerfile` para el frontend
   - `back/Dockerfile` para el backend

2. Los contenedores deben:
   - Frontend: exponer puerto 80
   - Backend: exponer puerto 5000

## Criterios de Evaluación
1. La aplicación debe funcionar correctamente al ejecutar `deploy.sh`
2. El frontend debe poder comunicarse con el backend
3. Los contenedores deben ser lo más ligeros posible
4. Las imágenes deben construirse sin errores

## Archivos proporcionados
- Todo el código fuente de la aplicación
- Script de despliegue (deploy.sh)
- Configuración de nginx
- Archivos de dependencias (package.json y requirements.txt)

## Pistas
- Frontend: Considera usar multi-stage building con node:18-alpine y nginx:alpine
- Backend: Usa python:3.9-slim-buster 
