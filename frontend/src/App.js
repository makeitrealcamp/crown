import React from 'react'
import { useState, useEffect, createRef} from 'react'
import { Map, TileLayer } from 'react-leaflet'
import Marker from './Marker'
import Form from './Form';
import incidentsService from './services/cases';
import './App.scss';

const App = () => {
  const [position, setPosition] = useState({ lat: 6.2486, lng: -75.5742, zoom: 13 })
  const [incidents, setIncidents] = useState([])
  const [form, setForm] = useState({ show: false })

  useEffect(() => {
    async function load() {
      setIncidents(await incidentsService.list())
    }

    load()
  }, [incidents])

  const handleClick = e => {
    console.log(e);
    setForm({ show: true, lat: e.latlng.lat, lng: e.latlng.lng })
  }

  const handleCaseReported = incident => {
    incident.latitude = form.lat;
    incident.longitude = form.lng;

    setIncidents(incidents.concat(incident))
    setForm({ show: false })
  }

  const handleFormClose = ()  => {
    setForm({ show: false })
  }

  const mapRef = createRef();
  return (
    <div>
      <Map center={[position.lat, position.lng]} zoom={position.zoom} ref={mapRef} onClick={handleClick}>
        <TileLayer
          attribution='&amp;copy <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        { incidents.map(c => <Marker incident={c} key={`marker-${c.id}`} />) }
      </Map>
      { form.show ? <Form onCaseReported={handleCaseReported} onClose={handleFormClose} /> : null }
    </div>
  );
}

export default App;
