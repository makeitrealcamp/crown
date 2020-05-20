require 'rails_helper'

RSpec.describe Api::V1::IncidentsController, :type => :request do
  let(:user) { create(:user) }
  let(:header) { { 'Authorization' => JsonWebToken.encode({ user_id: user.id }) } }

  before { Timecop.freeze(Time.local(2020, 12, 19, 12, 0, 0)) }
  after { Timecop.return }

  describe "GET/create incidents" do
    context "Index process success" do
      it "Should return empty array if dont exist incidents" do
        get '/api/v1/incidents', headers: header

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body)

        expect(response_body).to eq([])
      end

      it "Should return array with elements" do
        incident1 = create(:incident)

        get '/api/v1/incidents', headers: header

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body)

        expected_response = [{
          "address"=>nil,
          "age"=>20,
          "archived"=>false,
          "confirmed"=>false,
          "created_at"=>"2020-12-19T17:00:00.000Z",
          "description"=>nil,
          "gender"=>"male",
          "id"=>Incident.last.id,
          "latitude"=>Incident.last.latitude,
          "longitude"=>Incident.last.longitude,
          "status"=>"positive",
          "updated_at"=>"2020-12-19T17:00:00.000Z",
          "user_id"=>Incident.last.user.id
        }]

        expect(response_body).to eq(expected_response)
      end
    end
  end

  describe "GET/show incidents" do
    context "Show process success" do
      it "Should return empty array if dont exist incidents" do
        user1 = create(:user, name: "user1")
        user2 = create(:user, name: "user2")
        incident1 = create(:incident, description: "I'm a test", address: "Av falsa 123", age: 12)
        incident2 = create(:incident, user: user1)
        incident3 = create(:incident, user: user2)

        get "/api/v1/incidents/#{incident1.id}", headers: header

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body)

        expected_response = {
          "address"=>"Av falsa 123",
          "age"=>12,
          "archived"=>false,
          "confirmed"=>false,
          "created_at"=>"2020-12-19T17:00:00.000Z",
          "description"=>"I'm a test",
          "gender"=>"male",
          "id"=>Incident.find_by(description: "I'm a test").id,
          "latitude"=>Incident.find_by(description: "I'm a test").latitude,
          "longitude"=>Incident.find_by(description: "I'm a test").longitude,
          "status"=>"positive",
          "updated_at"=>"2020-12-19T17:00:00.000Z",
          "user_id"=>Incident.find_by(description: "I'm a test").user.id
        }

        expect(response_body).to eq(expected_response)
      end
    end
  end

  describe "POST/create incident" do
    context "Create incidents process success" do
      it "Should create a incident" do
        expect(Incident.all.count).to be_zero

        body = {
          "incident"=>{
            "longitude"=> "6.256865",
            "latitude" => "75.592775",
            "age"=> "70",
            "gender"=> "male",
            "status"=> "positive",
            "addres"=> "Avenida falsa 123",
            "description"=> "Soy un test",
            "archived"=> "false"
          }
        }

        post '/api/v1/incidents', headers: header, params: body

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body)

        expect(Incident.last.description).to eq("Soy un test")
      end
    end
  end
end
