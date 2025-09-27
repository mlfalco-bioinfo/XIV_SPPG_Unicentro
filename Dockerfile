# 1. Imagem Base
FROM python:3.11-slim-bookworm

# 2. Instalação de Dependências do Sistema
# Adicionamos uma lista mais completa de bibliotecas para garantir que o plugin gráfico "xcb" do Qt carregue corretamente.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    # Dependências gráficas gerais
    libgl1 \
    libglib2.0-0 \
    # Dependências cruciais para o plugin XCB
    libxcb1 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    && \
    # Limpa o cache do apt para reduzir o tamanho final da imagem
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 3. Copia o arquivo de requerimentos para dentro da imagem
COPY requirements.txt .

# 4. Instalação das Bibliotecas Python
RUN pip install --no-cache-dir -r requirements.txt
