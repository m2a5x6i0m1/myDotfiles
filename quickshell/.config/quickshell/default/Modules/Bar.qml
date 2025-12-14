import QtQuick
import Quickshell

import qs.Modules

Scope {
  id: barRoot

  property color colBase: "#1e1e2e"
  property color colPeach: "#fab387"
  property color colSurface0: "#313244"
  property color colSurface2: "#585b70"
  property color colText: "#cdd6f4"

  Variants {
    model: Quickshell.screens
    PanelWindow {
      required property var modelData
      screen: modelData

      margins.top: 2
      margins.right: 4
      margins.left: 4

      anchors.top: true
      anchors.left: true
      anchors.right: true

      color: "transparent"
      implicitHeight: 30

      Rectangle {
        anchors.fill: parent
        color: barRoot.colBase
        radius: 5

        Workspace {}
      }
    }
  }
}
