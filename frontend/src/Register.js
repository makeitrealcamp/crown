import React from 'react'
import { useState } from 'react'
import authService from './services/auth'

const Register = ({ close }) => {
  const [state, setState] = useState({
    username: "",
    email: "",
    name: "",
    last_name: "",
    password: ""
  })

  const handleSubmit = async e => {
    e.preventDefault()

    await authService.signup(state)
    close()
  }

  return  (
    <div className="form-page auth-page">
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="username">Username:</label>
          <input type="text" id="username" className="form-control" value={state.username} onChange={e => setState({ ...state, username: e.target.value })} />
        </div>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input type="email" id="email" className="form-control" value={state.email} onChange={e => setState({ ...state, email: e.target.value })} />
        </div>
        <div className="form-group">
          <label htmlFor="first-name">Nombre: </label>
          <input type="text" id="first-name" className="form-control" onChange={e => setState({ ...state, name: e.target.value  })} />
        </div>
        <div className="form-group">
          <label htmlFor="last-name">Apellido: </label>
          <input type="text" id="last-name" className="form-control" onChange={e => setState({ ...state, last_name: e.target.value  })} />
        </div>
        <div className="form-group">
          <label htmlFor="email">Password:</label>
          <input type="password" id="password" className="form-control" value={state.password} onChange={e => setState({ ...state, password: e.target.value })} />
        </div>

        <div className="actions">
          <button type="submit">Registrarse</button>
        </div>
      </form>
    </div>
  )
}

export default Register
