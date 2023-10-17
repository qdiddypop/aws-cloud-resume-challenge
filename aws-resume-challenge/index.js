const counter = document.querySelector(".counter-number");

async function updateCounter() {
    // Initialize the counter to 0 before fetching the visitor count
    counter.textContent = '0';

    let response = await fetch(
        "https://cqczz25ken7e5oir43bacfvdwy0cgide.lambda-url.us-east-1.on.aws/"
    );
    let data = await response.json();

    counter.textContent = data; // Update the counter number
}

updateCounter();
