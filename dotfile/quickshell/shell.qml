import QtQuick 2.15
import QtQuick.Window 2.15
import Quickshell 1.0
import Quickshell.Wayland 1.0

// ==============================================================================
// UNIFIED QUICKSHELL DESKTOP
// Inspired by: Serpantinum (architecture) & Cartoon Shell (animations)
// ==============================================================================

ShellWindow {
    id: root
    width: Screen.width
    height: Screen.height
    color: "transparent"
    
    // Set layer so it stays behind windows for desktop, or overlay for UI
    layer: ShellWindow.Background
    
    // Global properties that could be hooked to a color generation script (Caelestia style)
    property color bgPrimary: "#1e1e2e"
    property color accentPrimary: "#89b4fa"
    
    // Top Bar Component
    Bar {
        id: topBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 40
    }
    
    // Launcher overlay (Toggled via shortcut)
    Rectangle {
        id: launcher
        width: 600
        height: 400
        anchors.centerIn: parent
        color: Qt.rgba(30/255, 30/255, 46/255, 0.9)
        radius: 20
        opacity: 0
        visible: opacity > 0
        
        // Fluid Cartoon-shell style animation
        Behavior on opacity {
            NumberAnimation { duration: 300; easing.type: Easing.OutBack }
        }
        Behavior on scale {
            NumberAnimation { duration: 300; easing.type: Easing.OutBack }
        }
        
        scale: opacity > 0 ? 1 : 0.8
        
        Text {
            anchors.centerIn: parent
            text: "App Launcher (Press Esc to close)"
            color: accentPrimary
            font.pixelSize: 24
        }
    }

    // Toggle Launcher function (to be called via IPC or shortcut)
    function toggleLauncher() {
        launcher.opacity = launcher.opacity === 0 ? 1 : 0
    }
}
