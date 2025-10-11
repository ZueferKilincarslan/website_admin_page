# ZK.AI Admin Panel

Internal administration dashboard for ZK.AI platform management.

## Overview

This repository contains the admin panel for ZK.AI, providing internal tools for:
- User authentication and access control
- Dashboard analytics and monitoring
- Demo management (Demo 1 & Demo 2)
- Client contact form management
- Internal settings and configuration

## Tech Stack

- React 18 with TypeScript
- Vite for build tooling
- React Router for navigation
- Supabase for backend (authentication & database)
- Tailwind CSS for styling
- Chart.js for analytics visualization

## Project Structure

```
src/
├── pages/admin/          # Admin pages
│   ├── Login.tsx         # Authentication page
│   ├── Dashboard.tsx     # Main admin dashboard
│   ├── Demo1.tsx         # Demo 1 management
│   ├── Demo2.tsx         # Demo 2 management
│   └── Kontaktformular.tsx # Contact form management
├── components/           # Reusable components
│   └── ProtectedRoute.tsx # Route protection wrapper
├── contexts/            # React contexts
│   └── AuthContext.tsx  # Authentication state management
└── services/            # Backend services
    └── supabase.ts      # Supabase client configuration
```

## Getting Started

1. Install dependencies:
```bash
npm install
```

2. Set up environment variables:
Create a `.env` file with your Supabase credentials:
```
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

3. Run development server:
```bash
npm run dev
```

4. Build for production:
```bash
npm run build
```

## Authentication

The admin panel uses Supabase authentication with email/password login. All routes except `/admin` (login page) are protected and require authentication.

## Available Routes

- `/admin` - Login page
- `/admin/dashboard` - Main admin dashboard
- `/admin/demo/1` - Demo 1 management
- `/admin/demo/2` - Demo 2 management
- `/admin/kontaktformular` - Contact form management

## Security

- All admin routes are protected with authentication
- Row Level Security (RLS) enabled on Supabase
- Environment variables for sensitive configuration
- Automatic redirect to login for unauthenticated users