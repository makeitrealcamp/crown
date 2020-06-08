import React from 'react'
import '@testing-library/jest-dom/extend-expect'
import {
  render, waitFor, fireEvent, describe, it, expect,
} from '@testing-library/react'
import Login from './Login'


describe('Error validation in the fields', () => {
  it('should have validation error given username field is touched and error exists on form', async () => {
    const fieldName = 'username'
    const labelName = 'Username or Email:'
    const { findByTestId, getByLabelText } = render(<Login />)
    const input = getByLabelText(labelName)

    fireEvent.blur(input)
    const validationErrors = await findByTestId(`error-${fieldName}`)
    expect(validationErrors.innerHTML).toBe('Este es un campo requerido')
  })

  it('should have validation error given password field is touched and error exists on form', async () => {
    const fieldName = 'password'
    const labelName = 'Password:'
    const { findByTestId, getByLabelText } = render(<Login />)
    const password = getByLabelText(labelName)

    fireEvent.blur(password)
    const validationErrors = await findByTestId(`error-${fieldName}`)
    expect(validationErrors.innerHTML).toBe('Este es un campo requerido')
  })
})

describe('', () => {
  it('should change the user name text', async () => {
    const labelName = 'Username or Email:'
    const { getByLabelText } = render(<Login />)
    const input = getByLabelText(labelName)

    await waitFor(() => {
      fireEvent.change(input, { target: { value: 'mockUsername' } })
    })

    expect(input.textContent).not.toBe(' ')
    expect(input.value).toBe('mockUsername')
  })

  it('should change the Password text', async () => {
    const labelName = 'Password:'
    const { getByLabelText } = render(<Login />)
    const input = getByLabelText(labelName)

    await waitFor(() => {
      fireEvent.change(input, { target: { value: 'mockPassword' } })
    })

    expect(input.textContent).not.toBe(' ')
    expect(input.value).toBe('mockPassword')
  })
})
