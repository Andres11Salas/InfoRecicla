$(document).ready(() => {
      const dt = $('#miTabla').DataTable({ responsive: true, paging: false, info: false });

      $('#formEntrada').on('submit', function(e) {
        e.preventDefault();
        this.classList.add('was-validated');
        if (!this.checkValidity()) return;
        const mat = $('#entMaterial').val();
        const stk = parseFloat($('#entStock').val());
        const cap = parseFloat($('#entCapMax').val());
        const prc = parseFloat($('#entPrecio').val());
        dt.row.add([mat, stk, cap, prc]).draw();
        this.reset(); this.classList.remove('was-validated');
      });

      $('#btnPDF').on('click', async () => {
        const { jsPDF } = window.jspdf;
        const div = document.getElementById('contenedorTabla');
        const canvas = await html2canvas(div, { scale: 2 });
        const img = canvas.toDataURL('image/png');
        const pdf = new jsPDF({ orientation: 'landscape' });
        const w = pdf.internal.pageSize.getWidth();
        const h = pdf.internal.pageSize.getHeight();
        pdf.addImage(img, 'PNG', 0, 0, w, h);
        pdf.save('inventario.pdf');
      });

      function actualizarGrafica() {
        const data = dt.rows({ search: 'applied' }).data().toArray();
        const labels = data.map(r => r[0]);
        const valores = data.map(r => parseFloat(r[1]));
        if (window.stockChart) window.stockChart.destroy();
        window.stockChart = new Chart(document.getElementById('graficoStock'), {
          type: 'bar', data: { labels, datasets: [{ label: 'Stock actual (kg)', data: valores }] },
          options: { responsive: true, scales: { y: { beginAtZero: true } } }
        });
      }
      dt.on('draw', actualizarGrafica);
      actualizarGrafica();
    });
  