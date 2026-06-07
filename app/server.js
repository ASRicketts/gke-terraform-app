const express = require("express");

const app = express();
const PORT = process.env.PORT || 8080;

// Root route — proves the app is alive and serving traffic.
app.get("/", (req, res) => {
  res.send("Hello from GKE — deployed via Terraform.\n");
});

// Health check — Kubernetes probes hit this to decide when to send traffic to the pod and when to restart a sick container.
app.get("/healthz", (req, res) => {
  res.status(200).json({ status: "ok" });
});

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
