# Tutorial do Aluno: Caso de Estudo do Vírus (SARS-CoV-2)

**Missão:** Somos cientistas em um laboratório de vigilância genômica. Nossa tarefa é analisar uma amostra de SARS-CoV-2, identificar suas mutações em relação à cepa original e visualizar os resultados.

---

### **Módulo 3: Análise no Galaxy**

**1. Importando os Dados do NCBI**
* Acesse o servidor [usegalaxy.org](https://usegalaxy.org).
* Na busca de ferramentas (à esquerda), procure por `Download and Extract Reads ... from NCBI SRA`.
* No campo **"Accession"**, cole o código: `SRR11411039`.
* Clique em **Execute**.
* No seu histórico (à direita), renomeie os dois arquivos de saída principais para `virus_forward` e `virus_reverse`.

**2. Controle de Qualidade (QC)**
* Na busca de ferramentas, procure por `FastQC`.
* Selecione os dois arquivos (`virus_forward` e `virus_reverse`).
* Clique em **Execute**.
* Ao terminar, clique no ícone de "olho" no arquivo "Webpage" para ver o relatório. Observe a qualidade das sequências.

**3. Limpeza dos Dados (Trimming)**
* Procure pela ferramenta `Trimmomatic`.
* Selecione **"Paired-end"**.
* Em **"FASTQ file 1"** e **"FASTQ file 2"**, selecione `virus_forward` e `virus_reverse`, respectivamente.
* Em **"Trimmomatic Operations"**, clique em **"Insert Trimmomatic Operation"**.
* Escolha **"Sliding window trimming (SLIDINGWINDOW)"** e mantenha os valores padrão (`4`, `20`).
* Clique em **Execute**.

**4. Mapeamento e Identificação de Variantes**
* **Mapeamento com `BWA-MEM`**:
    * Procure pela ferramenta `BWA-MEM`.
    * Selecione **"Use a built-in genome index"**.
    * Em **"Reference Genome"**, digite `SARS-CoV-2` e selecione a referência `hCoV-19/Wuhan-Hu-1`.
    * Selecione **"Paired-end"**.
    * Em **"Select first/second set of reads"**, selecione as saídas **paired** do Trimmomatic.
    * Clique em **Execute**. O resultado é um arquivo **BAM**.
* **Chamada de Variantes com `iVar variants`**:
    * Primeiro, busque a referência: procure a ferramenta `Reference Data - Fetch`, selecione a mesma referência do SARS-CoV-2 e execute.
    * Agora, procure pela ferramenta `iVar variants`.
    * Em **"BAM file"**, selecione o arquivo BAM gerado pelo BWA-MEM.
    * Em **"Reference FASTA"**, selecione o arquivo FASTA da referência que você acabou de buscar.
    * Clique em **Execute**. O resultado é um arquivo **TSV**.

---

### **Módulo 4: Visualização no Orange**

**1. Preparando os Dados**
* No Galaxy, clique no arquivo de saída **TSV** do iVar.
* Clique no ícone de **Download** (disquete) e salve o arquivo no seu computador como `variantes_virus.tsv`.

**2. Análise no Orange**
* Abra o Orange.
* Arraste um widget `File` para a tela. Dê um duplo-clique, encontre e carregue seu arquivo `variantes_virus.tsv`.
* Conecte o widget `File` a um `Data Table` para ver se os dados carregaram corretamente.
* **Análise 1 (Frequência):** Conecte o `File` a um widget `Distributions`. Abra-o e selecione a variável `ALT_FREQ` para ver a distribuição das frequências das mutações.
* **Análise 2 (Hotspots):** Conecte o `File` a um `Scatter Plot`. No eixo X, coloque `POS`; no eixo Y, `ALT_FREQ`. Observe se há regiões com maior concentração de mutações.
* **Explore!** Tente conectar outros widgets e selecionar dados nos gráficos para vê-los em outras visualizações.
