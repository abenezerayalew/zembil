const express = require('express');
const mongoose = require('mongoose');
// Files
const authRouter = require('./routes/auth');
const shopRouter = require('./routes/shop');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');
// Constants
const port = 3000;
const app = express();
const DB =
  "mongodb+srv://ebenzo:ebenzo123zembil@cluster0.u8nug7b.mongodb.net/?retryWrites=true&w=majority";
// Middleware
app.use(express.json());
app.use( authRouter);
app.use(shopRouter);
app.use(productRouter);
app.use(userRouter);

// Connect to DB
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });
// Start the server
app.listen(port,"0.0.0.0", () =>{
     console.log(`listening on port ${port}!`);
    });
