/*
  # Add INSERT policy for anonymous users on contacts table

  1. Security Changes
    - Add policy to allow anonymous users to insert contact form submissions
    - This enables public contact form functionality while maintaining data security

  2. Policy Details
    - Allows INSERT operations for anonymous (unauthenticated) users
    - Only applies to INSERT operations, maintaining existing read/update/delete restrictions
*/

-- Add policy to allow anonymous users to submit contact forms
CREATE POLICY "Allow anonymous users to insert contacts"
  ON contacts
  FOR INSERT
  TO anon
  WITH CHECK (true);