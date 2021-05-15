// Get the packages we need
var express = require('express');
var bodyParser = require('body-parser');
var fs = require('fs');
var url = require("url");
var path = require("path");

// Create our Express application
var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Use environment defined port or 3000
var port = process.env.PORT || 3000;
var versionMock = "0.1";
// Create our Express router
//var router = express.Router();

var showRequest = false;
var showResponse = false;

/*
Send Request.
*/

function sendResponse(fileName, req, res, status) {

	if (showRequest) {
		console.log("***Request.body:");
		console.log(req.body);
	}

	if (fs.existsSync(fileName)) {
		// Do something
			fs.readFile(fileName, 'utf8', function (err,data) {
			if (err) {
				console.log(err);
			} else {
				var obj = JSON.parse(data);
				res.header('Content-Type','application/json');

				if (showResponse) {
					console.log("***Response: ");
					console.log(obj);
					console.log("***Status response:");
					console.log(status);
				}
				res.status(status).json(obj);
			}
		});
	} else {
		console.log("not found");
		res.send(404);//.description("Error");
	}
}

/**********************/
/***** MapPois ****** /
/**********************/


/*iCoLocations*/
app.get('/iCoLocations', function (req, res) {
	console.log(req)
	var status = 200;
	var fileName = "./JSONs/MapPois/iCoLocations.json";
	sendResponse(fileName, req, res, status);
});

/*

app.get('/iCoMenuResponse', function (req, res) {
	console.log(req)
	var status = 200;
	var fileName = "./JSONs/MapPois/iCoMenuResponse.json";
	sendResponse(fileName, req, res, status);
});



app.get('/iCoResponseNivel1', function (req, res) {
	console.log(req)
	var status = 200;
	var fileName = "./JSONs/MapPois/iCoResponseNivel1.json";
	sendResponse(fileName, req, res, status);
});


app.get('/iCoMusicVideos', function (req, res) {
	console.log(req)
	var status = 200;
	var fileName = "./JSONs/MapPois/iCoMusicVideos.json";
	sendResponse(fileName, req, res, status);
});
*/

/**********************/
/***** MapPois ****** /
/**********************/


// Start the server
app.listen(port);
console.log('MapPois API init Port ' + port + ' . Version Mock: ' + versionMock);
