# Guia do Professor - Minicurso de Bioinformática Visual

Este guia contém dicas e pontos de atenção para ajudar na condução do minicurso.

### **Geral**
* **Ritmo:** O Módulo 3 (Galaxy) é o mais denso. Monitore o progresso dos alunos. O Galaxy pode ser um pouco lento dependendo do número de usuários no servidor. Tenha os resultados já prontos em um histórico separado, caso precise mostrar o passo seguinte enquanto os alunos esperam.
* **Erros Comuns:** O erro mais comum é selecionar o arquivo de entrada errado para uma ferramenta. Enfatize a importância de renomear os arquivos e prestar atenção nos nomes.

### **Módulo 2: Preparando o Ambiente**
* **Conta Galaxy:** Peça para os alunos criarem a conta *antes* do curso, se possível, para economizar tempo.
* **Instalação Orange:** A instalação é simples, mas pode levar alguns minutos. Use esse tempo para introduzir os casos de estudo.

### **Módulo 3: Análise no Galaxy**
* **`FastQC`:** Não se aprofunde demais no relatório. Mostre apenas o gráfico "Per base sequence quality" para justificar o uso do Trimmomatic. O objetivo é ensinar o fluxo, não a teoria profunda de QC.
* **`Trimmomatic`:** A ferramenta gera 4 saídas. Deixe claro para os alunos que eles devem usar os arquivos **"paired"** na etapa seguinte.
* **`BWA-MEM` (Seleção de Referência):** Esta é uma etapa crítica. Mostre claramente como buscar e selecionar o genoma de referência correto para cada caso. A busca pode ser sensível a nomes (ex: `SARS-CoV-2` vs `hCoV-19`).
* **`iVar variants`:** A necessidade de buscar o arquivo FASTA da referência com a ferramenta `Reference Data - Fetch` pode confundir. Faça este passo de forma lenta e clara.

### **Módulo 4: Análise no Orange**
* **Widget `File`:** A etapa de configurar os tipos de coluna ("Role") é a mais importante. Se `POS` e `ALT_FREQ` não forem definidos como "Feature", eles não aparecerão nos widgets de visualização. Mostre isso com calma.
* **Insights a Destacar:**
    * **Vírus:** Foque em como o gráfico de distribuições (`ALT_FREQ`) mostra que a maioria das variantes é "fixada" (frequência ~1.0), indicando uma população viral homogênea na amostra.
    * **Planta:** Destaque como o `Feature Constructor` permite criar conhecimento novo (o tipo de mutação) a partir dos dados brutos, e como isso é poderoso.
    * **Interatividade:** O "momento mágico" da aula é quando os alunos selecionam pontos no `Scatter Plot` e veem as linhas correspondentes acenderem no `Data Table`. Gaste um minuto para que todos consigam fazer isso.

### **Encerramento**
* Reforce a ideia de que eles completaram um fluxo de trabalho real de bioinformática e que as mesmas ferramentas são usadas por cientistas em pesquisas publicadas. Isso gera uma sensação de empoderamento.
