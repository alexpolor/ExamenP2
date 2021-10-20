

const db = require('../database');




class incidente{
    constructor (id_zombie, id_nombre_estado){
        this.id_zombie=id_zombie;
        this.id_nombre_estado=id_nombre_estado;
        
    }
    static fetchAll() {
        return db.execute('SELECT id ,nombre_zombie, nombre_estado, DATE_FORMAT(fecha_registro, "%d/%m/%Y") as fecha_registro, DATE_FORMAT(fecha_registro, "%h:%m:%s") as hora_registro from zombie_estado ZE,zombie z,estado e WHERE ZE.id_zombie=z.id_zombie and ZE.id_estado=e.id_estado ORDER by fecha_registro DESC, hora_registro DESC');
    }

    static fetchAllZombies() {
        return db.execute('SELECT * from zombie');
    }

    static fetchAllEstados() {
        return db.execute('SELECT * from estado');
    }

    static fetchCountZombies() {
        return db.execute('SELECT COUNT(id_zombie) as totalZombies FROM zombie');
    }

    save(){
        return db.execute('INSERT INTO zombie_estado (id_zombie, id_estado) VALUES (?, ?)',
        [this.id_zombie, this.id_nombre_estado]
    );
    }
}
module.exports=incidente;

