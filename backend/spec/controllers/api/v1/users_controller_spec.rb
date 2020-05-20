require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :request do
  let(:user) { create(:user) }
  let(:header) { { 'Authorization' => JsonWebToken.encode({ user_id: user.id }) } }

  describe "POST/create users" do
    context "Sign Up process success" do
      it "Should return json with new User created" do
        expect(User.all.count).to be_zero

        body = {
          "name"=> "Bruce",
          "last_name" => "Wayne",
          "email"=> "new_user@gmail.com",
          "username"=> "Batman",
          "password"=> "Bruce1Batman2*",
          "password_confirmation"=> "Bruce1Batman2*",
        }

        post '/api/v1/users', headers: header, params: body

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(201)

        response_body = JSON.parse(response.body)

        expect(User.last.name).to eq("Bruce")
      end
    end

    context "Sign Up process failure" do
      it "Should return error message" do
        expect(User.all.count).to be_zero

        user = create(:user)

        body = {
          "name"=> "Bruce",
          "last_name" => "Wayne",
          "email"=> user.email,
          "username"=> "Batman",
          "password"=> "hi",
          "password_confirmation"=> "hi"
        }

        post '/api/v1/users', headers: header, params: body

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(422)

        response_body = JSON.parse(response.body)

        expected_response = {
          "errors"=>[
            "Email has already been taken",
            "Password is too short (minimum is 6 characters)"
          ]
        }

        expect(response_body).to eq(expected_response)
      end
    end

    context "Sign Up process failure with wrong emai" do
      it "Should return error message" do
        expect(User.all.count).to be_zero

        body = {
          "name"=> "Bruce",
          "last_name" => "Wayne",
          "email"=> "new_userasdakcom",
          "username"=> "Batman",
          "password"=> "Bruce1Batman2*",
          "password_confirmation"=> "Bruce1Batman2*",
        }

        post '/api/v1/users', headers: header, params: body

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(422)

        response_body = JSON.parse(response.body)

        expected_response = {
          "errors"=>["Email is invalid"]
        }

        expect(response_body).to eq(expected_response)
      end
    end
  end
end

