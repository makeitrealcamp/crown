# Crown - Backend

To install this project first clone it:

```
git clone https://github.com/makeitrealcamp/crown.git
```

`cd` into the `backend` folder and run `bundle install` and `yarn install`:

```
cd crown/backend
bundle install
yarn install
```

Configure database:

```
rails db:create
rails db:schema:load
rails db:seed
```

Run the application:

```
rails s -p3001
```
