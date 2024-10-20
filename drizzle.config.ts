import { defineConfig } from 'drizzle-kit'

export default defineConfig({
  dialect: 'postgresql',
  schema: './app/server/database/schema',
  dbCredentials: {
    url: process.env.POSTGRES_URL!,
  },
})
