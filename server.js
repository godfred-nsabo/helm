"use strict";
const express = require("express");
const cors = require('cors')

// Constants
const PORT = 5000;
const HOST = "0.0.0.0";
// App
const app = express();
app.use(cors());

app.get("/", (req, res) => {
  res.send(
    ([
      {
        id: "1",
        title: "This is my First Blog Title",
      },
      {
        id: "2",
        title: "This is my Second Blog Title",
      },
      {
        id: "3",
        title: "This is my Third Blog Title",
      },
      ])
  );
});
app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
