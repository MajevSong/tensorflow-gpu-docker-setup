@echo off

echo [🐳] Docker container başlatılıyor: %CONTAINER_NAME%
docker run --gpus all -it --rm tensorflow/tensorflow:2.15.0-gpu
