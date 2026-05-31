// status-online.js
// Carrega status_equipamentos.json e aplica classes simples por data-serie, se existirem elementos na página.
(async function(){
  try {
    const resp = await fetch('status_equipamentos.json', {cache:'no-store'});
    if(!resp.ok) return;
    const data = await resp.json();
    const itens = data.equipamentos || [];
    itens.forEach(item => {
      const serie = item.serie;
      if(!serie) return;
      document.querySelectorAll(`[data-serie="${serie}"]`).forEach(el => {
        el.dataset.onlineStatus = item.status;
        el.classList.add(`status-${item.status}`);
        el.title = `Status: ${item.status} | Atualizado: ${item.ultima_atualizacao || data.gerado_em || ''}`;
      });
    });
  } catch(e) {
    console.warn('Não foi possível carregar status_equipamentos.json', e);
  }
})();
