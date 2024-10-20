import { relations } from 'drizzle-orm'
import { pgTable, integer, text } from 'drizzle-orm/pg-core'
import { clothesToColor } from './clothes-to-colors'
import { clothesToClothesTypes } from './clothes-to-clothes-type'
import { clothesToStyle } from './clothes-to-style'
import { review } from './review'

export const clothes = pgTable('clothes', {
  id: integer().primaryKey(),
  name: text().notNull(),
  priceCents: integer('price_cents').notNull(),
})

export const clothesRelations = relations(clothes, ({ many, one }) => ({
  clothesToColors: many(clothesToColor),
  clothesToClothesTypes: many(clothesToClothesTypes),
  clothesToStyle: many(clothesToStyle),
  clothesReviews: one(review),
}))
