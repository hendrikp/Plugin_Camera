Camera Plugin for CryEngine SDK
===============================
New Flexible Camera System for CryEngine.

Experimental, in search for maintainer.

For redistribution please see license.txt.

Installation / Integration
==========================
Extract the files to your Cryengine SDK Folder so that the Code and BinXX/Plugins directory match up.

The plugin manager will automatically load up the plugin when the game/editor is restarted or if you directly load it.

Flownodes
=========
* ```Plugin_Camera:PlayerCamera```

![Info Graphic](https://raw.github.com/hendrikp/Plugin_Camera/master/readme.png)

Using the Third Person Camera Zoom
==================================

The camera now has a very basic zoom feature in third person mode which will allow you to zoom back and forth from your target.
In order to use this zoom you will need to make a few small changes to your <game>\gameSDK\libs\config\defaultprofile.xml file.
If you haven't extracted the contents of the GameData.pak file, you will not have this file in your filesystem. You can extract just
this file from the .pak if needed.

It is usual in RPG style games, and most others with a 3rd person camera to map the mouse scroll wheel to zooming in and out. The FreeSDK
maps those features to weapon swap commands by default. This guide assumes you are happy to remove that as the default.

Look for a pair of lines similar to:

	<action name="nextitem" onPress="1" keyboard="mwheel_up"/>
	<action name="previtem" onPress="1" keyboard="mwheel_down"/>

and remove them. Those are responsible for mapping the mouse wheel to the weapon swapping feature.

Now find the tag:

	<actionmap name="player">

and inside this add the following two lines:

	<action name="tpv_zoom_in" onPress="1" keyboard="mwheel_up" />
	<action name="tpv_zoom_out" onPress="1" keyboard="mwheel_down" />

That will map the mouse wheel movements to camera zoom movements. Now find the tag:

	<actionmap name="vehicle_general">

and inside this add the following two lines:

	<action name="v_tpv_zoom_in" onPress="1" keyboard="mwheel_up" />
	<action name="v_tpv_zoom_out" onPress="1" keyboard="mwheel_down" />

This will map your mouse scroll wheel to zoom functions when inside a vehicle.

That's all there is to it!
