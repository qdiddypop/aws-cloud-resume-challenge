const counter = document.querySelector(".website-counter");

async function updateCounter() {
    try {
        let response = await fetch(
            "https://cqczz25ken7e5oir43bacfvdwy0cgide.lambda-url.us-east-1.amazonaws.com/");
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
