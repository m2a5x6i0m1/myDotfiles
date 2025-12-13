import Quickshell
import Quickshell.Hyprland
import QtQuick.Layouts
import QtQuick

Variants {
  model: Quickshell.screens
  PanelWindow {
    property color colBase: "#1e1e2e"
    property color colPeach: "#fab387"
    property color colSurface0: "#313244"
    property color colSurface2: "#585b70"
    property color colText: "#cdd6f4"

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
      color: colBase
      radius: 5

      Rectangle {
        anchors.centerIn: parent
        implicitWidth: 210
        implicitHeight: 30
        color: colSurface0

        RowLayout {
          anchors.fill: parent
          spacing: 0

          Repeater {
            model: 10

            Rectangle {
              Layout.preferredWidth: 20
              Layout.preferredHeight: parent.height
              color: "transparent"

              property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
              property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
              property bool hasWindows: workspace !== null

              Text {
                text: index + 1
                color: parent.isActive ? colPeach : (parent.hasWindows ? colText : colSurface2)
                anchors.centerIn: parent
                font.bold: true
              }
              MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
              }
            }
          }
        }
      }
    }
  }
}
