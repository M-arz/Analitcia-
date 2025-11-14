# Usa una imagen oficial de Python 3.10
FROM python:3.10-slim

# Evita que Python genere archivos .pyc
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Crea y establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de dependencias
COPY requirements.txt .

# Instala las dependencias
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo el proyecto al contenedor
COPY . .

# Expone el puerto que Render usará
EXPOSE 10000

# Comando para ejecutar la app con Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:10000", "app:app"]
