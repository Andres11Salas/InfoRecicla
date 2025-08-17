$(document).ready(() => {
      const dt = $('#tablaHistorial').DataTable({
        responsive: true,
        paging: false,
        info: false,
        language: {
          search: "Buscar:",
          zeroRecords: "No se encontraron registros",
          paginate: { next: "Siguiente", previous: "Anterior" }
        }
      });
      $('#btnPDF').on('click', async () => {
        const { jsPDF } = window.jspdf;
        const cont = document.querySelector('.table-responsive');
        const canvas = await html2canvas(cont, { scale: 2 });
        const img = canvas.toDataURL('image/png');
        const pdf = new jsPDF({ orientation: 'landscape' });
        const w = pdf.internal.pageSize.getWidth();
        const h = pdf.internal.pageSize.getHeight();
        pdf.addImage(img, 'PNG', 0, 0, w, h);
        pdf.save('historial_inventario.pdf');
      });
      const raw = dt.rows().data().toArray();
      const series = raw.reduce((acc, [ , , op, , , , fecha ]) => {
        const day = fecha.split(' ')[0];
        acc[day] = acc[day] || { IN: 0, OUT: 0 };
        acc[day][op]++;
        return acc;
      }, {});
      const labels = Object.keys(series);
      const ins = labels.map(d => series[d].IN);
      const outs = labels.map(d => series[d].OUT);
      new Chart(document.getElementById('graficoHistorial'), {
        type: 'bar',
        data: { labels, datasets: [ { label: 'Entradas', data: ins }, { label: 'Salidas', data: outs } ] },
        options: { responsive: true, scales: { y: { beginAtZero: true } } }
      });
    });