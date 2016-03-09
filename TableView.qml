import QtQuick 2.0
import Ubuntu.Components 1.2

Item {

    AppModel {
        id: appmodel
        source: "file.csv"
    }

    ListView {
        id: listview
        anchors.fill: parent
        model: appmodel.model

        delegate: ListItem {
            id: del
            width: listview.width
            height: layout.childrenRect.height + units.gu(1)

            Rectangle {
                anchors.fill: parent
                color: index%2 == 0 ?  "Azure" : "Beige"
            }

            Column {
                id: layout
                width: listview.width
                spacing: units.gu(1)

                Item {
                    width: parent.width
                    height: name.height
                    Label { id: name; x: units.gu(1); text: model.name; font.bold: index==0}
                    Label { id: birthday; x: del.ListView.view.width/4; text: model.birthday; font.bold: index==0 }
                    Label { id: sex; x: listview.width/2; text: model.sex; font.bold: index==0 }
                    Label { id: city; x: listview.width*3/4; text: model.city; font.bold: index==0 }
                }

                Label {
                    text: model.address
                    fontSize: "large"
                    anchors.right: parent.right
                    anchors.rightMargin: units.gu(1)
                    visible: index != 0
                }
            }
        }
    }
}

