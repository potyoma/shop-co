CREATE TABLE IF NOT EXISTS "clothes_to_clothes_types" (
	"clothes_id" integer NOT NULL,
	"clothes_type_id" integer NOT NULL,
	CONSTRAINT "clothes_to_clothes_types_clothes_id_clothes_type_id_pk" PRIMARY KEY("clothes_id","clothes_type_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "clothes_to_color" (
	"clothes_id" integer NOT NULL,
	"style_id" integer NOT NULL,
	CONSTRAINT "clothes_to_color_clothes_id_style_id_pk" PRIMARY KEY("clothes_id","style_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "clothes_type" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "clothes" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"price_cents" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "color" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"hex" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discount" (
	"id" integer PRIMARY KEY NOT NULL,
	"value" integer NOT NULL,
	"type" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "review" (
	"id" integer PRIMARY KEY NOT NULL,
	"author" text NOT NULL,
	"text" text,
	"value" numeric NOT NULL,
	"clothes_id" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "size" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "style" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" text NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "clothes_to_clothes_types" ADD CONSTRAINT "clothes_to_clothes_types_clothes_id_clothes_id_fk" FOREIGN KEY ("clothes_id") REFERENCES "public"."clothes"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "clothes_to_clothes_types" ADD CONSTRAINT "clothes_to_clothes_types_clothes_type_id_clothes_type_id_fk" FOREIGN KEY ("clothes_type_id") REFERENCES "public"."clothes_type"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "clothes_to_color" ADD CONSTRAINT "clothes_to_color_clothes_id_clothes_id_fk" FOREIGN KEY ("clothes_id") REFERENCES "public"."clothes"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "clothes_to_color" ADD CONSTRAINT "clothes_to_color_style_id_style_id_fk" FOREIGN KEY ("style_id") REFERENCES "public"."style"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "review" ADD CONSTRAINT "review_clothes_id_clothes_id_fk" FOREIGN KEY ("clothes_id") REFERENCES "public"."clothes"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
