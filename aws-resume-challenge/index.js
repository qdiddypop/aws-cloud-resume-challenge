var counterContainer = document.querySelector(".website-counter");

// Function to fetch the visitor count from the Lambda URL
function fetchVisitorCount() {
  fetch("https://tacmarpubmxzo2zv7pizxowojq0ksiyb.lambda-url.us-east-1.on.aws/")
    .then(function(response) {
      return response.text();
    })
    .then(function(data) {
      counterContainer.innerHTML = data;
    })
    .catch(function(error) {
      console.error("Error fetching visitor count: " + error);
    });
}

// Fetch the visitor count when the page loads
fetchVisitorCount();