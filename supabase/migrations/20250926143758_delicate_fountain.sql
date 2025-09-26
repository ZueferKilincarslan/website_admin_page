/*
  # Fix RLS policies for contacts table

  1. Security Changes
    - Drop existing conflicting policies
    - Create new policy allowing anonymous users to insert contacts
    - Ensure authenticated users can manage contacts

  This migration fixes the RLS policy issue preventing anonymous users from submitting contact forms.
*/

-- Drop existing policies that might be conflicting
DROP POLICY IF EXISTS "Allow access for authenticated users" ON contacts;
DROP POLICY IF EXISTS "Allow anonymous users to insert contacts" ON contacts;
DROP POLICY IF EXISTS "Allow authenticated users to create contacts" ON contacts;
DROP POLICY IF EXISTS "Allow authenticated users to delete contacts" ON contacts;
DROP POLICY IF EXISTS "Allow authenticated users to read contacts" ON contacts;
DROP POLICY IF EXISTS "Allow authenticated users to update contacts" ON contacts;

-- Create new policies with clear permissions
CREATE POLICY "Enable insert for anonymous users" ON contacts
  FOR INSERT TO anon
  WITH CHECK (true);

CREATE POLICY "Enable select for authenticated users" ON contacts
  FOR SELECT TO authenticated
  USING (true);

CREATE POLICY "Enable update for authenticated users" ON contacts
  FOR UPDATE TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Enable delete for authenticated users" ON contacts
  FOR DELETE TO authenticated
  USING (true);