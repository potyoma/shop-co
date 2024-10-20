import { integer, pgTable, text, decimal } from 'drizzle-orm/pg-core'
import { clothes } from './clothes'

export const review = pgTable('review', {
  id: integer().primaryKey(),
  author: text().notNull(),
  text: text(),
  value: decimal().notNull(),
  clothes_id: integer()
    .notNull()
    .references(() => clothes.id),
})
