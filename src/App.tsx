import React, { useEffect } from 'react';
import { Routes, Route, useNavigate, useLocation } from 'react-router-dom';
import { AuthProvider } from './contexts/AuthContext';
import { ProtectedRoute } from './components/ProtectedRoute';
import Login from './pages/admin/Login';
import Dashboard from './pages/admin/Dashboard';
import Demo1 from './pages/admin/Demo1';
import Demo2 from './pages/admin/Demo2';
import Kontaktformular from './pages/admin/Kontaktformular';

const App: React.FC = () => {
  const navigate = useNavigate();
  const location = useLocation();

  useEffect(() => {
    if (location.pathname === '/' || location.pathname === '/admin') {
      navigate('/admin', { replace: true });
    }
  }, [location, navigate]);

  return (
    <AuthProvider>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/admin" element={<Login />} />
        <Route
          path="/admin/dashboard"
          element={
            <ProtectedRoute>
              <Dashboard />
            </ProtectedRoute>
          }
        />
        <Route
          path="/admin/demo/1"
          element={
            <ProtectedRoute>
              <Demo1 />
            </ProtectedRoute>
          }
        />
        <Route
          path="/admin/demo/2"
          element={
            <ProtectedRoute>
              <Demo2 />
            </ProtectedRoute>
          }
        />
        <Route
          path="/admin/kontaktformular"
          element={
            <ProtectedRoute>
              <Kontaktformular />
            </ProtectedRoute>
          }
        />
        <Route path="*" element={<Login />} />
      </Routes>
    </AuthProvider>
  );
};

export default App;