import * as React from "react"

export const useStore = store => {
  const [state, setState] = React.useState(store.getState())

  React.useEffect(() => {
    store.subscribe(newState => {
      setState(newState)
    })

    // update the state (state could have changed already)
    setState(store.getState())
  }, [store])

  return state
}
