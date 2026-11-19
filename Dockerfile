
FROM mcr.microsoft.com/playwright:v1.58.0-noble

WORKDIR /app

# Install n8n globally
RUN npm install -g n8n

# Enable pnpm
RUN corepack enable

# Copy package files and scripts
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy source code
COPY . .

# Copy entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
