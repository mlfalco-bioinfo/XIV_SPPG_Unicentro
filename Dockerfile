# 1. Imagem Base
# Usamos uma imagem oficial do Python, na versão "slim", que é baseada em Debian e bem menor que a padrão.
FROM python:3.11-slim-bookworm

# 2. Instalação de Dependências do Sistema
# O Orange3 usa a biblioteca gráfica PyQt5, que por sua vez precisa de algumas bibliotecas do Linux para funcionar.
# Usamos --no-install-recommends para manter a imagem o menor possível.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    libxext6 \
    libxrender1 \
    libsm6 \
    libfontconfig1 \
    libxkbcommon-x11-0 && \
    # Limpa o cache do apt para reduzir o tamanho final da imagem
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 3. Copia o arquivo de requerimentos para dentro da imagem
COPY requirements.txt .

# 4. Instalação das Bibliotecas Python
# O --no-cache-dir também ajuda a manter a imagem menor.
RUN pip install --no-cache-dir -r requirements.txt
