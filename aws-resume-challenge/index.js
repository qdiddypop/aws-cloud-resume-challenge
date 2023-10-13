const counter = document.querySelector(".website-counter");
async function updateCounter() {
    let response = await fetch(
        "https://tacmarpubmxzo2zv7pizxowojq0ksiyb.lambda-url.us-east-1.on.aws/");
    let data = await response.json();
    counter.innerHTML = `👀 Views: ${data}`;
}
updateCounter();