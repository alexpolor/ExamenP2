
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
//const router = express.Router();
const path = require('path');
const incidente= require('../ExamenParcial/models/incidente')


//Middleware
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: false}));

//HTML Dinamico Middleware

//Middleware registro incidentes
app.get('/zombies/registro', (request, response, next) => {
    incidente.fetchAllZombies().then(([nombres,_])=>{
        incidente.fetchAllEstados().then(([estados,_])=>{
           response.render('../views/registrarIncidente', {
               nombres: nombres,
               estados: estados,
           })
        })
    })

    
});

//MiddleWare Consulta incidentes
app.get('/zombies', (request, response, next) => {
    incidente.fetchAll()
    .then((result,field)=>{
        console.log(result[0])

        response.render('../views/incidentes', {
            incidentes: result[0]
        })
    })

   // response.sendFile(path.join(__dirname, 'views', 'index.html'));
});

app.post('/zombies', (request, response, next) => {
    let newIncidente = new incidente(request.body.id_zombie,request.body.id_estado)
    newIncidente.save().then( () => {
    incidente.fetchAll()
    .then((result,field)=>{
        response.render('../views/incidentes', {
            incidentes: result[0]
        })
    })
    })
});
/*
app.use((request, response, next) => {
    console.log('Primer Middleware!');
    console.log(request.body);
    next(); //Le permite a la petición avanzar hacia el siguiente middleware
});

app.use('/ruta/nombres', (request, response, next) => {
    console.log('Tercer middleware!');
    response.send('Respuesta de la ruta "/ruta/nombres"'); 
});

app.use('/ruta/apellidos', (request, response, next) => {
    console.log('Tercer middleware!');
    response.send('Respuesta de la ruta "/ruta/apellidos"'); 
});

app.use('/ruta', (request, response, next) => {
    console.log('Segundo middleware!');
    response.send('Respuesta de la ruta "/ruta"'); 
});
*/

app.use((request, response, next) => {
    console.log('Tercer middleware!');
    response.status(404).send('NOT FOUND: ERROR 404'); //Manda la respuesta
});



app.listen(3000);