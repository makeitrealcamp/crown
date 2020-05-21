import React from 'react'
import { useStore } from '../hooks/hooks'
import authService from '../services/auth'

const Header = ({ register, login }) => {
  useStore(authService)
  const logout = () => {
    authService.logout()
  }

  return (
    <header className="main">
      <div className="brand">Covid-19 Tracker</div>
      <nav>
        {authService.isAuthenticated()
          ? <button type="button" onClick={logout}>Logout</button>
          : (
            <div>
              <button type="button" onClick={login}>Sign in</button>
              <button type="button" onClick={register}>Sign up</button>
            </div>
          )}
      </nav>
    </header>
  )
}

export default Header
