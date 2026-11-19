// Supabase connection for the expenses sheet.
// Find both values in Supabase: Project Settings -> API (or "Connect" button).
// The anon / publishable key is meant to be public: Row Level Security in
// supabase/schema.sql is what keeps each person's data private.
// Never put the service_role / secret key here.
window.EXPENSES_CONFIG = {
  url: "https://YOUR_PROJECT_REF.supabase.co",
  anonKey: "YOUR_ANON_KEY",
};
