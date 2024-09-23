# Wähle ein Node.js-Image als Basis (hier Node.js 16 LTS)
FROM node:20

# Erstelle ein Verzeichnis im Container für die Anwendung
WORKDIR /usr/src/app

# Kopiere package.json und package-lock.json, um nur die Abhängigkeiten zu installieren
COPY package*.json ./

# Installiere die Abhängigkeiten (nur Production)
RUN npm install --production

# Kopiere den Rest des Server-Codes in den Container
COPY . .

# Exponiere den Port, den der Server verwendet
EXPOSE 8080

# Definiere den Befehl zum Starten des Servers
CMD ["npm", "start"]
