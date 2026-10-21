-- ============================================================
-- Smart Product Price Tracker - Supabase Database Schema
-- Run this in your Supabase project's SQL Editor:
-- https://supabase.com/dashboard/project/_/sql/new
-- ============================================================

-- 1. Enable uuid-ossp extension (if not already enabled)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. Create products table
CREATE TABLE IF NOT EXISTS public.products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    url TEXT NOT NULL,
    name TEXT NOT NULL,
    current_price NUMERIC(12, 2) NOT NULL,
    currency VARCHAR(10) DEFAULT 'USD',
    image_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT unique_user_product_url UNIQUE (user_id, url)
);

-- 3. Create price_history table
CREATE TABLE IF NOT EXISTS public.price_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID NOT NULL REFERENCES public.products(id) ON DELETE CASCADE,
    price NUMERIC(12, 2) NOT NULL,
    currency VARCHAR(10) DEFAULT 'USD',
    checked_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Create performance indexes
CREATE INDEX IF NOT EXISTS idx_products_user_id ON public.products(user_id);
CREATE INDEX IF NOT EXISTS idx_price_history_product_id ON public.price_history(product_id);
CREATE INDEX IF NOT EXISTS idx_price_history_checked_at ON public.price_history(checked_at);

-- 5. Enable Row Level Security (RLS)
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.price_history ENABLE ROW LEVEL SECURITY;

-- 6. Products RLS Policies
DROP POLICY IF EXISTS "Users can view their own products" ON public.products;
CREATE POLICY "Users can view their own products"
    ON public.products FOR SELECT
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can insert their own products" ON public.products;
CREATE POLICY "Users can insert their own products"
    ON public.products FOR INSERT
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update their own products" ON public.products;
CREATE POLICY "Users can update their own products"
    ON public.products FOR UPDATE
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete their own products" ON public.products;
CREATE POLICY "Users can delete their own products"
    ON public.products FOR DELETE
    USING (auth.uid() = user_id);

-- 7. Price History RLS Policies
DROP POLICY IF EXISTS "Users can view history of their products" ON public.price_history;
CREATE POLICY "Users can view history of their products"
    ON public.price_history FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.products
            WHERE products.id = price_history.product_id
            AND products.user_id = auth.uid()
        )
    );

DROP POLICY IF EXISTS "Users can insert history for their products" ON public.price_history;
CREATE POLICY "Users can insert history for their products"
    ON public.price_history FOR INSERT
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM public.products
            WHERE products.id = price_history.product_id
            AND products.user_id = auth.uid()
        )
    );
