import { integer, pgTable, text } from 'drizzle-orm/pg-core'

export const style = pgTable('style', {
  id: integer().primaryKey(),
  name: text().notNull(),
})
