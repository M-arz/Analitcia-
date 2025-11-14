FROM python:3.10-slim

# Crear directorio de trabajo
WORKDIR /app

# Copiar todo el proyecto al contenedor
COPY . /app

# Actualizar pip
RUN pip install --upgrade pip

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Render usa el puerto 10000
EXPOSE 10000

# Ejecutar con Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:10000", "app:app"]
