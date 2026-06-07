# Current Node LTS (24). Alpine = a tiny base image, smaller attack surface.
FROM node:24-alpine

# All commands below run relative to /app inside the container.
WORKDIR /app

# Copy ONLY the manifests first. Docker caches each layer, so dependencies
# get reinstalled only when package files change — not on every code edit.
COPY package*.json ./

# npm ci installs the exact versions locked in package-lock.json (reproducible).
# --omit=dev skips devDependencies, which aren't needed at runtime.
RUN npm ci --omit=dev

# Copy the rest of the source.
COPY . .

# The official node image ships a non-root 'node' user. Running as non-root
# limits damage if the app is ever compromised.
USER node

# Documents which port the app listens on (matches PORT in server.js).
EXPOSE 8080

# The command that runs when the container starts.
CMD ["node", "server.js"]
