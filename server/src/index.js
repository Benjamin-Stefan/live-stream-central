const express = require("express");
const path = require("path");
const WebSocket = require("ws");
const config = require("./config/config");
const apiRoutes = require("./routes/apiRoutes");
const { logRequest } = require("./utils/logger");

const app = express();
const port = config.port || 8080;

// Logging Middleware
app.use(logRequest);

// Statische Dateien (Overlay) ausliefern
app.use(express.static(path.join(__dirname, "../../overlay/public")));

// API-Routen
app.use("/api", apiRoutes);

// WebSocket-Server
const server = app.listen(port, () => {
  console.log(`Server läuft auf Port ${port}`);
});

const wss = new WebSocket.Server({ server });

wss.on("connection", (ws) => {
  console.log("WebSocket connection established");
  ws.on("message", (message) => {
    console.log("Received:", message);
  });

  setInterval(() => {
    const sampleData = { message: "Live-Daten für Overlay" };
    ws.send(JSON.stringify(sampleData));
  }, 5000);
});
