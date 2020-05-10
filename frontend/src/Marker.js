import React from 'react';
import { Marker, Popup } from 'react-leaflet'

const MarkerCase = ({ incident }) => {
  const statusMap = {
    suspicious: { title: "Sospecha", className: "suspicious" },
    awaiting_result: { title: "Esperando Resultado", className: "awaiting" },
    positive: { title: "Positivo", className: "positive" },
    recovered: { title: "Recuperado", className: "recovered" },
    dead: { title: "Muerto", className: "dead" }
  }

  const getStatusTitle = status => {
    return statusMap[status] ? statusMap[status].title : "Desconocido";
  }

  const getStatusClass = status => {
    return statusMap[status] ? statusMap[status].className : "";
  }

  return (
    <Marker position={[incident.latitude, incident.longitude]}>
      <Popup>
        <div className="case">
          <h4>{ incident.address }</h4>
          <div className="gender"><strong>Sexo: </strong> { incident.gender === "female" ? "Mujer" : "Hombre" }</div>
          <div className="age"><strong>Edad: </strong> { incident.age }</div>
          <div className={`status ${getStatusClass(incident.status)}`}>{ getStatusTitle(incident.status) }</div>
          <p>{ incident.description }</p>
        </div>
      </Popup>
    </Marker>
  )
}

export default MarkerCase
