# Tutorial do Aluno: Caso de Estudo da Planta (Arabidopsis thaliana)

**Missão:** Somos botânicos investigando uma planta que sobreviveu a um herbicida. Suspeitamos de uma mutação em seu cloroplasto. Nossa tarefa é analisar o genoma do cloroplasto para encontrar a "agulha no palheiro".

---

### **Módulo 3: Análise no Galaxy**

**1. Importando os Dados do NCBI**
* Acesse o servidor [usegalaxy.org](https://usegalaxy.org).
* Na busca de ferramentas (à esquerda), procure por `Download and Extract Reads ... from NCBI SRA`.
* No campo **"Accession"**, cole o código: `SRR5199232`.
* Clique em **Execute**.
* No seu histórico (à direita), renomeie os dois arquivos de saída principais para `planta_forward` e `planta_reverse`.

**2. Controle de Qualidade (QC)**
* Na busca de ferramentas, procure por `FastQC`.
* Selecione os dois arquivos (`planta_forward` e `planta_reverse`).
* Clique em **Execute**.
* Ao terminar, clique no ícone de "olho" no arquivo "Webpage" para ver o relatório.

**3. Limpeza dos Dados (Trimming)**
* Procure pela ferramenta `Trimmomatic`.
* Selecione **"Paired-end"**.
* Em **"FASTQ file 1"** e **"FASTQ file 2"**, selecione `planta_forward` e `planta_reverse`.
* Em **"Trimmomatic Operations"**, clique em **"Insert Trimmomatic Operation"**.
* Escolha **"Sliding window trimming (SLIDINGWINDOW)"** e mantenha os valores padrão (`4`, `20`).
* Clique em **Execute**.

**4. Mapeamento e Identificação de Variantes**
* **Mapeamento com `BWA-MEM`**:
    * Procure pela ferramenta `BWA-MEM`.
    * Selecione **"Use a built-in genome index"**.
    * Em **"Reference Genome"**, digite `athaliana` e selecione a referência do cloroplasto (ex: `Ensembl Chloroplast`).
    * Selecione **"Paired-end"**.
    * Em **"Select first/second set of reads"**, selecione as saídas **paired** do Trimmomatic.
    * Clique em **Execute**. O resultado é um arquivo **BAM**.
* **Chamada de Variantes com `iVar variants`**:
    * Primeiro, busque a referência: procure a ferramenta `Reference Data - Fetch`, selecione a mesma referência do cloroplasto e execute.
    * Agora, procure pela ferramenta `iVar variants`.
    * Em **"BAM file"**, selecione o arquivo BAM gerado pelo BWA-MEM.
    * Em **"Reference FASTA"**, selecione o arquivo FASTA da referência que você acabou de buscar.
    * Clique em **Execute**. O resultado é um arquivo **TSV**.

---

### **Módulo 4: Visualização no Orange**

**1. Preparando os Dados**
* No Galaxy, clique no arquivo de saída **TSV** do iVar.
* Clique no ícone de **Download** (disquete) e salve o arquivo no seu computador como `variantes_planta.tsv`.

**2. Análise no Orange**
* Abra o Orange.
* Arraste um widget `File` para a tela. Dê um duplo-clique, encontre e carregue seu arquivo `variantes_planta.tsv`.
* Conecte o `File` a um `Data Table` para ver os dados.
* **Análise 1 (Tipo de Mutação):**
    * Conecte o `File` a um widget `Feature Constructor`.
    * Crie uma nova feature `Tipo_Mutacao` com a expressão `REF + " > " + ALT`.
    * Conecte o `Feature Constructor` a um `Distributions` e visualize a nova feature.
* **Análise 2 (Exploração):** Conecte o `File` a um `Scatter Plot`. No eixo X, coloque `POS`; no eixo Y, `TOTAL_DP` (profundidade de leitura). Tente colorir os pontos por `ALT_QUAL` (qualidade).
* **Explore!** Tente usar a seleção interativa entre o `Scatter Plot` e o `Data Table` para investigar variantes específicas.
