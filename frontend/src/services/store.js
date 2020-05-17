import * as _ from 'lodash'

export default class Store {
  listeners = []
  state

  constructor(initialState) {
    this.state = initialState
  }

  getState() {
    return this.state
  }

  setState(newState) {
    const oldState = this.state

    this.state = newState

    if (!_.isEqual(oldState, this.state)) {
      this.listeners.forEach(listener => {
        listener(this.state)
      })
    }
  }

  subscribe(fn) {
    this.listeners.push(fn)
  }

  unsubscribe(fn) {
    this.listeners = this.listeners.filter(listener => listener !== fn)
  }
}
