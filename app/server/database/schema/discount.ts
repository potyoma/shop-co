import { integer, pgTable, text } from 'drizzle-orm/pg-core'

export const discount = pgTable('discount', {
  id: integer().primaryKey(),
  value: integer().notNull(),
  type: text({ enum: ['percent', 'fixed'] }).notNull(),
})
