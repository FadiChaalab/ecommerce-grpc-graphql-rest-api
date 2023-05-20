--
-- Class Order as table orders
--

CREATE TABLE "orders" (
  "id" serial,
  "customer_id" integer NOT NULL,
  "product_id" integer NOT NULL,
  "quantity" integer NOT NULL,
  "total_amount" double precision NOT NULL
);

ALTER TABLE ONLY "orders"
  ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Class Product as table products
--

CREATE TABLE "products" (
  "id" serial,
  "name" text NOT NULL,
  "description" text NOT NULL,
  "price" double precision NOT NULL,
  "image" text NOT NULL
);

ALTER TABLE ONLY "products"
  ADD CONSTRAINT products_pkey PRIMARY KEY (id);


