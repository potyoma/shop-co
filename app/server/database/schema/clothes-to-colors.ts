import { integer, pgTable, primaryKey } from 'drizzle-orm/pg-core'
import { clothes } from './clothes'
import { color } from './color'

export const clothesToColor = pgTable(
  'clothes_to_color',
  {
    clothesId: integer('clothes_id')
      .notNull()
      .references(() => clothes.id),
    colorId: integer('color_id')
      .notNull()
      .references(() => color.id),
  },
  (t) => ({ pk: primaryKey({ columns: [t.clothesId, t.colorId] }) }),
)
