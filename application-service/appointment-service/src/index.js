const express = require('express');
const axios = require('axios');
const app = express();
app.get('/health', (req, res) => res.send({ status: 'ok' }));

app.get('/appointments', async (req, res) => {
  try {
    const patientUrl = process.env.PATIENT_URL || 'http://patient-service:3001/patients';
    const resp = await axios.get(patientUrl);
    const patients = resp.data;
    const appointments = patients.map(p => ({ patientId: p.id, when: '2025-12-01T09:00:00Z' }));
    res.json(appointments);
  } catch (err) {
    res.status(502).json({ error: 'upstream error', details: err.message });
  }
});

const port = process.env.PORT || 3002;
app.listen(port, () => console.log(`Appointment service listening on ${port}`));
