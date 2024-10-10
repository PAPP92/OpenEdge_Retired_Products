---
title: Basic Concepts of Translation Manager Procedures
---
# Overview of Translation Manager Procedures

The 'pm' directory in 'adetran' contains several key procedures and files related to the Translation Manager. These procedures are essential for the functionality and management of the Translation Manager.

# Main Backbone Program

The <SwmPath>[adetran/abl/adetran/pm/\_pmmain.p](adetran/abl/adetran/pm/_pmmain.p)</SwmPath> file serves as the main backbone program for the Translation Manager. It initializes various shared variables and runs essential procedures to ensure the smooth operation of the Translation Manager.

<SwmSnippet path="/adetran/abl/adetran/pm/_pmmain.p" line="9">

---

The <SwmPath>[adetran/abl/adetran/pm/\_pmmain.p](adetran/abl/adetran/pm/_pmmain.p)</SwmPath> file is crucial as it initializes shared variables and runs essential procedures for the Translation Manager.

```openedge abl
Procedure:    adetran/_pmmain.p
Author:       R. Ryan
Created:      1/95
Updated:      Added CurrentMode=6 Subset for sorting purposes
Purpose:      Translation Manager main backbone program. This is
```

---

</SwmSnippet>

# Handling Statistics

The <SwmPath>[adetran/abl/adetran/pm/\_pmstats.p](adetran/abl/adetran/pm/_pmstats.p)</SwmPath> file is responsible for handling the statistics tab. It repopulates the underlying <SwmToken path="adetran/abl/adetran/pm/_pmmain.p" pos="462:2:4" line-data="DEFINE TEMP-TABLE PersistProcs">`TEMP-TABLE`</SwmToken> with statistical data each time the tab is selected, ensuring that the statistics are up-to-date.

<SwmSnippet path="/adetran/abl/adetran/pm/_pmstats.p" line="9">

---

The <SwmPath>[adetran/abl/adetran/pm/\_pmstats.p](adetran/abl/adetran/pm/_pmstats.p)</SwmPath> file handles the statistics tab by repopulating the <SwmToken path="adetran/abl/adetran/pm/_pmmain.p" pos="462:2:4" line-data="DEFINE TEMP-TABLE PersistProcs">`TEMP-TABLE`</SwmToken> with statistical data each time the tab is selected.

```openedge abl
Procedure:    adetran/pm/_pmstats.p
Author:       R. Ryan
Created:      1/95 
Updated:      9/95
		12/96 SLK Long Filename
Purpose:      Statistics tab procedure
Background:   This is a persistent procedure that is run from
              pm/_pmmain.p *only* after a database is connected.
```

---

</SwmSnippet>

# Managing Procedure Tab

The <SwmPath>[adetran/abl/adetran/pm/\_pmprocs.w](adetran/abl/adetran/pm/_pmprocs.w)</SwmPath> file manages the Procedure Tab folder within the Translation Manager. It includes setting the sensitivity of buttons and handling temporary files, ensuring that the Procedure Tab functions correctly.

<SwmSnippet path="/adetran/abl/adetran/pm/_pmprocs.w" line="13">

---

The <SwmPath>[adetran/abl/adetran/pm/\_pmprocs.w](adetran/abl/adetran/pm/_pmprocs.w)</SwmPath> file manages the Procedure Tab folder by setting the sensitivity of buttons and handling temporary files.

```c
Procedure:    adetran/pm/_pmprocs.w
Author:       R. Ryan
Created:      1/95 
Updated:      9/95
		11/96 SLK lc/caps
			entry ","
		01/97 SLK Restored image area = image size
Purpose:      Translation Manager's Procedure Tab folder
Background:   This is a persistent procedure that is run from
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==" repo-name="OpenEdge_Retired_Products"><sup>Powered by [Swimm](/)</sup></SwmMeta>
