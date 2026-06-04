# VaultBudget

This folder is a GitHub handoff stub for the VaultBudget React/Vite finance app.

## Current status

The production source currently lives on the local machine at:

`C:\Users\dhyey\OneDrive\Documents\save`

The clean publish packages are available locally at:

- `C:\Users\dhyey\OneDrive\Documents\save\publish\vaultbudget-source.zip`
- `C:\Users\dhyey\OneDrive\Documents\save\publish\vaultbudget-netlify-dist.zip`

`.env.local` is intentionally excluded from the source package. Use `.env.example` and add only public `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` values.

## What is built

- React + Vite app with six tabs: Home, Transactions, Goals, Reports, Profile, Settings.
- Premium dark fintech UI, updated with the Lovable/Base44-inspired Home dashboard direction.
- Local-first storage using `localStorage`.
- Optional Supabase email auth and manual-first cloud backup.
- Supabase RLS schema with manual sync default to protect free-tier usage.
- CSV export, KPI CSV export, text report export, and JSON backup.
- Netlify config and security headers.

## Verified locally

`npm run verify:release` passes the release gate:

- smoke checks
- Supabase schema checks
- production build
- publish checks
- Netlify config checks
- GitHub workflow checks
- security checks

## Publish blocker

The connected GitHub app currently has access only to `dvilrgamerz/dvilrgamerz`. It does not expose a tool here to create a new `dvilrgamerz/vaultbudget` repository, and local `git` / `gh` are not installed on the machine.

To finish a real app repo upload, create or authorize a `dvilrgamerz/vaultbudget` repository, then upload `vaultbudget-source.zip` or push from the local workspace after installing Git.

## Netlify blocker

Netlify deploy is selected, but the CLI authorization ticket has not completed in this session. You can still deploy manually by uploading `vaultbudget-netlify-dist.zip` in the Netlify dashboard.
