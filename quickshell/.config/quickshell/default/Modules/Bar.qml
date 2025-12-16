import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ShellRoot {
  id: root

  // Theme colors
  property color colBg: "#1a1b26"
  property color colFg: "#a9b1d6"
  property color colMuted: "#444b6a"
  property color colCyan: "#0db9d7"

  // Font
  property string fontFamily: "JetBrainsMono Nerd Font"
  property int fontSize: 14

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
        left: 4
        right: 4
      }

      implicitHeight: 30
      color: "transparent"

      Rectangle {
        anchors.fill: parent
        color: root.colBg
        radius: 5

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
                color: parent.isActive ? root.colCyan : (parent.hasWindows ? root.colFg : root.colMuted)
                font.pixelSize: root.fontSize
                font.family: root.fontFamily
                font.bold: true
                anchors.centerIn: parent
              }

              MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
              }
            }
          }

          Item {
            Layout.fillWidth: true
          }

          Text {
            id: clockText
            text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
            color: root.colCyan
            font.pixelSize: root.fontSize
            font.family: root.fontFamily
            font.bold: true
            Layout.rightMargin: 8

            Timer {
              interval: 1000
              running: true
              repeat: true
              onTriggered: clockText.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
            }
          }
        }
      }
    }
  }
}
