require('dotenv').config();
const express = require('express');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(cors());

app.get('/', (req, res) => {
    res.send('Roblox Script API is running...');
});

// API สำหรับโหลดสคริปต์ Roblox
app.get('/script.lua', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'script.lua
