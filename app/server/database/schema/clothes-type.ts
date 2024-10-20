import { integer, pgTable, text } from 'drizzle-orm/pg-core'

export const clothesType = pgTable('clothes_type', {
  id: integer().primaryKey(),
  name: text().notNull(),
})
