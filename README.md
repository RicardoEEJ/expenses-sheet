# Monthly Expenses

A phone-first expenses sheet (`index.html`). Accounts and data are stored in
[Supabase](https://supabase.com): each user signs in with email + password and
gets their own private sheet.

## Setup

1. **Create a Supabase project** at https://supabase.com/dashboard (the free tier is fine).
2. **Create the table:** open *SQL Editor → New query*, paste
   [supabase/schema.sql](supabase/schema.sql) and click *Run*.
3. **Connect the app:** open *Project Settings → API* and copy the
   *Project URL* and the *anon / publishable* key into [config.js](config.js).
   (Never use the `service_role` / secret key in this file.)
4. **Set the redirect URL:** in *Authentication → URL Configuration*, set
   *Site URL* to where the app runs, e.g. `http://localhost:8000`. Sign-up
   confirmation and password-reset emails link back there.

## Run locally

```sh
python -m http.server 8000
```

Then open http://localhost:8000. Serve it over http rather than opening the
file directly, so the email links can return to the app.

## Importing existing data

Your earlier figures are in `my-data.json` (git-ignored, so they're never
committed). After you sign in for the first time, choose that file in the
Welcome dialog, or later under *Account → Import a saved sheet*. *Account →
Download a backup* exports your sheet in the same format.

## Notes

- Changes save automatically about a second after each edit. The status next
  to *Account* shows *Saving…*, *Saved*, or a retry message.
- If two devices edit at the same time, the last save wins.
- By default Supabase asks new users to confirm their email address. You can
  turn that off under *Authentication → Providers → Email*.
