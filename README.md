# Monitoria Sentran

Site estático para consulta de equipamentos, ocorrências, aferições e status online/offline baseado em arquivos JSON.

## Estrutura principal

```text
.
├── index.html                  # página inicial
├── login.html                  # login simples local
├── nav-equipamentos.html       # menu/consulta de equipamentos
├── ocorrencias.html            # ocorrências e solicitações
├── afericao.html               # aferições
├── status.html                 # status online/offline
├── equipamentos.json           # base principal de equipamentos
├── equipamentos-data.js        # fallback local para equipamentos
├── status_equipamentos.json    # status gerado pelo motor
├── status-data.js              # fallback local para status
├── styles.css
├── main.js
├── scripts/                    # motor Python
├── config/                     # centrais SPLTV
└── .env.example                # modelo de credenciais
```

## Como publicar no GitHub

1. Crie um repositório no GitHub, por exemplo `monitoria-sentran`.
2. Envie todos os arquivos desta pasta para o repositório.
3. Não envie o arquivo `.env`; use somente `.env.example` como modelo.

## Como publicar no Render como Static Site

1. No Render, escolha **New Static Site**.
2. Conecte o repositório GitHub.
3. Configure:
   - **Build Command:** deixe vazio.
   - **Publish Directory:** `.`
4. Clique em Deploy.

## Login atual do site

- Editor: `admin` / `Sentran12`
- Visualização: `visitante` / `Sentran12`

> Observação: esse login é apenas controle visual no front-end. Para segurança real será necessário backend.

## Motor de status SPLTV

O motor Python fica na pasta `scripts/`. Ele processa o Relatório 8 e gera:

- `status_equipamentos.json`
- `status-data.js`

Esses arquivos são lidos pela página `status.html`.

### Rodar localmente no Windows

1. Instale Python 3.11+.
2. Execute `instalar_dependencias_windows.bat`.
3. Copie `.env.example` para `.env` e preencha usuário/senha.
4. Execute `atualizar_status_uma_vez_windows.bat`.

### Rodar localmente no Linux

```bash
chmod +x instalar_dependencias_linux.sh iniciar_motor_status_linux.sh
./instalar_dependencias_linux.sh
cp .env.example .env
# edite o .env
./iniciar_motor_status_linux.sh
```

## Arquivos que não devem ir para o GitHub

O `.gitignore` já bloqueia:

- `.env`
- relatórios baixados (`.xlsx`, `.csv`, `.pdf`)
- logs
- arquivos temporários
- ambientes Python

## Próximos passos sugeridos

- Criar um Cron Job no Render para executar o motor Python.
- Salvar o JSON atualizado em local público consumido pelo Static Site.
- Adicionar novos contratos no `config/centrais_spltv.json`.
