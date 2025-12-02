const express = require('express');
const cors = require('cors');
const path = require('path');
const db = require('./config/db');
const { Profesor, Materia, Articulo } = require('./models/Entidades');

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname)));

// === VISTAS ===
app.get('/', (req, res) => res.sendFile(path.join(__dirname, 'index.html')));
app.get('/admin.html', (req, res) => res.sendFile(path.join(__dirname, 'admin.html')));
app.get('/login.html', (req, res) => res.sendFile(path.join(__dirname, 'login.html')));

// === LOGIN ===
app.post('/api/login', (req, res) => {
    const { usuario, password } = req.body;
    if (usuario === 'admin' && password === 'admin') { 
        res.json({ token: 'TOKEN_ESCUELA_ADMIN' });
    } else {
        res.status(401).json({ error: 'Credenciales inválidas' });
    }
});

// === API ACADÉMICA (Profesores) ===
app.get('/api/profesores', async (req, res) => {
    try {
        const profes = await Profesor.findAll({ 
            include: { model: Materia, as: 'materias' } 
        });
        res.json(profes);
    } catch (error) {
        console.error(error);
        res.status(500).send('Error en el servidor al buscar profesores');
    }
});

app.post('/api/profesores', async (req, res) => {
    try {
        await Profesor.create(req.body);
        res.json({ msg: 'Ok' });
    } catch (e) {
        res.status(500).json({ error: 'Error al crear profesor' });
    }
});

app.delete('/api/profesores/:id', async (req, res) => {
    await Profesor.destroy({ where: { id: req.params.id } });
    res.json({ msg: 'Eliminado' });
});

// === MATERIAS ===
app.post('/api/materias', async (req, res) => {
    try {
        const { profesorId, nombre, curso, horario } = req.body;
        await Materia.create({ profesorId, nombre, curso, horario });
        res.json({ msg: 'Asignada' });
    } catch (e) {
        console.error(e);
        res.status(500).json({ error: 'Error al asignar materia' });
    }
});

// === PORTAL PÚBLICO ===
app.get('/api/portal/:dni', async (req, res) => {
    try {
        const profe = await Profesor.findOne({ 
            where: { dni: req.params.dni },
            include: { model: Materia, as: 'materias' } 
        });
        if (!profe) return res.status(404).json({ error: 'Profesor no encontrado' });
        res.json(profe);
    } catch (error) {
        console.error(error);
        res.status(500).send('Error en el servidor');
    }
});

// === STOCK ===
app.get('/api/articulos', async (req, res) => res.json(await Articulo.findAll()));
app.post('/api/articulos', async (req, res) => await Articulo.create(req.body) && res.json({msg:'Ok'}));
app.put('/api/articulos/:id', async (req, res) => {
    const item = await Articulo.findByPk(req.params.id);
    if(item) { item.stock += req.body.cantidad; if(item.stock<0) item.stock=0; await item.save(); }
    res.json(item);
});

const PORT = 4000;
db.sync({ alter: true }).then(() => {
    console.log('✅ Sistema Docente Actualizado');
    app.listen(PORT, () => console.log(`🚀 Corriendo en http://localhost:${PORT}`));

});
