# VaultBudget Offline Shell Handoff - 2026-06-04

Local source root:

`C:\Users\dhyey\OneDrive\Documents\save`

This pass added frontend-only offline app-shell support.

## Added to the app

- `public/sw.js` service worker for same-origin app-shell caching.
- `src/lib/offline.js` service worker registration helper.
- Registration only runs on `http` or `https`, not direct `file://` preview.
- Settings > Launch Readiness now includes Offline app shell.
- Netlify headers set `/sw.js` to `Cache-Control: no-cache`.

## Supabase usage

No Supabase calls, tables, rows, Edge Functions, realtime subscriptions, or analytics writes were added. The service worker only handles same-origin app-shell requests and does not cache Supabase API responses.

## Verification

- `npm run verify:release` passes.
- `npm run verify:publish` passes with 66 checks.
- `dist/sw.js` is generated.
- Source package excludes `.env.local`, `node_modules`, `dist`, `publish`, and `.runtime`.

Current packages to publish manually:

- `publish\vaultbudget-source.zip`
- `publish\vaultbudget-netlify-dist.zip`

Remaining external blockers are unchanged: create/authorize a real `dvilrgamerz/vaultbudget` repo, complete Netlify deploy auth or manual upload, enable Supabase leaked-password protection, and complete one confirmed-user Save/Check test.
