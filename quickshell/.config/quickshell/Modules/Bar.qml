import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ShellRoot {
    id: root

    // Theme colors
    property color colBg: "#1a1b26"
    property color colFg: "#a9b1d6"
    property color colCyan: "#0db9d7"
    property color colPurple: "#ad8ee6"
    property color colMuted: "#444b6a"

    // Font
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                top: 2
                bottom: 0
                left: 2
                right: 2
            }

            implicitHeight: 23
            color: "transparent"

            Rectangle {
                anchors.fill: parent
                color: root.colBg
                radius: 4

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    Item {
                        Layout.rightMargin: 5
                    }

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
                                color: parent.isActive ? root.colCyan : (parent.hasWindows ? root.colCyan : root.colMuted)
                                font.pixelSize: root.fontSize
                                font.family: root.fontFamily
                                font.bold: true
                                anchors.centerIn: parent
                            }

                            Rectangle {
                                width: 20
                                height: 2
                                color: parent.isActive ? root.colPurple : root.colBg
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottom: parent.bottom
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
                        Layout.rightMargin: 6

                        Timer {
                            interval: 1000
                            running: true
                            repeat: true
                            onTriggered: clockText.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
                        }
                    }

                    Item {
                        Layout.rightMargin: 5
                    }
                }
            }
        }
    }
}
