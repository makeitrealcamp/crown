import React from 'react'
import '@testing-library/jest-dom/extend-expect'
import {
  render, waitFor, fireEvent, describe, it, expect,
} from '@testing-library/react'
import Register from './Register'


describe('Error validation in the fields', () => {
  it('should have validation error given username field is touched and error exists on form', async () => {
    const fieldName = 'username'
    const labelName = 'Username:'
    const { findByTestId, getByLabelText } = render(<Register />)
    const input = getByLabelText(labelName)

    fireEvent.blur(input)
    const validationErrors = await findByTestId(`error-${fieldName}`)
    expect(validationErrors.innerHTML).toBe('Este es un campo requerido')
  })

  it('should have validation error given email field is touched and error exists on form', async () => {
    const fieldName = 'email'
    const labelName = 'Email:'
    const { findByTestId, getByLabelText } = render(<Register />)
    const input = getByLabelText(labelName)

    fireEvent.blur(input)
    const validationErrors = await findByTestId(`error-${fieldName}`)
    expect(validationErrors.innerHTML).toBe('Este es un campo requerido')
  })

  it('should have validation error given name field is touched and error exists on form', async () => {
    const fieldName = 'name'
    const labelName = 'Nombre:'
    const { findByTestId, getByLabelText } = render(<Register />)
    const input = getByLabelText(labelName)

    fireEvent.blur(input)
    const validationErrors = await findByTestId(`error-${fieldName}`)
    expect(validationErrors.innerHTML).toBe('Este es un campo requerido')
  })

  it('should have validation error given name field is touched and error exists on form', async () => {
    const fieldName = 'last_name'
    const labelName = 'Apellido:'
    const { findByTestId, getByLabelText } = render(<Register />)
    const input = getByLabelText(labelName)

    fireEvent.blur(input)
    const validationErrors = await findByTestId(`error-${fieldName}`)
    expect(validationErrors.innerHTML).toBe('Este es un campo requerido')
  })

  it('should have validation error given password field is touched and error exists on form', async () => {
    const fieldName = 'password'
    const labelName = 'Password:'
    const { findByTestId, getByLabelText } = render(<Register />)
    const password = getByLabelText(labelName)

    fireEvent.blur(password)
    const validationErrors = await findByTestId(`error-${fieldName}`)
    expect(validationErrors.innerHTML).toBe('Este es un campo requerido')
  })

  it('should have validation error given repeat password field is touched and error exists on form', async () => {
    const fieldName = 'passwordConfirmation'
    const labelName = 'Repita su Password:'
    const { findByTestId, getByLabelText } = render(<Register />)
    const password = getByLabelText(labelName)

    fireEvent.blur(password)
    const validationErrors = await findByTestId(`error-${fieldName}`)
    expect(validationErrors.innerHTML).toBe('Este es un campo requerido')
  })
})

describe('change values correctly in the fields', () => {
  it('should change the user name text', async () => {
    const labelName = 'Username:'
    const { getByLabelText } = render(<Register />)
    const input = getByLabelText(labelName)

    await waitFor(() => {
      fireEvent.change(input, { target: { value: 'mockUsername' } })
    })

    expect(input.textContent).not.toBe(' ')
    expect(input.value).toBe('mockUsername')
  })

  it('should change the email text', async () => {
    const fieldName = 'email'
    const labelName = 'Email:'
    const { getByLabelText, findByTestId } = render(<Register />)
    const email = getByLabelText(labelName)

    await waitFor(() => {
      fireEvent.change(email, { target: { value: 'mockUserCorreo' } })
      fireEvent.focusOut(email)
    })
    fireEvent.blur(email)
    const validationErrors = await findByTestId(`error-${fieldName}`)

    expect(email.textContent).not.toBe(' ')
    expect(email.value).toBe('mockUserCorreo')
    expect(validationErrors.innerHTML).toBe('Correo inválido')

    await waitFor(() => {
      fireEvent.change(email, { target: { value: 'correo@mock.com' } })
    })
    expect(email.textContent).not.toBe(' ')
    expect(email.value).toBe('correo@mock.com')
  })

  it('should change the Password text', async () => {
    const labelName = 'Password:'
    const { getByLabelText } = render(<Register />)
    const password = getByLabelText(labelName)
    await waitFor(() => {
      fireEvent.change(password, { target: { value: 'mockPassword' } })
    })
    expect(password.value).not.toBe(' ')
    expect(password.value).toBe('mockPassword')
  })


  it('should change the Confirm password tex', async () => {
    const labelName = 'Repita su Password:'
    const { getByLabelText } = render(<Register />)
    const password_confirmation = getByLabelText(labelName)
    await waitFor(() => {
      fireEvent.change(password_confirmation, { target: { value: 'mockPassword' } })
    })
    expect(password_confirmation.value).not.toBe(' ')
    expect(password_confirmation.value).toBe('mockPassword')
  })

  it('Password must match', async () => {
    const labelName_password = 'Password:'
    const labelName_password_confirmation = 'Repita su Password:'
    const fieldName = 'passwordConfirmation'
    const { getByLabelText, findByTestId } = render(<Register />)
    const password = getByLabelText(labelName_password)
    const password_confirmation = getByLabelText(labelName_password_confirmation)

    await waitFor(() => {
      fireEvent.change(password, { target: { value: 'mockPassword' } })
    })

    await waitFor(() => {
      fireEvent.change(password_confirmation, { target: { value: 'WrongPassword' } })
      fireEvent.focusOut(password_confirmation)
    })

    fireEvent.blur(password_confirmation)
    const validationErrors = await findByTestId(`error-${fieldName}`)
    expect(validationErrors.innerHTML).toBe('Los password deben coincidir')
  })
})
