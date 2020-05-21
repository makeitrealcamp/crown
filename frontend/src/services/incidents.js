/* eslint-disable react/no-access-state-in-setstate */
import axios from '../utils/axios'
import Store from './store'

class IncidentsService extends Store {
  async load() {
    const response = await axios.get('/incidents')
    this.setState(response.data)
  }

  async create(newCase) {
    const response = await axios.post('/incidents', newCase)
    this.setState(this.state.concat(response.data))
  }
}

export default new IncidentsService([])
