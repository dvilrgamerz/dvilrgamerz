# VaultBudget

This folder contains a safe source-package handoff for the VaultBudget React/Vite finance app.

## What is included

- `source/vaultbudget-source.zip.b64.part01` through `part04`: base64 chunks of the source zip.
- `scripts/restore-vaultbudget-source.ps1`: PowerShell script that rebuilds `vaultbudget-source.zip` from the chunks.
- `.env.local` is intentionally excluded. Use the app's `.env.example` after restoring the source.

## Restore locally

From this repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\vaultbudget\scripts\restore-vaultbudget-source.ps1
Expand-Archive -Path .\vaultbudget\vaultbudget-source.zip -DestinationPath .\vaultbudget\source-restored -Force
cd .\vaultbudget\source-restored
npm install
npm run verify:release
npm run dev
```

## Current app status

- Built with React, Vite, Tailwind-style CSS, Recharts, Lucide icons, localStorage persistence, and Supabase auth/cloud-save support.
- Supabase is configured for manual sync by default to stay within free-tier usage.
- Netlify is the selected deployment target.
