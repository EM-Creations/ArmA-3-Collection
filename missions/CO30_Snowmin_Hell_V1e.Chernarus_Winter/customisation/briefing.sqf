#include "core\briefingCore.sqf" // DO NOT REMOVE

switch (side player) do { // Checks what team the player is on

  case resistance: { // If player is west they receive this briefing
    NEWTAB("I. Situation:")
    CO30 Snowmin Hell
    <br />
    <br />
    <font color='#FFFFFF' size='16' face='PuristaBold'>Blavakia, December 2016</font>
    <br />
    <br />
    It's the early days of the Blavakia Separatist movement, as supporters of the separatist movement you've irritated the royalist rulers to the point where they're attacking your <marker name='marker_village'>village</marker>!
    <br />
    <br />
    What you have is what you have.. noone is going to help you, the best you can hope for is that you hold out long enough for the royal forces to give up to not risk any more of their troops.
    ENDTAB;

    NEWTAB("A. Enemy Forces:")
    Mechanised Royal forces are bringing up a <marker name='marker_OPFOR'>convoy from the south</marker> to attack your <marker name='marker_village'>village</marker>. However, we can't be certain all enemy forces are located to the south.
    <br /><br />
    Our spotters have identified multiple UAZs (some of which are armed), Urals and possibly even a BMP!
    ENDTAB;

    NEWTAB("B. Friendly Forces:")
    <marker name='marker_village'>Blavakia separatist platoon</marker>
    <br />
    - 30 soldiers
    <br />
    - 2 x unarmed urals
    <br />
    Vehicles contain extra ammunition, equipment and medical supplies.
    ENDTAB;

    NEWTAB("II. Mission:")
    Your mission is to defend your village at all costs.
    ENDTAB;

    NEWTAB("III. Execution:")
    As per the commander's orders. Suggestion is to use the recon group for a hit and run attack on the enemy convoy.
    <br /><br />
    There's a 5 minute setup timer and you have a rather large setup area.
    <br /><br />
    Group leaders can fortify.
    ENDTAB;

    NEWTAB("IV. Service Support:")
    - Some assets which we're not yet sure of.. (Mystery Asset slots)
    ENDTAB;

    NEWTAB("V. Command & Signal:")
    Group leaders have a 343.
    <br /><br />
    343 (Short Range) Channels:
    <br />
    Platoon - 1
    ENDTAB;

  }; // End of east case

}; // End of switch

NEWTAB("VI. Mission notes:") //This is shown for everyone
<font color='#FFFFFF' size='16' face='PuristaBold'>Version:</font> 1e
<br />
Mission created by StatusRed.
<br />
<br />
<font color='#FFFFFF' size='14' face='PuristaBold'>End conditions:</font>
<br />
- Blavakia forces have a 90% casualty rate or higher
<br />
- You survive for 40 minutes
<br />
<br />
ENDTAB;

NEWTAB("Changelog") // This is shown for everyone
<font color='#FFF' size='14' face='RobotoCondensedBold'>Version 1e:</font>
<br />
- Removed gear being removed from modpack.
<br />
- Fixed old framework freezing on end conditions bug.
<br /><br />
<font color='#FFF' size='14' face='RobotoCondensedBold'>Version 1d:</font>
<br />
- Fixes.
<br /><br />
<font color='#FFF' size='14' face='RobotoCondensedBold'>Version 1c:</font>
<br />
- Updated loadouts.
<br /><br />
<font color='#FFF' size='14' face='RobotoCondensedBold'>Version 1b:</font>
<br />
- Removed enemies dying end condition
ENDTAB;

NEWTAB("Game Mastering") // This is shown for everyone
This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.
ENDTAB;

DISPLAYBRIEFING();
