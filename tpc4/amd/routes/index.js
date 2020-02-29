var express = require('express');
var router = express.Router();
var axios = require('axios')

var prefixes = `
    PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
    PREFIX owl: <http://www.w3.org/2002/07/owl#>
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    PREFIX noInferences: <http://www.ontotext.com/explicit>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX amd: <http://prc.di.uminho.pt/2020/amd#>
`

var getLink = "http://localhost:7200/repositories/testemusicas" + "?query="

/* GET home page. */
router.get('/', function(req, res, next) {
  var query = `select ?tit (count(?part) as ?numPartituras) ?id where {
    ?id rdf:type amd:Obra .
    ?id amd:temPartitura ?part .
    ?id amd:título ?tit
}

group by ?tit ?id
order by ?tit`
  var encoded = encodeURIComponent(prefixes + query)
  axios.get(getLink + encoded)
    .then(dados => {
      var mydata = []
      mydata = dados.data.results.bindings.map(obra =>{ return {id: obra.id.value.split('#')[1],
                                                        tit: obra.tit.value,
                                                        nparts: obra.numPartituras.value}})
      res.render('index', { obras : mydata });
    })
    .catch(erro => {
      res.render('error', {error : erro})
    })
});

/* GET da página com os detalhes das obras */
router.get('/:titulo', function(req, res, next) {
  var query = `select ?tit ?id ?tipe ?compositor where {
    ?id rdf:type amd:Obra .
    ?id amd:temPartitura ?part .
    ?id amd:título `+ `'` +req.params.titulo +`'`+`.
    ?id amd:tipo ?tipe .
    ?id amd:éCompostaPor ?compositor .
  } group by ?tit ?id ?tipe ?compositor`
  var encoded = encodeURIComponent(prefixes + query)
  axios.get(getLink + encoded)
    .then(dados => {
      var mydata = []
      console.log(dados.data)
      mydata = dados.data.results.bindings.map(obra =>{ return {
                                                        id: obra.id.value.split('#')[1],
                                                        tipe:obra.tipe.value,
                                                        compositor:obra.compositor.value
                                                        }})
    console.log(mydata[0].tipe)
      res.render('consult', { obras : mydata });
    })
    .catch(erro => {
      res.render('error', {error : erro})
    })
});

/* GET da página com os detalhes das partituras */
router.get('/partituras/:titulo', function(req, res, next) {
  var query = `select ?tit ?id ?tipe ?compositor where {
    ?id rdf:type amd:Obra .
    ?id amd:temPartitura ?part .
    ?id amd:título `+ `'` +req.params.titulo +`'`+`.
    ?id amd:tipo ?tipe .
    ?id amd:éCompostaPor ?compositor .
  } group by ?tit ?id ?tipe ?compositor`
  var encoded = encodeURIComponent(prefixes + query)
  axios.get(getLink + encoded)
    .then(dados => {
      var mydata = []
      console.log(dados.data)
      mydata = dados.data.results.bindings.map(obra =>{ return {
                                                        id: obra.id.value,
                                                        tipe:obra.tipe.value,
                                                        compositor:obra.compositor.value
                                                        }})
    console.log(mydata[0].tipe)
      res.render('partits', { obras : mydata });
    })
    .catch(erro => {
      res.render('error', {error : erro})
    })
});

module.exports = router;
