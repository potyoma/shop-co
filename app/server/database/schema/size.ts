import { pgTable, text, integer } from 'drizzle-orm/pg-core'

export const size = pgTable('size', {
  id: integer().primaryKey(),
  name: text().notNull(),
})
