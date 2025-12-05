import Quickshell // for PanelWindow
import QtQuick // for Text

PanelWindow {
    anchors {
        right: true
        bottom: true
        top: true
    }
    margins {
        right: 25
        bottom: 90
        top: 90
    }
    implicitWidth: 400
    exclusiveZone: 0
    focusable: true
}
