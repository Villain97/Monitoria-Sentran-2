# Motor local de atualização automática - Status dos equipamentos

Este pacote permite atualizar a aba **Status** em qualquer máquina onde a pasta do site esteja salva.

O motor faz este fluxo:

1. Acessa a central SPLTV configurada em `config/centrais_spltv.json`.
2. Baixa o **Relatório 8 - Status dos Equipamentos**.
3. Salva sempre no mesmo arquivo, sobrescrevendo o anterior:
   `data/relatorios/<contrato>/relatorio_8_atual.xlsx`
4. Processa o relatório.
5. Atualiza:
   - `status_equipamentos.json`
   - `status-data.js`

O `status-data.js` é importante porque permite que a aba Status continue funcionando mesmo quando o HTML é aberto localmente no computador.

---

## Primeiro uso no Windows

1. Extraia o ZIP em uma pasta.
2. Copie `.env.example` e renomeie a cópia para `.env`.
3. Abra o arquivo `.env` e preencha a senha real da SPLTV.
4. Dê dois cliques em:

```txt
instalar_dependencias_windows.bat
```

5. Para atualizar uma vez, execute:

```txt
atualizar_status_uma_vez_windows.bat
```

6. Para deixar atualizando a cada 30 minutos, execute:

```txt
iniciar_motor_status_windows.bat
```

7. Para abrir o site localmente com servidor e já iniciar o motor, execute:

```txt
abrir_site_local_windows.bat
```

---

## Como adicionar mais contratos

Edite `iniciar_motor_status_windows.bat` e altere esta linha:

```bat
python scripts\motor_status_local.py --contratos Amparo --intervalo 30
```

Para, por exemplo:

```bat
python scripts\motor_status_local.py --contratos Amparo,Arujá,Vinhedo --intervalo 30
```

Os links das centrais ficam em:

```txt
config/centrais_spltv.json
```

---

## Servidor dedicado Linux

Instale as dependências:

```bash
bash instalar_dependencias_linux.sh
```

Execute em loop:

```bash
bash iniciar_motor_status_linux.sh
```

Ou use cron para rodar a cada 30 minutos:

```bash
*/30 * * * * cd /caminho/do/site && /usr/bin/python3 scripts/motor_status_local.py --contratos Amparo --uma-vez >> logs/cron_status.log 2>&1
```

---

## Observações importantes

- O HTML sozinho não consegue baixar relatório da SPLTV por segurança do navegador.
- Quem faz o trabalho é o Python rodando na máquina/servidor.
- A aba Status apenas lê os arquivos gerados pelo motor.
- O relatório antigo é sempre sobrescrito para economizar armazenamento.
