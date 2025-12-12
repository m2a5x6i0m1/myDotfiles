import Quickshell
import QtQuick

Variants {
  model: Quickshell.screens
  PanelWindow {

    required property var modelData
    screen: modelData
    anchors {
      top: true
      left: true
      right: true
    }

    margins {
      top: 2
      right: 4
      left: 4
    }

    color: "transparent"
    implicitHeight: 30

    Rectangle {
      anchors.fill: parent
      radius: 5
      Text {
        anchors.centerIn: parent
        text: "hello world"
      }
    }
  }
}
