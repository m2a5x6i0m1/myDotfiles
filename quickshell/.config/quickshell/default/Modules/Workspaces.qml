import Quickshell.Hyprland
import QtQuick.Layouts
import QtQuick

RowLayout {
  anchors.horizontalCenter: parent.horizontalCenter
  anchors.verticalCenter: parent.verticalCenter
  height: parent.height

  Repeater {
    model: 10

    Rectangle {
      property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
      property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
      property bool hasWindows: workspace !== null

      width: 20
      height: 20

      radius: 10
      color: isActive ? "yellow" : (hasWindows ? "white" : " black")

      MouseArea {
        anchors.fill: parent
        onClicked: Hyprland.dispatch("workspace " + (index + 1))
      }
    }
  }
}
