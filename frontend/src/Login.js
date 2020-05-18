import React from 'react'
import { useState } from 'react'
import authService from './services/auth'

const Login = ({ close }) => {
  const [state, setState] = useState({ identifier: "", password: "" })

  const handleSubmit = async e => {
    e.preventDefault()

    await authService.login(state.identifier, state.password)
    close()
  }

  return  (
    <div className="form-page auth-page">
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="username">Username or Email:</label>
          <input type="text" id="username" className="form-control" value={state.identifier} onChange={e => setState({ ...state, identifier: e.target.value })} />
        </div>
        <div className="form-group">
          <label htmlFor="email">Password:</label>
          <input type="password" id="password" className="form-control" value={state.password} onChange={e => setState({ ...state, password: e.target.value })} />
        </div>

        <div className="actions">
          <button onClick={e => close("incident")}>Cerrar</button>
          <button type="submit">Login</button>
        </div>
      </form>
    </div>
  )
}

export default Login
