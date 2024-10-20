import { integer, pgTable, primaryKey } from 'drizzle-orm/pg-core'
import { clothes } from './clothes'
import { clothesType } from './clothes-type'

export const clothesToClothesTypes = pgTable(
  'clothes_to_clothes_types',
  {
    clothesId: integer('clothes_id')
      .notNull()
      .references(() => clothes.id),
    clothesTypeId: integer('clothes_type_id')
      .notNull()
      .references(() => clothesType.id),
  },
  (t) => ({ pk: primaryKey({ columns: [t.clothesId, t.clothesTypeId] }) }),
)
