-- Priced options per equipment (e.g. Split AC -> Gas refill 80,000), usable as quotation lines. Safe to run again.
CREATE TABLE IF NOT EXISTS equipment_option (
  id SERIAL PRIMARY KEY, equipment_id INT NOT NULL, name VARCHAR(150) NOT NULL, amount NUMERIC(12,2) NOT NULL DEFAULT 0,
  priority INT DEFAULT 1, status_id INT DEFAULT 1, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS equipment_option_equipment_idx ON equipment_option (equipment_id);

-- Home-request quotation lines can now be an equipment option instead of a price-list item.
-- `description` keeps the line name as quoted, so the apps can show it.
ALTER TABLE quotation_item ADD COLUMN IF NOT EXISTS equipment_option_id INT NULL;
ALTER TABLE quotation_item ADD COLUMN IF NOT EXISTS description VARCHAR(255) NULL;
-- Equipment lines have no price-list item (the MySQL import made price_id required)
ALTER TABLE quotation_item ALTER COLUMN price_id DROP NOT NULL;

-- Itemized quote for walk-in tickets (price-list items and equipment options)
CREATE TABLE IF NOT EXISTS walkin_quote_item (
  id SERIAL PRIMARY KEY, ticket_id INT NOT NULL, price_id INT NULL, equipment_option_id INT NULL,
  description VARCHAR(255) NOT NULL, quantity INT NOT NULL DEFAULT 1, unit_price NUMERIC(12,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS walkin_quote_item_ticket_idx ON walkin_quote_item (ticket_id);
