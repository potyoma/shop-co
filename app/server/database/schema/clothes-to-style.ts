import { integer, pgTable, primaryKey } from 'drizzle-orm/pg-core'
import { clothes } from './clothes'
import { style } from './style'

export const clothesToStyle = pgTable(
  'clothes_to_color',
  {
    clothesId: integer('clothes_id')
      .notNull()
      .references(() => clothes.id),
    styleId: integer('style_id')
      .notNull()
      .references(() => style.id),
  },
  (t) => ({ pk: primaryKey({ columns: [t.clothesId, t.styleId] }) }),
)
