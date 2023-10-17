const counter = document.querySelector(".website-counter");

async function updateCounter() {
    try {
        let response = await fetch(
            "https://tacmarpubmxzo2zv7pizxowojq0ksiyb.lambda-url.us-east-1.on.aws/");
        let data = await response.json();

        // Assuming the response from your Lambda function contains a "count" property
        if (data && data.count) {
            counter.textContent = data.count;
        }
    } catch (error) {
        console.error("Error updating counter:", error);
    }
}

updateCounter();
