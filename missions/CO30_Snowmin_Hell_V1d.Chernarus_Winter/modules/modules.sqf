// Modules are added by including the root.sqf which tells the framework where specific sections of the module should be loaded.

// Example:
//#include "start_text\root.sqf"

// Enabled modules by default, disable them by adding // in front.

#include "acre_setup\root.sqf"
#include "ai_drivers\root.sqf"
#include "anti_nd\root.sqf"
#include "auto_track_assets\root.sqf"
#include "disconnect_control\root.sqf"
#include "eg_spectator_mode\root.sqf"
#include "jip\root.sqf"
#include "self_actions\root.sqf"
#include "shot_count\root.sqf"
#include "start_on_safe\root.sqf"

// Additional modules that can be enabled by removing the "//"
// Note: Some of them require changing settings in their settings.sqf file!!
// Tip: To keep the size of the end mission to a minimum you can remove the directories of modules you're not using.


#include "ace_medical\root.sqf"
#include "cover_map\root.sqf"
#include "setup_timer\root.sqf"
#include "weapon_helper\root.sqf"
#include "headless_spawn\root.sqf"
