const counter = document.querySelector(".counter-number");

async function updateCounter() {
    // Initialize the counter to 0 before fetching the visitor count
    counter.textContent = '0';

    let response = await fetch(
        "https://245zmq3phuc5mk2izugnenqmma0vyqes.lambda-url.us-east-1.on.aws/"
    );
    let data = await response.json();

    counter.textContent = data; // Update the counter number
}

updateCounter();
