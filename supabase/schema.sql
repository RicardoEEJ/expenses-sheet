-- Expenses sheet: one row per user holding their whole sheet as JSON.
-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run.

create table if not exists public.sheets (
  user_id    uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

-- Row Level Security: each signed-in user can only see and change their own row.
alter table public.sheets enable row level security;

drop policy if exists "read own sheet"   on public.sheets;
drop policy if exists "insert own sheet" on public.sheets;
drop policy if exists "update own sheet" on public.sheets;
drop policy if exists "delete own sheet" on public.sheets;

create policy "read own sheet" on public.sheets
  for select to authenticated using ((select auth.uid()) = user_id);

create policy "insert own sheet" on public.sheets
  for insert to authenticated with check ((select auth.uid()) = user_id);

create policy "update own sheet" on public.sheets
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "delete own sheet" on public.sheets
  for delete to authenticated using ((select auth.uid()) = user_id);

-- Signed-out visitors get no access at all.
revoke all on public.sheets from anon;
grant select, insert, update, delete on public.sheets to authenticated;
