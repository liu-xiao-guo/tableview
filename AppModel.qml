import QtQuick 2.0

Item {
    property string source: ""

    property ListModel model : ListModel { id: jsonModel }
    property alias count: jsonModel.count

    function createPerson(r) {
        return {
                "name": r[0],
                "birthday":r[1],
                "sex":r[2],
                "city":r[3],
                "address":r[4]
               };
    }

    onSourceChanged: {
        console.log("Loading " + source)

        var xhr = new XMLHttpRequest;
        xhr.open("GET", source);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                var doc = xhr.responseText;
                console.log("doc: " + doc);

                 var records = xhr.responseText.split('\n');

                console.log("length: " + records.length)

                for ( var i = 0; i < records.length; i++ ) {
                    console.log("record: " + i + " "  + records[i]);

                    var r = records[i].split(',');
                    if ( r.length === 5 )
                        jsonModel.append(createPerson(r));
                }
            }
        }

       xhr.send();
    }
}
