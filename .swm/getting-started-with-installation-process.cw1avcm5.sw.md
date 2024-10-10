---
title: Getting Started with Installation Process
---
# Getting Started with Installation Process

The installation process in Dynamics involves setting up various components and configurations necessary for the software to function correctly. This document will guide you through the essential steps, including the deployment of smart objects, creating and configuring windows and frames, defining temporary tables, and creating procedures for installation tasks.

## Deployment of Smart Objects

Smart objects are defined in XML files with metadata such as object filenames, descriptions, paths, and other attributes. These objects are crucial for the installation process.

<SwmSnippet path="/dynamics/src/main/abl/install/prc/inuimngrp.p" line="1302">

---

This line in the file <SwmPath>[dynamics/src/main/abl/install/prc/inuimngrp.p](dynamics/src/main/abl/install/prc/inuimngrp.p)</SwmPath> shows how images are set during the deployment of smart objects.

```openedge abl
    /* If the any of the images are set, use the new images */
```

---

</SwmSnippet>

`1302 `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:1:1" line-data="    /* If the any of the images are set, use the new images */">`/*`</SwmToken>` If `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:5:5" line-data="    /* If the any of the images are set, use the new images */">`the`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:7:7" line-data="    /* If the any of the images are set, use the new images */">`any`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:9:9" line-data="    /* If the any of the images are set, use the new images */">`of`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:5:5" line-data="    /* If the any of the images are set, use the new images */">`the`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:13:13" line-data="    /* If the any of the images are set, use the new images */">`images`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:15:15" line-data="    /* If the any of the images are set, use the new images */">`are`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:17:17" line-data="    /* If the any of the images are set, use the new images */">`set`</SwmToken>`, `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:20:20" line-data="    /* If the any of the images are set, use the new images */">`use`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:5:5" line-data="    /* If the any of the images are set, use the new images */">`the`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:24:24" line-data="    /* If the any of the images are set, use the new images */">`new`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:13:13" line-data="    /* If the any of the images are set, use the new images */">`images`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:28:28" line-data="    /* If the any of the images are set, use the new images */">`*/`</SwmToken>

## Creating and Configuring Windows and Frames

The installation process includes creating and configuring windows and frames using Progress AppBuilder. These configurations are defined in <SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="11:10:11" line-data="/* Actions: af/cod/aftemwizcw.w ? ? ? ? */">`.w`</SwmToken> files.

`22 `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="40:1:1" line-data="  Description:  DCU User Interface Manager">`Description`</SwmToken>`: Installation `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="447:31:31" line-data="      /* Set the database physical name session paramater so that this is shown in the UI as well */">`UI`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="631:22:22" line-data="  Purpose:     Creates all the buttons and associates them with the frame.">`frame`</SwmToken>` include`

## Defining Temporary Tables

Temporary tables and other data structures are defined to manage the installation parameters and states. These tables are essential for tracking the progress and state of the installation.

`1496 `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:1:1" line-data="    /* If the any of the images are set, use the new images */">`/*`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1496:3:3" line-data="  /* Associate each of the temp-table buffers that we use for the setup with">`Associate`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="663:3:3" line-data="  FOR EACH bttControl">`EACH`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:9:9" line-data="    /* If the any of the images are set, use the new images */">`of`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:5:5" line-data="    /* If the any of the images are set, use the new images */">`the`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="87:2:4" line-data="DEFINE TEMP-TABLE ttSetup NO-UNDO RCODE-INFORMATION">`TEMP-TABLE`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1496:15:15" line-data="  /* Associate each of the temp-table buffers that we use for the setup with">`buffers`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="21:21:21" line-data="/* This has to go above the definitions sections, as that is what it modifies.">`that`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="450:13:13" line-data="      /* Clear the connection parameters as we do not need these if the database is connected already . ">`we`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:20:20" line-data="    /* If the any of the images are set, use the new images */">`use`</SwmToken>` for `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:5:5" line-data="    /* If the any of the images are set, use the new images */">`the`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1159:4:4" line-data="    messageBox(&quot;Setup record not found&quot;:U,">`Setup`</SwmToken>` with`

## Creating Procedures for Installation Tasks

Procedures are created to handle specific installation tasks, such as applying updates and managing user interfaces. These procedures ensure that the installation process runs smoothly and efficiently.

`473 `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="450:13:13" line-data="      /* Clear the connection parameters as we do not need these if the database is connected already . ">`we`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="473:3:3" line-data="          we should use this connection */">`should`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="1302:20:20" line-data="    /* If the any of the images are set, use the new images */">`use`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="7:15:15" line-data="/* All rights reserved.  No part of this program or document */">`this`</SwmToken>` `<SwmToken path="dynamics/src/main/abl/install/prc/inuimngrp.p" pos="415:11:11" line-data="               1) connect_params_&lt;dbname&gt; - connection parameters for the ">`connection`</SwmToken>

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==" repo-name="OpenEdge_Retired_Products"><sup>Powered by [Swimm](/)</sup></SwmMeta>
