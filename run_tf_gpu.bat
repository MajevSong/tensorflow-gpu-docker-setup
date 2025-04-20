@echo off
setlocal

echo [🧠] TensorFlow + GPU otomatik başlatıcı devrede...

REM === 1. Docker Desktop açık mı? ===
tasklist /FI "IMAGENAME eq Docker Desktop.exe" | find /I "Docker Desktop.exe" >nul
if %ERRORLEVEL% neq 0 (
    echo [🚀] Docker Desktop başlatılıyor...
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    timeout /t 10 >nul
) else (
    echo [✔] Docker Desktop zaten açık.
)

REM === 2. Docker servisini bekle ===
echo [⏳] Docker hazır hale getiriliyor...
:wait_docker
docker info >nul 2>&1
if %ERRORLEVEL% neq 0 (
    timeout /t 3 >nul
    goto wait_docker
)
echo [✅] Docker servisi aktif.

REM === 3. tf-gpu-container zaten çalışıyor mu? ===
docker ps --filter "name=tf-gpu-container" --filter "status=running" | findstr tf-gpu-container >nul
if %ERRORLEVEL% == 0 (
    echo [🟢] TensorFlow konteyneri zaten çalışıyor. İşlem yapılmadı.
    goto end
)

REM === 4. Önceki konteyner varsa sil ===
docker ps -a --filter "name=tf-gpu-container" | findstr tf-gpu-container >nul
if %ERRORLEVEL% == 0 (
    echo [🧹] Önceki konteyner kaldırılıyor...
    docker rm -f tf-gpu-container >nul
)

REM === 5. Konteyneri başlat ===
echo [🚀] TensorFlow GPU konteyneri başlatılıyor...
docker run --gpus all -d --name tf-gpu-container ^
 -p 8888:8888 -v "%cd%:/workspace" ^
 tensorflow/tensorflow:2.15.0-gpu-jupyter ^
 jupyter notebook --notebook-dir=/workspace --ip=0.0.0.0 --allow-root --no-browser

echo [🔓] Jupyter başlatıldı: http://localhost:8888

:end
endlocal
pause
