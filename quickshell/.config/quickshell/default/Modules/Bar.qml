import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

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
        color: colBase
        radius: 5

        Rectangle {
          anchors.centerIn: parent
          color: colSurface0
          radius: 14

          implicitWidth: 210
          implicitHeight: 26

          RowLayout {
            uniformCellSizes: true
            anchors.fill: parent
            spacing: 0

            Repeater {
              model: 10

              Rectangle {
                Layout.preferredWidth: 20
                Layout.preferredHeight: 20

                property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
                property bool isActive: Hyprland.focusedWorkspace.id === (index + 1)
                property bool hasWindows: workspace !== null

                color: isActive ? colPeach : (hasWindows ? colText : colSurface2)
                radius: 15

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
}
