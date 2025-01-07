document.getElementById("formulario").addEventListener("submit", function(event) {
    event.preventDefault();

    const email = document.getElementById("email").value;
    const sugestao = document.getElementById("sugestao").value;

    alert(`Email: ${email}\nSugestão: ${sugestao}`);
    console.log(`Email: ${email}`);
    console.log(`Sugestão: ${sugestao}`);

    document.getElementById("resultado").innerText = `Email: ${email} | Sugestão: ${sugestao}`;
});

function verificarNumero() {

    let numero = prompt("Digite um número inteiro:");

    if (numero !== null && !isNaN(numero) && Number.isInteger(Number(numero))) {
        numero = Number(numero);
        
        let parOuImpar = (numero % 2 === 0) ? "par" : "ímpar";
        
        let divisivelPorTres = (numero % 3 === 0) ? "é divisível por 3" : "não é divisível por 3";

        alert(`O número ${numero} é ${parOuImpar} e ${divisivelPorTres}.`);
    } else {
        alert("Por favor, insira um número inteiro válido.");
    }
}



