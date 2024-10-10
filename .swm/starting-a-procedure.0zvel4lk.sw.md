---
title: Starting a Procedure
---
This document will cover the process of starting a procedure, which includes:

1. Determining the procedure to start
2. Handling errors
3. Building the error list
4. Starting the manager.

Technical document: <SwmLink doc-title="Starting a Procedure">[Starting a Procedure](/.swm%5Cstarting-a-procedure.04vsf5gw.sw.md)</SwmLink>

# [Determining the Procedure to Start](https://app.swimm.io/repos/Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==/docs/04vsf5gw#determining-the-procedure-to-start)

The first step in starting a procedure is to determine which procedure needs to be started and how to start it. This involves parsing the procedure name provided by the user. The procedure name may include a mode, which specifies how the procedure should be executed. If no mode is specified, it defaults to 'EXEC'. This ensures that the procedure is executed in the default mode unless otherwise specified by the user.

# [Handling Errors](https://app.swimm.io/repos/Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==/docs/04vsf5gw#handling-errors)

After attempting to run the procedure, the system checks for any errors that may have occurred. If errors are found, an error message is generated. This message includes a detailed list of errors to help the user understand what went wrong. This step is crucial for providing feedback to the user and ensuring that any issues are promptly addressed.

# [Building the Error List](https://app.swimm.io/repos/Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==/docs/04vsf5gw#building-the-error-list)

The error list is constructed from the `ERROR-STATUS` object, which contains detailed information about any errors that occurred during the procedure execution. This list is used to provide comprehensive error messages to the user, helping them to diagnose and fix any issues. The detailed error list ensures that users have all the information they need to understand what went wrong and how to correct it.

# [Starting the Manager](https://app.swimm.io/repos/Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==/docs/04vsf5gw#starting-the-manager)

The final step is to start all the necessary managers before the session manager begins. These managers must be persistent and should not require any parameters. This ensures that all required managers are running and ready before the main session starts. By starting these managers first, we ensure that the system is properly initialized and ready to handle user requests.

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==" repo-name="OpenEdge_Retired_Products"><sup>Powered by [Swimm](/)</sup></SwmMeta>
