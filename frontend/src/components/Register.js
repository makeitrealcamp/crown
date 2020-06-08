import React from 'react'
import {
  Formik,
  Form,
  Field,
  ErrorMessage,
} from 'formik'
import * as Yup from 'yup'
import TextError from '../utils/TextError'
import authService from '../services/auth'

const initialValues = {
  username: '',
  email: '',
  name: '',
  last_name: '',
  password: '',
  passwordConfirmation: '',
}

const validationSchema = Yup.object({
  username: Yup.string()
    .min(4, 'Mínimo 4 caracteres')
    .max(15, 'Máximo 15 caracteres')
    .required('Este es un campo requerido'),
  email: Yup.string()
    .email('Correo inválido')
    .required('Este es un campo requerido'),
  name: Yup.string()
    .max(20, 'Máximo 10 caracteres')
    .required('Este es un campo requerido'),
  last_name: Yup.string()
    .max(20, 'Máximo 20 caracteres')
    .required('Este es un campo requerido'),
  password: Yup.string()
    .min(4, 'Mínimo 4 caracteres')
    .max(100, 'Máximo 100 caracteres')
    .required('Este es un campo requerido'),
  passwordConfirmation: Yup.string()
    .oneOf([Yup.ref('password'), null], 'Los password deben coincidir')
    .required('Este es un campo requerido'),
})
const Register = ({ close }) => (
  <Formik
    initialValues={initialValues}
    validationSchema={validationSchema}
    onSubmit={async (values) => {
      await authService.signup(values)
      close()
    }}
  >
    <div className="form-page auth-page">
      <Form className="form">
        <div className="form-group">
          <label htmlFor="username">Username:</label>
          <Field type="text" id="username" name="username" className="form-control" />
          <ErrorMessage name="username" render={(message) => <TextError errorField="username" message={message} />} />
        </div>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <Field type="email" id="email" name="email" className="form-control" />
          <ErrorMessage name="email" render={(message) => <TextError errorField="email" message={message} />} />
        </div>
        <div className="form-group">
          <label htmlFor="name">Nombre:</label>
          <Field type="text" id="name" name="name" className="form-control" />
          <ErrorMessage name="name" render={(message) => <TextError errorField="name" message={message} />} />
        </div>
        <div className="form-group">
          <label htmlFor="last_name">Apellido:</label>
          <Field type="text" id="last_name" name="last_name" className="form-control" />
          <ErrorMessage name="last_name" render={(message) => <TextError errorField="last_name" message={message} />} />
        </div>
        <div className="form-group">
          <label htmlFor="password">Password:</label>
          <Field type="password" id="password" name="password" className="form-control" />
          <ErrorMessage name="password" render={(message) => <TextError errorField="password" message={message} />} />
        </div>
        <div className="form-group">
          <label htmlFor="passwordConfirmation">Repita su Password:</label>
          <Field type="password" id="passwordConfirmation" name="passwordConfirmation" className="form-control" />
          <ErrorMessage name="passwordConfirmation" render={(message) => <TextError errorField="passwordConfirmation" message={message} />} />
        </div>
        <div className="actions">
          <button type="button" onClick={() => close('incident')}>Cerrar</button>
          <button type="submit">Registrarse</button>
        </div>
      </Form>
    </div>
  </Formik>
)

export default Register
