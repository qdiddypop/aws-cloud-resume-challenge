const counter = document.querySelector(".counter-number");

async function updateCounter() {
    let response = await fetch(
        "https://wwjcx7tyxrbjmbkf3vc3teo3mu0qrvhq.lambda-url.ca-central-1.on.aws/"
    );
    let data = await response.json();

    counter.textContent = data; // Update the counter number
}

updateCounter();
