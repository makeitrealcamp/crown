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
  password: '',
}

const validationSchema = Yup.object({
  username: Yup.string().required('Este es un campo requerido'),
  password: Yup.string().required('Este es un campo requerido'),
})
const Login = ({ close }) => (
  <Formik
    initialValues={initialValues}
    validationSchema={validationSchema}
    onSubmit={async (values) => {
      await authService.login(values.username, values.password)
      close()
    }}
  >
    <div className="form-page auth-page">
      <Form className="form">
        <div className="form-group">
          <label htmlFor="username">Username or Email:</label>
          <Field type="text" id="username" name="username" className="form-control" placeholder="username" />
          <ErrorMessage name="username" render={(message) => <TextError errorField="username" message={message} />} />
        </div>
        <div className="form-group">
          <label htmlFor="password">Password:</label>
          <Field type="password" id="password" name="password" className="form-control" placeholder="****" />
          <ErrorMessage name="password" render={(message) => <TextError errorField="password" message={message} />} />
        </div>
        <div className="actions">
          <button type="button" onClick={() => close('incident')}>Cerrar</button>
          <button type="submit">Login</button>
        </div>

      </Form>
    </div>
  </Formik>
)

export default Login
