import Store from './store'
import axios from '../axios'

class AuthService extends Store {
  async loadUser() {
    const token = localStorage.getItem("token")
    if (token) {
      try {
        await this._doLoadUser(token)
      } catch (e) {
        console.log(e)
        localStorage.removeItem("token")
        this.setState({ token: null, loaded: true })
      }
    } else {
      this.setState({ ...this.getState(), loaded: true })
    }
  }

  async _doLoadUser(token) {
    const response = await axios.get('/users/profile')
    const { username, email, admin } = response.data
    this.setState({ username, email, admin, token, loaded: true })
  }

  async signup(user) {
    const response = await axios.post('/users', user)

    const { token } = response.data
    localStorage.setItem("token", token)
    this.setState({ firstName: user.firstName, lastName: user.last_name, email: user.email, token, loaded: true })
  }

  async login(emailArg, password) {
    const response = await axios.post('/sessions', { identifier: emailArg, password })

    const { firstName, lastName, email, admin, token } = response.data
    localStorage.setItem("token", token)
    this.setState({ firstName, lastName, email, admin, token, loaded: true })
  }

  logout() {
    localStorage.removeItem("token")
    this.setState({ token: null, loaded: true  })
  }

  isAuthenticated() {
    return this.state.token != null
  }
}

export default new AuthService({ token: null, loaded: false })
