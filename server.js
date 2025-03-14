require('dotenv').config();
const express = require('express');
const axios = require('axios');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(cors());

// หน้าหลักของ API
app.get('/', (req, res) => {
    res.send('Cookie Hub API is running...');
});

// โหลดสคริปต์จาก GitHub
app.get('/script.lua', async (req, res) => {
    try {
        const response = await axios.get("https://raw.githubusercontent.com/Nakhun12310/CookieHub/refs/heads/main/Fisch.lua");
        res.setHeader('Content-Type', 'text/plain');
        res.send(response.data);
    } catch (error) {
        res.status(500).send("Error fetching script.");
    }
});

// โหลดไฟล์สคริปต์จากเซิร์ฟเวอร์เอง
app.get('/local-script.lua', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'script.lua'));
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
