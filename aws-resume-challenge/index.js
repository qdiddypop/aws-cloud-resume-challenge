const counter = document.querySelector(".counter-number");

async function updateCounter() {
    let response = await fetch(
        "https://cqczz25ken7e5oir43bacfvdwy0cgide.lambda-url.us-east-1.on.aws/"
    );
    let data = await response.json();

    counter.textContent = data; // Update the counter number
}

updateCounter();
