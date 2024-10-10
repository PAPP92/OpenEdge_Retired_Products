---
title: Overview of Common Utilities
---
# Overview of Common Utilities

The <SwmToken path="adetran/src/main/abl/adetran/common/_zipmgr.w" pos="25:6:6" line-data="  File: adetran/common/_zipmgr.w">`common`</SwmToken> directory in <SwmToken path="adetran/src/main/abl/adetran/common/_zipmgr.w" pos="25:4:4" line-data="  File: adetran/common/_zipmgr.w">`adetran`</SwmToken> contains various utility and helper files that are shared across different modules and functionalities. These shared resources help in maintaining consistency and reusability across the application, reducing redundancy and improving maintainability.

## Utility and Helper Files

Files like <SwmPath>[adetran/abl/adetran/common/\_prtstat.w](adetran/abl/adetran/common/_prtstat.w)</SwmPath>, <SwmPath>[adetran/abl/adetran/common/\_glsimpt.w](adetran/abl/adetran/common/_glsimpt.w)</SwmPath>, and <SwmPath>[adetran/abl/adetran/common/\_meter.w](adetran/abl/adetran/common/_meter.w)</SwmPath> are used to define and manage user interface components and dialogs. Other files such as <SwmPath>[adetran/abl/adetran/common/\_glsexpt.p](adetran/abl/adetran/common/_glsexpt.p)</SwmPath>, <SwmPath>[adetran/abl/adetran/common/\_bkupres.p](adetran/abl/adetran/common/_bkupres.p)</SwmPath>, and <SwmPath>[adetran/src/main/abl/adetran/common/\_trsexpt.p](adetran/src/main/abl/adetran/common/_trsexpt.p)</SwmPath> handle specific operations like exporting glossary data, managing backup and restore operations, and exporting translation data.

<SwmSnippet path="/adetran/src/main/abl/adetran/common/_zipmgr.w" line="13">

---

The file <SwmPath>[adetran/src/main/abl/adetran/common/\_zipmgr.w](adetran/src/main/abl/adetran/common/_zipmgr.w)</SwmPath> is an example of a utility file in the <SwmToken path="adetran/src/main/abl/adetran/common/_zipmgr.w" pos="25:6:6" line-data="  File: adetran/common/_zipmgr.w">`common`</SwmToken> directory. It can be used for managing zip operations.

```c
* use this file except in compliance with the License. You may obtain*
* a copy of the License at http://www.possenet.org/license.html      *
*                                                                    *
* Software distributed under the License is distributed on an "AS IS"*
* basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. You*
* should refer to the License for the specific language governing    *
* rights and limitations under the License.                          *
*                                                                    *
* Contributors:                                                      *
*                                                                    *
*********************************************************************/
/*------------------------------------------------------------------------
  File: adetran/common/_zipmgr.w
```

---

</SwmSnippet>

<SwmSnippet path="/adetran/src/main/abl/adetran/common/_trsexpt.p" line="10">

---

The file <SwmPath>[adetran/src/main/abl/adetran/common/\_trsexpt.p](adetran/src/main/abl/adetran/common/_trsexpt.p)</SwmPath> handles exporting translation data, showcasing how specific operations are managed within the <SwmToken path="adetran/src/main/abl/adetran/common/_trsexpt.p" pos="10:5:5" line-data="Procedure:    adetran/common/_trsexpt.p">`common`</SwmToken> directory.

```openedge abl
Procedure:    adetran/common/_trsexpt.p
```

---

</SwmSnippet>

<SwmSnippet path="/adetran/src/main/abl/adetran/common/_convert.p" line="10">

---

The file <SwmPath>[adetran/src/main/abl/adetran/common/\_convert.p](adetran/src/main/abl/adetran/common/_convert.p)</SwmPath> is called by other files like <SwmPath>[adetran/abl/adetran/common/\_import.w](adetran/abl/adetran/common/_import.w)</SwmPath> and <SwmPath>[adetran/abl/adetran/common/\_glsimpt.w](adetran/abl/adetran/common/_glsimpt.w)</SwmPath> to handle data conversion tasks.

```openedge abl
Procedure:    adetran/common/_convert.p
Author:       R. Ryan
Created:      9/95 
Updated:      9/95
Purpose:      Procedure for evaluating whether a codepage conversion 
              is available in convmap.dat.
Called By:    common/_import.w
              common/_glsimpt.w
```

---

</SwmSnippet>

<SwmSnippet path="/adetran/src/main/abl/adetran/common/_order.w" line="15">

---

The file <SwmPath>[adetran/src/main/abl/adetran/common/\_order.w](adetran/src/main/abl/adetran/common/_order.w)</SwmPath> is used by both VT and PM routines, illustrating the shared use of user interface components.

```c
Procedure:    adetran/common/_order.w
Author:       
Created:      
Updated:      11/96 SLK Replace IMAGE button's w/ labels to use Tooltip
Purpose:      VT and PM both use this routine 
```

---

</SwmSnippet>

## Common Endpoints

Common endpoints are procedures that are frequently used across different modules to perform specific tasks.

<SwmSnippet path="/adetran/abl/adetran/common/_sort.w" line="19">

---

### Sort Procedure

The <SwmToken path="adetran/abl/adetran/common/_sort.w" pos="13:17:17" line-data="*  kmcintos  June 3, 2005  Added ability to sort by MaxLength field  * ">`sort`</SwmToken>` `<SwmToken path="adetran/src/main/abl/adetran/common/_trsexpt.p" pos="10:0:0" line-data="Procedure:    adetran/common/_trsexpt.p">`Procedure`</SwmToken> is defined with input parameters <SwmToken path="adetran/abl/adetran/common/_sort.w" pos="19:6:6" line-data="DEFINE INPUT PARAMETER hSortProcedure     AS HANDLE     NO-UNDO.">`hSortProcedure`</SwmToken>, <SwmToken path="adetran/abl/adetran/common/_sort.w" pos="20:6:6" line-data="DEFINE INPUT PARAMETER CurrentMode        AS INTEGER    NO-UNDO. ">`CurrentMode`</SwmToken>, and <SwmToken path="adetran/abl/adetran/common/_sort.w" pos="21:6:6" line-data="DEFINE INPUT PARAMETER CurrentTool        AS CHARACTER  NO-UNDO. ">`CurrentTool`</SwmToken>. It is used to handle sorting operations within the application.

```c
DEFINE INPUT PARAMETER hSortProcedure     AS HANDLE     NO-UNDO.
DEFINE INPUT PARAMETER CurrentMode        AS INTEGER    NO-UNDO. 
DEFINE INPUT PARAMETER CurrentTool        AS CHARACTER  NO-UNDO. 
```

---

</SwmSnippet>

<SwmSnippet path="/adetran/abl/adetran/common/_meter.w" line="61">

---

### Meter Procedure

The <SwmToken path="adetran/abl/adetran/common/_meter.w" pos="19:11:11" line-data="Purpose:      Both tools use the meter persistent procedure to">`meter`</SwmToken>` `<SwmToken path="adetran/src/main/abl/adetran/common/_trsexpt.p" pos="10:0:0" line-data="Procedure:    adetran/common/_trsexpt.p">`Procedure`</SwmToken> is defined with an input parameter <SwmToken path="adetran/abl/adetran/common/_meter.w" pos="61:6:6" line-data="define input parameter CurWindow as widget-handle.">`CurWindow`</SwmToken> and shared variables like <SwmToken path="adetran/abl/adetran/common/_meter.w" pos="63:6:6" line-data="define shared var StopProcessing as logical no-undo.">`StopProcessing`</SwmToken>. It is used to manage progress meters in the user interface.

```c
define input parameter CurWindow as widget-handle.

define shared var StopProcessing as logical no-undo.
define var Result as logical no-undo.
define var i as integer no-undo.
define var LastValue as int.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==" repo-name="OpenEdge_Retired_Products"><sup>Powered by [Swimm](/)</sup></SwmMeta>
