import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// Top Bar Component
Rectangle {
    id: barRoot
    color: Qt.rgba(30/255, 30/255, 46/255, 0.8)
    radius: 10
    
    // Margins to float the bar (Caelestia style)
    anchors.margins: 10
    
    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        
        // Workspaces (End-4 inspired)
        Row {
            spacing: 10
            Repeater {
                model: 5
                Rectangle {
                    width: 30
                    height: 10
                    radius: 5
                    color: index === 0 ? "#89b4fa" : "#585b70"
                    anchors.verticalCenter: parent.verticalCenter
                    
                    // Fluid animation on hover/active
                    Behavior on width { NumberAnimation { duration: 200; easing.type: Easing.OutQuad } }
                }
            }
        }
        
        Item { Layout.fillWidth: true } // Spacer
        
        // Clock
        Text {
            text: Qt.formatDateTime(new Date(), "hh:mm ap")
            color: "#cdd6f4"
            font.pixelSize: 16
            font.bold: true
        }
        
        Item { Layout.fillWidth: true } // Spacer
        
        // System Tray & Quick Settings
        Row {
            spacing: 15
            Text { text: "🔊 75%"; color: "#cdd6f4"; font.pixelSize: 16; anchors.verticalCenter: parent.verticalCenter }
            Text { text: "🔋 90%"; color: "#cdd6f4"; font.pixelSize: 16; anchors.verticalCenter: parent.verticalCenter }
            Text { text: "🌐 WiFi"; color: "#cdd6f4"; font.pixelSize: 16; anchors.verticalCenter: parent.verticalCenter }
        }
    }
}
