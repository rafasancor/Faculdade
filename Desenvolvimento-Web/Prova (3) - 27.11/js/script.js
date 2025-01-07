const themeToggle = document.getElementById('theme-toggle');
const body = document.body;

// Verificar o tema salvo no localStorage
const savedTheme = localStorage.getItem('theme');
if (savedTheme === 'dark') {
    body.classList.add('dark-mode');
    themeToggle.textContent = '☀️';
}

themeToggle.addEventListener('click', () => {
    body.classList.toggle('dark-mode');

    if (body.classList.contains('dark-mode')) {
        themeToggle.textContent = '☀️';
        localStorage.setItem('theme', 'dark');
    } else {
        themeToggle.textContent = '🌙';
        localStorage.setItem('theme', 'light');
    }
});

document.querySelector('.form').addEventListener('submit', function (event) {
    // Impede o envio do formulário e o recarregamento da página
    event.preventDefault();

    const nome = document.getElementById('nome').value;
    const email = document.getElementById('email').value;
    const telefone = document.getElementById('telefone').value;

    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    let sexo = [];
    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
            sexo.push(checkbox.parentElement.textContent.trim());
        }
    });

    const estado = document.querySelector('select[name="estado"]').value;

    alert(
        `Dados preenchidos:\n\n` +
        `Nome: ${nome}\n` +
        `E-mail: ${email}\n` +
        `Telefone: ${telefone}\n` +
        `Sexo: ${sexo.length > 0 ? sexo.join(', ') : 'Nenhum selecionado'}\n` +
        `Estado: ${estado}`
    );
});

