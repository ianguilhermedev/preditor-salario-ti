# Salário em Dados Predictor

Este projeto tem como objetivo aplicar técnicas de regressão e classificação sobre os dados da pesquisa State of Data 2024 para estimar em qual faixa salarial um profissional de TI no Brasil se encaixa.

## Visão Geral

O conjunto de dados original contém mais de 400 colunas. Para construir o modelo, foram selecionadas variáveis que têm forte relação com a remuneração, como idade, senioridade, stack, tempo de experiência, cargo e situação de trabalho.

Também foram consideradas questões de viés social. Colunas como gênero, cor/raça/etnia e deficiência foram removidas da modelagem para evitar que o modelo reproduzisse desigualdades sociais nas previsões.

## Abordagem do Modelo

O projeto começou com uma abordagem de regressão (RandomForestRegressor), em que as faixas salariais foram convertidas em valores numéricos por meio do ponto médio de cada faixa. No entanto, como os dados salariais são discretos e não contínuos, o modelo chegou a um limite de desempenho. Isso levou a mudança da abordagem para um problema de classificação.

## Decisões de Modelagem

Para reduzir a granularidade do alvo, as 13 categorias originais foram agrupadas em 6 buckets maiores, preservando a relação ordinal entre as faixas salariais. Uma vantagem disso foi que antes havia um desbalanceamento de 33 vezes entre a maior e a menor classe, o que foi reduzido para 2,75 vezes. 

Também foram tratados os valores ausentes nas colunas cargo, senioridade, setor, UF e formação, substituindo-os por “Nao informado”. 

Além disso, o uso de class_weight='balanced' contribuiu ao gerar uma redistribuição, especialmente ganhou nas pontas e na 6-8k

## Resultados Principais

O modelo apresentou f1_macro de 0.49 no test set, estatisticamente igual ao obtido na validação cruzada (0.49) — indicando que o modelo generaliza, sem sinais de overfitting. A análise da matriz de confusão mostrou que os erros tendem a ocorrer em categorias vizinhas, o que sugere que a lógica ordinal das faixas salariais foi preservada.

## Limitações

O modelo apresenta maior dificuldade em prever categorias salariais centrais, especialmente nas faixas de R$ 6.001 a R$ 8.000 e de R$ 8.001 a R$ 12.000, isso se da por essas faixas serem estreitas e terem vizinhos ao lado e as features disponíveis não conterem informações que separem quem ganha R$7.900 de quem ganha R$8.100, pois pela diferença salarial elas podem ter exatamente o mesmo cargo, senioridade e tempo de experiência. Em contrapartida, as faixas extremas apresentam desempenho melhor.

## Estrutura do Repositório

```bash
preditor-salario-ti/
├── data/
│   ├── raw/
│   └── processed/
├── models/
├── notebooks/
├── src/
├── tests/
├── pyproject.toml
└── README.md
```

## Como Executar

#### Requisitos
- Python 3.10+
- uv

#### Instalação

```bash
uv venv .venv --python 3.12
.\.venv\Scripts\Activate.ps1
uv sync
uv run jupyter notebook
```

## Próximos Passos
- incluir novas edições da pesquisa State of Data;
- tornar o fluxo mais facilmente reutilizavel
- Tentar uma analise com mais features/mais categorias no target
- Gerar uma interface interativa para o usuário gerar uma previsão mais facilmente