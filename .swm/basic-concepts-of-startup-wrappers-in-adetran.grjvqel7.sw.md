---
title: Basic Concepts of Startup Wrappers in adetran
---
# Overview

Wrappers are used to initialize and configure the startup programs for different tools within the `adetran` directory. These wrappers ensure that the tools are properly initialized with the correct environment settings, such as the main program file and product name.

# Translation Manager Startup Wrapper

The file <SwmPath>[adetran/abl/wrappers/\_tran.p](adetran/abl/wrappers/_tran.p)</SwmPath> is the startup program for the Translation Manager tool. It sets parameters and includes necessary files for its execution. This ensures that the Translation Manager is configured correctly before it starts.

The <SwmPath>[adetran/abl/wrappers/\_tran.p](adetran/abl/wrappers/_tran.p)</SwmPath> file initializes the Translation Manager tool by setting parameters and including necessary files.

The <SwmPath>[adetran/abl/wrappers/\_vtran.p](adetran/abl/wrappers/_vtran.p)</SwmPath> file initializes the Visual Translator tool by setting parameters and including necessary files.

# Common Initialization Code

Both <SwmPath>[adetran/abl/wrappers/\_tran.p](adetran/abl/wrappers/_tran.p)</SwmPath> and <SwmPath>[adetran/abl/wrappers/\_vtran.p](adetran/abl/wrappers/_vtran.p)</SwmPath> include the `adewrap.i` file, which likely contains common initialization code shared between different tools. This shared code helps maintain consistency and reduces redundancy in the initialization process.

The `adewrap.i` file contains common initialization code that is included in both <SwmPath>[adetran/abl/wrappers/\_tran.p](adetran/abl/wrappers/_tran.p)</SwmPath> and <SwmPath>[adetran/abl/wrappers/\_vtran.p](adetran/abl/wrappers/_vtran.p)</SwmPath>.

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==" repo-name="OpenEdge_Retired_Products"><sup>Powered by [Swimm](/)</sup></SwmMeta>
