const url = require('../../cred.js');
var Db = require('mongodb');
const    MongoClient = require('mongodb').MongoClient


console.log(url);

//const url = "mongodb://admin:Q4ePfCbUWShF@ds225375.mlab.com:25375/turtle";
// const url = "mongodb://user:user@atlas.studio.xyz"
// const dbName = 'turtle';

const client = new MongoClient(url);

client.connect(()=>{
    console.log("connected");
    const db = client.db('turtle');     //set dbb
    var promise = db.collection('sensorreadings').find({a:1});


    function iterateFunc(doc) {
        console.log(JSON.stringify(doc, null, 4));
     }
     
     function errorFunc(error) {
        console.log(error);
     }
    
     // print out everything
     // lookup find();
    promise.forEach(iterateFunc, errorFunc);     
    

    // console.log(promise); // promise {<pending>}

    // print single doc
    // promise.then((value)=>{
    //     console.log(value);
    // })
    
    // client.close();
    
})

// connect client to url


// most of these works?