const express = require('express');
const redis = require('redis');

const app = express();
const client = redis.createClient({
  host: 'redis-server',
  port: 6379
});

client.set('visits', 0);

app.get('/', (req, res) => {
  client.get('visits', (err, visits) => {
    if (err) {
      return res.status(500).send('Error retrieving visits');
    }
    visits = parseInt(visits) + 1;
    res.send(`Number of visits is ${visits}`);
    client.set('visits', visits);
  });
});

// Mova a chamada app.listen() para fora da rota
app.listen(8081, () => {
  console.log('Server is running on port 8081');
});