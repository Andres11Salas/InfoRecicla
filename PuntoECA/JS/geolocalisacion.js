document.addEventListener('DOMContentLoaded', () => {
  const btn = document.getElementById('btnUbicacion');
  const input = document.getElementById('latlong');

  btn.addEventListener('click', () => {
    if (!navigator.geolocation) {
      alert('Tu navegador no soporta geolocalización');
      return;
    }
    navigator.geolocation.getCurrentPosition(
      (pos) => {
        const lat = pos.coords.latitude.toFixed(6);
        const lon = pos.coords.longitude.toFixed(6);
        input.value = `${lat}, ${lon}`;
      },
      (err) => {
        switch(err.code) {
          case err.PERMISSION_DENIED:
            alert('Permiso de ubicación denegado');
            break;
          case err.POSITION_UNAVAILABLE:
            alert('Posición no disponible');
            break;
          case err.TIMEOUT:
            alert('Tiempo de espera agotado');
            break;
          default:
            alert('Error al obtener la ubicación');
        }
      },
      { enableHighAccuracy: true, timeout: 5000 }
    );
  });
});
