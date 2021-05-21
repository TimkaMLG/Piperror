# Piperror

Piperror is a coding game in which the player needs to set a sequence of commands so that the ball does not hit any obstacle.

## How to use

- You need to open the application and press the "Play" button. After that a scene with a choice of levels will appear.
- After you have selected a level and navigated to it, a scene with the level itself appears. The red line marks the terminal, which will have 5 fields, which correspond to time steps.

<img src="https://github.com/PanyshevAlex/Piperror/blob/master/pics/terminal.png?raw=true" height="600"/>

- For each obstacle in the terminal, its own sequence of actions is set (to set commands for a certain obstacle, you must click on this object).
- In each field, one of three commands is selected: turn clockwise, counterclockwise and stop. You can switch these commands by pressing the field again. It is necessary to achieve such a sequence of actions so that the ball does not crash into any of the obstacles.

## How to start a project

Installation
- Clone repository using ```git clone https://github.com/PanyshevAlex/Piperror.git```
- Open file ```piperror.xcodeproj```
- You must have a swift compiler with SpriteKit library connected, GamelayKit
- Building with Xcode

## Documentation

- File "Button.swift" - implementation of a button by creating a separate class "ButtonNode". The "handler" function responds to a button press. The "texture" method inserts the desired image.
- The file "barrage.swift" creates an obstacle class which is added to the "Gamescene(number).swift"
- The file "terminal.swift" creates a terminal template that implements the transfer of player commands. Each obstacle creates a prototype of such a term.
