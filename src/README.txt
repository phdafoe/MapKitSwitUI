//--------------------------------------------------
// Configuración del servidor local
//--------------------------------------------------

Pasos a seguir para configurar un servidor local (en Mac),
con el cual poder trabajar aunque no exista conectividad a Internet.

Paso 1: Descargar node.js de la página oficial.
  URL: https://nodejs.org/en/download/
Paso 2: Instalar node.js en el ordenador.
  Es una instalación guiada típica de Mac.
Paso 3: Ejecutar el script "InstallationScript.sh"
  En este paso se descargará las dependencias "express", "body-parser", "fs", "url" y "path"
  Es aconsejable conectarse a una red rápida. 
Paso 4: Ejecutar el comando “node <fichero_principal>“ en el directorio donde esté el fichero "app.js"
  Por defecto el servidor está configurado para correr en "http://localhost:3000"


//--------------------------------------------------
// Fichero "package.json"
//--------------------------------------------------

Propiedades:
- "main": Indica cuál es el fichero principal que hace arrancar el servidor.
- "start": Indica cuál es el comando para arrancar el servidor.
  En este caso "npm start"
- "dependencies": Indica las dependencias del servidor.


//--------------------------------------------------
// Fichero "app.js"
//--------------------------------------------------

- Se define la IP y el puerto por el que escuchará el servidor.

var server = app.listen(3000, function () {

  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});

En este caso será "http://localhost:3000"

- Cada servicio se configura en un método de la siguiente forma:

app.post/get(‘/sec/users/contractstates', function (req, res) {

	var status = 200;
	var fileName = "./JSONs/CH3Contratos.json";

	sendResponse(fileName, req, res, status);
});

status: Indica el estado que va a devolver la petición.
  Si se modifica se puede probar cada uno de los errores que puede devolver la petición.
fileName: Indica la ruta donde se encuentra el fichero ".json" de respuesta.


//--------------------------------------------------
// Importante
//--------------------------------------------------

- Se pueden modificar los ficheros .json en caliente sin tener que arrancar de nuevo el servidor.
- Si se modifica el fichero "package.json" o el "app.js" se deberá arrancar de nuevo el servidor.
