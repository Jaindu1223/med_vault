const express = require('express');
const mongoose = require('mongoose');

const app = express();

// Connect to MongoDB

///mongoose.connect('mongodb://localhost/pharmacy');
//mongoose.connect("mongodb+srv://cluster0.ys7cny6.mongodb.net/" --apiVersion 1 --username user1)

// Pharmacy schema definition
const pharmacySchema = new mongoose.Schema({
  name: String,
  location: String,
  medicines: [{ name: String, stock: Number }],
});
//const Pharmacy = mongoose.model('Pharmacy', pharmacySchema);

// REST API
app.get('/pharmacies', async (req, res) => {
  // Fetch data from the database and return it
  const pharmacies = await Pharmacy.find();
  res.json(pharmacies);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));

