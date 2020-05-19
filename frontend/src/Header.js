import React from 'react'
import { useStore } from './hooks'
import authService from './services/auth'

const authbutton = {
  padding:'6px 8px',
  margin:'2px',
}

const Header = ({ register, login }) => {
  const user = useStore(authService)

  const logout = e => {
    authService.logout()
  }

  return (
    <header className="main">
      <div className="brand">Covid-19 Tracker</div>
      <nav>
        { authService.isAuthenticated()
          ? <a href="#" onClick={logout}>Logout</a>
          : (
              <div>
                <button style={authbutton} href="#" onClick={login}>Sign in</button>
                <button style={authbutton} href="#" onClick={register}>Sign up</button>
              </div>
            )
        }
      </nav>
    </header>
  )
}

export default Header
