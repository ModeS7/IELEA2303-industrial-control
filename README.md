# Industrial Control System with CDP Studio

Motor control and signal processing application built with CDP Studio (Kongsberg Digital), featuring both a console-based control backend and a Qt-based GUI for real-time monitoring.

## Course Information

- **Course:** [IELEA2303 - Industrielle styresystemer med prosjekt](https://www.ntnu.edu/studies/courses/IELEA2303)
- **Institution:** NTNU - Norwegian University of Science and Technology
- **Semester:** Spring 2022

## Overview

This project implements an industrial control system using the CDP Studio framework (v4.10). CDP Studio is a component-based industrial automation platform by Kongsberg Digital that uses declarative XML configuration for system design and Qt for GUI applications.

The system consists of two applications:

1. **Console Application** — Headless control backend running a sine wave generator feeding into an evaluation-based lamp control logic (`Input < 1 → OFF, Input < 10 → ON, else → BRIGHT`)
2. **GUI Application** — Qt-based graphical interface bridging CDP signals to a visual dashboard via the CDP2Qt component, allowing real-time monitoring and interaction

The project also explored alternative industrial platforms (CODESYS v2.3, Beckhoff e!Cockpit) for PLC-based motor control with Modbus and OPC-UA communication.

## Project Structure

```
.
├── cdp_studio/
│   ├── system.pro                         # Top-level CDP system project
│   ├── config.xml                         # System configuration
│   ├── console_app/                       # Headless control application
│   │   ├── CDPMain.cpp
│   │   ├── Libraries.h
│   │   ├── console_app.pro
│   │   └── Application/
│   │       ├── Application.xml            # Component wiring & evaluation logic
│   │       └── Components/
│   │           ├── CDP.xml
│   │           ├── CDP/                   # Framework component configs (9 XMLs)
│   │           └── Sine.xml
│   ├── gui_app/                           # Qt GUI application
│   │   ├── CDPMain.cpp
│   │   ├── Libraries.h
│   │   ├── gui_app.pro
│   │   └── Application/
│   │       ├── Application.xml
│   │       ├── mainwidget.ui              # Qt Designer UI layout
│   │       ├── qt.conf
│   │       └── Components/
│   │           ├── CDP.xml
│   │           ├── CDP/                   # Framework component configs (9 XMLs)
│   │           └── CDP2Qt.xml             # CDP-to-Qt signal bridge
│   └── opcua_app/                         # OPC-UA enabled application
│       ├── CDPMain.cpp
│       ├── Libraries.h
│       ├── opcua_app.pro
│       └── Application/
│           ├── Application.xml
│           └── Components/
│               ├── CDP.xml
│               ├── CDP/
│               ├── OPC-UA-Server.xml      # OPC-UA server component
│               └── Sine.xml
├── codesys/                               # CODESYS v2.3 PLC programs
│   ├── 881-test.pro                       # Stepper motor test program
│   ├── motorCS2.3.pro                     # Motor control program
│   ├── motorCS2.3+sim.pro                 # Motor control with simulator
│   └── visual.pro                         # Visualization program
├── ecockpit/                              # Beckhoff e!Cockpit PLC configs
│   ├── modbus_test.xml                    # Modbus communication test
│   └── opc_ua_test.xml                    # OPC-UA communication test
└── .gitignore
```

## Tech Stack

- **CDP Studio v4.10** (Kongsberg Digital) — Industrial automation framework
- **Qt** (LGPL) — GUI framework, build system (qmake)
- **C++** — Application entry points
- **XML** — Declarative component configuration
- **OPC-UA / Modbus** — Industrial communication protocols (explored in project)

## How to Run

### Prerequisites

- [CDP Studio](https://cdpstudio.com/) v4.10 or later installed
- Qt development tools (bundled with CDP Studio)

### Building

1. Open `cdp_studio/system.pro` in CDP Studio
2. Build the system (both console_app and gui_app are built as subdirectories)
3. Run the console application for headless control, or the GUI application for visual monitoring

### Configuration

The control logic is defined declaratively in `Application.xml`. The sine wave parameters (frequency, amplitude, offset) can be adjusted in `Components/Sine.xml`. The lamp control threshold logic is configured as an `Automation.Evaluate<double>` expression.
