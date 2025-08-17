    document.addEventListener('DOMContentLoaded', () => {
      const dt = $('#tablaMateriales').DataTable({ responsive: true, paging: false, info: false });
      const form = document.getElementById('formMaterial');
      const toast = new bootstrap.Toast(document.getElementById('toastNotificacion'));

      form.addEventListener('submit', (e) => {
        e.preventDefault();
        if (!form.checkValidity()) {
          form.classList.add('was-validated');
          return;
        }
        const nombre = document.getElementById('matNombre').value.trim();
        const stock  = parseFloat(document.getElementById('matStock').value);
        const capMax = parseFloat(document.getElementById('matCapMax').value);
        const precio = parseFloat(document.getElementById('matPrecio').value);
        const pct = Math.round((stock / capMax) * 100);
        const progreso = `<div class="progress"><div class="progress-bar" role="progressbar" style="width:${pct}%;" aria-valuenow="${pct}" aria-valuemin="0" aria-valuemax="100">${pct}%</div></div>`;
        dt.row.add([nombre, stock, progreso, capMax, precio]).draw();
        form.reset();
        form.classList.remove('was-validated');
        toast.show();
      });
    });