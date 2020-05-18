import React from 'react';
import { useState } from 'react';
import incidentsService from './services/incidents'

const Form = ({ lat, lng, close }) => {
  const [state, setState] = useState({
    address: "",
    gender: "",
    age: "",
    status: "",
    description: "",
    latitude: lat,
    longitude: lng
  })

  const handleSubmit = async e => {
    e.preventDefault();

    try {
      await incidentsService.create(state)
      close()
    } catch (e) {
      console.log(e)
    }
  }

  return (
    <div className="incident-page">
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="address">Ubicación:</label>
          <input type="text" id="address" className="form-control" placeholder="Nombre del lugar o dirección" value={state.address} onChange={e => setState({ ...state, address: e.target.value })} />
        </div>
        <div className="form-group">
          <label htmlFor="gender">Sexo:</label>
          <select id="gender" className="form-control" onChange={e => setState({ ...state, gender: e.target.value })}>
            <option value="unknown">Desconocido</option>
            <option value="male">Hombre</option>
            <option value="female">Mujer</option>
            <option value="other">Otro</option>
          </select>
        </div>
        <div className="form-group">
          <label htmlFor="age">Edad:</label>
          <input type="text" id="age" className="form-control" value={state.age} onChange={e => setState({ ...state, age: e.target.value })} />
        </div>
        <div className="form-group">
          <label htmlFor="status">Estado:</label>
          <select id="status" className="form-control" onChange={e => setState({ ...state, status: e.target.value })}>
            <option value="unknown">Desconocido</option>
            <option value="suspicious">Sospecha</option>
            <option value="awaiting_result">Esperando Resultado</option>
            <option value="positive">Positivo</option>
            <option value="recovered">Recuperado</option>
            <option value="dead">Muerto</option>
          </select>
        </div>
        <div className="form-group">
          <label htmlFor="description">Descripción</label>
          <textarea id="description" rows="3" className="form-control" value={state.description} onChange={e => setState({ ...state, description: e.target.value })}></textarea>
        </div>

        <div className="actions">
          <button onClick={e => close("incident")}>Cerrar</button>
          <button type="submit">Reportar</button>
        </div>
      </form>
    </div>
  );
}

export default Form
