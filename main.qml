import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtMobilePluginFirebase 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
        Text{
            id: lblResult
            text: ".."
        }

        Button {
            text: "init firestore"
            onClicked: {
                console.log("init click")
                firestore.init()
            }
        }

        Button {
            text: "call firestore"
            onClicked: {
                console.log("callfirestore click")
                firestore.getDocuments("qt-test")
            }
        }
    }




    FirebaseFirestore {
        id: firestore
        onError: {
            console.log("++++++++++++++++++++++++")
            console.log(error)
            lblResult.text = error
        }
        onCollection: {
            console.log("------------------------")
            console.log(collection)
            console.log(JSON.stringify(values))

            for(var i in values){
                console.log("id = " + values[i].id  + ", name = " + values[i].name)
            }

            lblResult.text = "Collection: " + collection + ", values = " + values
        }
    }

}
