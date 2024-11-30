# BOXT Tech Assessment

Author: Matt Bee

Run program from the directory the project is with this command:
```
ruby start.rb
```

## Brief

### Create a Toy Robot Simulator

The application is a simulation of a toy robot moving on a square tabletop, of dimensions **5 units x 5 units**

- There are no other obstructions on the table surface
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed
- You need to provide test data/results for the app & its logic
- The origin (0,0) of the board is the South West or bottom left corner of the board.

## Commands

- `PLACE X,Y,F`
- `MOVE`
- `LEFT`
- `RIGHT`
- `REPORT`

### PLACE (x_position, y_position, facing_direction)

`PLACE` will put the toy robot on the table in position `X`,`Y` and facing `NORTH`, `SOUTH`, `EAST` or `WEST`

### MOVE

`MOVE` will move the toy robot one unit forward in the direction it is currently facing

### LEFT
`LEFT` will rotate the robot 90 degrees clockwise the specified direction without changing the position of the robot

### RIGHT
`RIGHT` will rotate the robot 90 degrees clockwise the specified direction without changing the position of the robot

### REPORT

`REPORT` will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient
