const express = require('express');
const bodyParser = require('body-parser');
const app = express();
app.use(bodyParser.json());

const patients = [
  { id: 1, name: 'Alice' },
  { id: 2, name: 'Bob' }
];

app.get('/health', (req, res) => res.send({ status: 'ok' }));
app.get('/patients', (req, res) => res.json(patients));
app.get('/patients/:id', (req, res) => {
  const p = patients.find(x => x.id === Number(req.params.id));
  if (!p) return res.status(404).json({ error: 'not found' });
  res.json(p);
});

const port = process.env.PORT || 3001;
app.listen(port, () => console.log(`Patient service listening on ${port}`));
