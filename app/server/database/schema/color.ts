import { integer, pgTable, text } from 'drizzle-orm/pg-core'

export const color = pgTable('color', {
  id: integer().primaryKey(),
  name: text().notNull(),
  hex: text().notNull(),
})
