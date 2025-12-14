import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
  anchors.centerIn: parent
  color: barRoot.colSurface0
  radius: 14

  implicitWidth: 210
  implicitHeight: 26

  RowLayout {
    uniformCellSizes: false
    anchors.centerIn: parent
    spacing: 2

    Repeater {
      model: 10

      Rectangle {

        property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
        property bool isActive: Hyprland.focusedWorkspace.id === (index + 1)
        property bool hasWindows: workspace !== null

        Layout.preferredHeight: 20
        Layout.preferredWidth: isActive ? 40 : (hasWindows ? 20 : 0)

        color: isActive ? barRoot.colPeach : (hasWindows ? barRoot.colText : barRoot.colSurface2)
        radius: 15

        MouseArea {
          anchors.fill: parent
          onClicked: Hyprland.dispatch("workspace " + (index + 1))
        }
      }
    }
  }
}
