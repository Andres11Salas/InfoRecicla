    document.querySelectorAll('.thread').forEach(elem => {
      elem.addEventListener('click', () => {
        document.querySelectorAll('.thread').forEach(t => t.classList.remove('active'));
        elem.classList.add('active');
        const id = elem.dataset.thread;
        const chat = document.getElementById('chatWindow');
        chat.innerHTML = '';
        let msgs = [];
        if (id === '1') msgs = [
          { from: 'user', text: '¿Puedo llevar 5kg de papel?', time: '2025-06-10 09:00' },
          { from: 'eca', text: 'Estamos en la Calle 5 #123. Abierto de 8:00 a 17:00.', time: '2025-06-10 09:05' }
        ];
        else if (id === '2') msgs = [
          { from: 'user', text: '¿Aceptan plástico hoy?', time: '2025-06-11 10:15' },
          { from: 'eca', text: 'Sí, aceptamos plástico hasta las 16:00.', time: '2025-06-11 10:20' }
        ];
        else if (id === '3') msgs = [
          { from: 'user', text: '¿Cuál es el horario de atención?', time: '2025-06-12 08:00' },
          { from: 'eca', text: 'Lunes a sábado de 8:00 a 17:00.', time: '2025-06-12 08:05' }
        ];
        msgs.forEach(m => {
          const div = document.createElement('div');
          div.classList.add('message', m.from === 'eca' ? 'message--eca' : 'message--user');
          div.innerHTML = `<div>${m.text}</div><div class="timestamp">${m.time}</div>`;
          document.getElementById('chatWindow').appendChild(div);
        });
      });
    });