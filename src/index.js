const express = require("express");
const fetch = require("isomorphic-fetch");
const app = express();
const port = process.env.PORT || 3000;

async function fetchPic() {
  const response = await fetch(
    `https://api.nasa.gov/planetary/apod?api_key=${process.env.NASA_API_KEY}`
  );
  return response.json();
}

function buildHTML(picData) {
  return `
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>${picData.title}</title>
        </head>
        <body>
            <h1>${picData.title}</h1>
            <img src="${picData.url}" alt="${picData.explanation}">
            <p>${picData.explanation}</p>
        </body>
    </html>
  `;
}

app.get("/", async (req, res) => {
  const picData = await fetchPic();
  const html = buildHTML(picData);
  res.send(html);
});

app.listen(port, () => {
  console.log(`Listening on http://localhost:${port}`);
});
