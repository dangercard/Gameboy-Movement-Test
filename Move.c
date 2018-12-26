/*
  Alejandro Deloach
  Gameboy movement test
  Dec. 2018.
*/

#include <gb/gb.h> // Include Gameboy Library
#include "face.c" // Include Sprite data

// Position Globals:
int lypos = 75 ;
int lxpos = 75;
int rxpos = 82;

// Main:
void main(){

  SPRITES_8x16;  // Load 8x8 sprites two at a time (left half of face):
  set_sprite_data(0,4,face); // Push 4 8x8 sprites from face array into our sprite array.
  set_sprite_tile(0,0); // Set the left half in the first position.
  move_sprite(0,75,75); // Set screen position of the left half.
  set_sprite_tile(1, 2); // Set second right half in the secon position.
  move_sprite(1, 75 + 8, 75); // Set screen position of the right half.
  SHOW_SPRITES; // Display Sprites.

    // While running:
    while(1){
      // Constantly check the Joypad:
      switch (joypad()) {

        case J_UP: // If Up is pressed:
          move_sprite(0,lxpos,lypos - 8); // Change left half position.
          move_sprite(1,rxpos,lypos - 8); // Change right half position.
          lypos -= 8; // Update global vertical position variable.
          delay(300); // Wait before checking on the joypad.
          break;

        case J_DOWN:
          move_sprite(0,lxpos,lypos + 8); // Change left half position.
          move_sprite(1,rxpos,lypos + 8); // Change right half position.
          lypos += 8; // Update global vertical position variable.
          delay(300); // Wait before checking on the joypad.
          break;

        case J_LEFT:
          move_sprite(0,lxpos - 8,lypos); // Change left half position.
          move_sprite(1,rxpos - 8,lypos); // Change right half position.
          lxpos -= 8;  // Update global horizontal position variables.
          rxpos -= 8;
          delay(300); // Wait before checking on the joypad.
          break;

        case J_RIGHT:
          move_sprite(0,lxpos + 8,lypos); // Change left half position.
          move_sprite(1,rxpos + 8,lypos); // Change right half position.
          lxpos += 8; // Update global horizontal position variables.
          rxpos += 8;
          delay(300); // Wait before checking on the joypad.
          break;

        default:
          break;
      }
    }
}
