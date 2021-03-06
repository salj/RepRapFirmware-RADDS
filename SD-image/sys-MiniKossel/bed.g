; Auto calibration routine for delta printers
; Before running this, you should have set up your zprobe X, Y and Z offsets to suit your build.
; This does a single iteration of auto calibration. Run this file multiple times until the values converge.
; Then transfer the values to your config.g file.

M561						; clear any bed transform, otherwise homing may be at the wrong height
G28							; home the printer

;*** Remove the following line if your Z probe does not need to be deployed
M98 Pdeployprobe.g			; deploy the mechanical Z probe

;*** Adjust the XY coordinates in the following M557 commands if necessary to suit your build and the position of the zprobe.
; These must place the probe near the base of the X (left) tower, Y (right) tower, Z (back) tower, and bed centre in that order.
G30 P0 X-71 Y-41 Z-99999
G30 P1 X71 Y-41 Z-99999
G30 P2 X0 Y82 Z-99999
G30 P3 X0 Y0 Z-99999 S4		; the S4 argument causes the endstops, delta radius and homed height to be adjusted

;*** Remove the following line if your Z probe does not need to be deployed
M98 Pretractprobe.g			; deploy the mechanical Z probe

G28							; Home the printer again so as to activate the new endstop adjustments
