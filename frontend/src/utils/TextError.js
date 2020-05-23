import React from 'react'

function TextError({ message, errorField }) {
  return <div className="error" data-testid={`error-${errorField}`}>{message}</div>
}

export default TextError
