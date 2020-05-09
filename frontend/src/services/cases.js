import axios from '../axios'

const cases = [
  {
    "id": 1,
    "address": "Carrera 76 #53 - 89",
    "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "age": 92,
    "gender": "female",
    "status": "dead",
    "latitude": 6.262362,
    "longitude": -75.565826,
    "confirmed": true,
    "created_at": "2020-05-07T03:17:48.815Z",
    "updated_at": "2020-05-07T03:17:48.815Z"
  }
]

async function list() {
  return new Promise(resolve => {
    resolve(cases);
  })
}

async function create(newCase) {
  return new Promise(resolve => {
    cases.push(newCase);
    resolve();
  })
}

export default {
  list,
  create
}
