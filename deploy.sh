#!/bin/bash

set -e

echo "🚀 Iniciando despliegue..."

echo "🧹 Limpiando contenedores anteriores..."
docker stop backend frontend 2>/dev/null || true
docker rm backend frontend 2>/dev/null || true

echo "🏗️ Construyendo backend..."
cd back
docker build -t tareas-backend . --no-cache

echo "🏗️ Construyendo frontend..."
cd ../front
docker build -t tareas-frontend . --no-cache
cd ..

echo "🌐 Creando red Docker..."
docker network create tareas-network 2>/dev/null || true

echo "🚀 Iniciando backend..."
docker run -d --name backend \
    --network tareas-network \
    -p 5000:5000 \
    --add-host=host.docker.internal:host-gateway \
    tareas-backend

sleep 5

echo "🚀 Iniciando frontend..."
docker run -d --name frontend \
    --network tareas-network \
    -p 80:80 \
    --add-host=host.docker.internal:host-gateway \
    tareas-frontend


echo "✅ Verificando contenedores..."
if [ "$(docker ps -q -f name=backend)" ] && [ "$(docker ps -q -f name=frontend)" ]; then
    echo "✨ ¡Despliegue exitoso!"
    echo "📱 Frontend: http://localhost"
    echo "🔌 Backend: http://localhost:5000"
    
    echo "📝 Logs del backend:"
    docker logs backend
    echo "📝 Logs del frontend:"
    docker logs frontend
else
    echo "❌ Error: Los contenedores no están ejecutándose"
    echo "📝 Logs del backend:"
    docker logs backend
    echo "📝 Logs del frontend:"
    docker logs frontend
    exit 1
fi
