@echo off
echo [🔧] Gerekli Python paketleri yükleniyor...

REM tf-gpu-container çalışıyor mu kontrol et
docker ps -f "name=tf-gpu-container" --format "{{.Names}}" | findstr /i "tf-gpu-container" > nul
if %errorlevel% neq 0 (
    echo [❌] tf-gpu-container çalışmıyor! Lütfen önce container'ı başlat.
    exit /b 1
)

REM pip install komutunu çalıştır
docker exec tf-gpu-container pip install pandas wordcloud gensim scikit-learn seaborn

echo [✅] Kurulum tamamlandı.
pause
