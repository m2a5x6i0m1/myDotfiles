import Quickshell     // For PanelWindow
import Quickshell.Io  // For process
import QtQuick        // For Text

Scope {         // Define a scope with its own id so we can refernce time outside of Text class by defining its existence ahead

  id: shellRoot
  property string time

  Variants {
    model: Quickshell.screens;
    delegate: Component {
  
      PanelWindow {
        required property var modelData
        screen: modelData

        anchors {
          top: true
          left: true
          right: true
        }
      
        Text {
          anchors.centerIn: parent  
          text: shellRoot.time
        }

        implicitHeight: 25
      }
    }
  }

  Process {
    id: dateProc
    running: true                              // Run the command immediately
    command: ["date", "+%B %dth %Y %H:%M:%S"]  // The command it will run, every argument is its own string

    // Use StdioCollector to retrieve the text the process sends to stdout.
    stdout: StdioCollector { 
      onStreamFinished: shellRoot.time = this.text
    }
  }

  Timer {
    running: true
    repeat: true
    interval: 1000
    onTriggered: dateProc.running = true   // When timer is triggered, run process
  }
}
