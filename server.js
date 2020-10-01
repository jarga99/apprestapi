const express = require("express");
const bodyParser = require("body-parser");
const routes = require("./routes");
const middlewares = require('./middleware')

var morgan = require("morgan");
const app = express();

//parser aplication/json
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(morgan("dev"));


//panggil routes
routes(app);

//daftarkan menu routes dari index
app.use(middlewares)

app.listen(3000, () => {
  console.log(`Server started on port 3000`);
});
