# Monitoria Sentran — atualização automática por Relatório 8 SPLTV

Este pacote inclui scripts para baixar e processar o **Relatório 8 — Status dos Equipamentos**.

## O que foi adicionado

- `config/centrais_spltv.json`: links extraídos da página **SPLTV — Cadastros**.
- `scripts/baixar_relatorio_spltv.py`: baixa o Relatório 8 pela central SPLTV.
- `scripts/processar_relatorio_8.py`: lê o XLSX e gera `status_equipamentos.json`.
- `scripts/atualizar_status_spltv.py`: baixa e processa em sequência.
- `data/relatorios/amparo/relatorio_8_atual.xlsx`: exemplo atual de Amparo.
- `data/status/status_equipamentos.json`: status gerado para o site.

## Instalação no servidor

```bash
cd /caminho/do/site
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python -m playwright install chromium
cp .env.example .env
```

Edite o `.env` com usuário e senha da SPLTV. Evite deixar senhas dentro dos arquivos HTML/JS.

## Processar um relatório já baixado

```bash
python scripts/processar_relatorio_8.py --contrato Amparo --arquivo data/relatorios/amparo/relatorio_8_atual.xlsx
```

## Baixar automaticamente e processar

```bash
export SPLTV_USUARIO="seu_usuario"
export SPLTV_SENHA="sua_senha"
python scripts/atualizar_status_spltv.py --contrato Amparo
```

## Sobrescrita automática

O relatório sempre é salvo como:

```text
data/relatorios/<contrato>/relatorio_8_atual.xlsx
```

Ou seja, ele sobrescreve o arquivo anterior e evita acúmulo de arquivos antigos.

## Cron exemplo

Rodar a cada 30 minutos:

```bash
*/30 * * * * cd /caminho/do/site && . .venv/bin/activate && SPLTV_USUARIO="usuario" SPLTV_SENHA="senha" python scripts/atualizar_status_spltv.py --contrato Amparo >> logs/status_spltv.log 2>&1
```

## Observação importante

A tela da SPLTV pode mudar de contrato para contrato. Se o download automático não encontrar o botão de exportação, rode com:

```bash
python scripts/baixar_relatorio_spltv.py --contrato Amparo --headed
```

Assim o navegador abre visível e fica mais fácil ajustar seletores específicos.
