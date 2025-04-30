import Quickshell
import QtQuick

Scope {
  id: barRoot
  property color colBg: "#1e1e2e"

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
        left: 3
        right: 3
        bottom: 1
      }

      implicitHeight: 25
      color: "transparent"

      Rectangle {
        anchors.fill: parent
        color: barRoot.colBg
        radius: 5

        Workspaces {}
      }
    }
  }
}
