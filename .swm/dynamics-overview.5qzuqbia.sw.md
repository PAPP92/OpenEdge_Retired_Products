---
title: Dynamics Overview
---
# Overview

Dynamics is an open-source version of OpenEdge Dynamics. It includes source code, database definitions, and build scripts. The software is released under the Apache 2.0 license. Progress Software does not support this package, and pull requests are likely to be rejected or ignored.

# Building Dynamics

To build the Dynamics source code, use the provided build scripts. The output will be located in the build directory, and the build process will generate the necessary database files.

# Running Dynamics

After building the procedure library, add it to your application propath. Use the provided database to create deltas for any schema changes that need to be applied.

# Getting Help

For help and instructions, visit the Progress documentation website. Note that Dynamics is not distributed with OpenEdge 12, so you may need to refer to the OpenEdge 11 help content.

# Dynamics Endpoints

Dynamics includes several endpoints that facilitate various functionalities. Below are some key endpoints and their descriptions.

## <SwmToken path="dynamics/src/main/abl/db/icf/dfd/icfdb101100full.df" pos="43:5:5" line-data="ADD TABLE &quot;gsc_custom_procedure&quot;">`gsc_custom_procedure`</SwmToken>

The <SwmToken path="dynamics/src/main/abl/db/icf/dfd/icfdb101100full.df" pos="43:5:5" line-data="ADD TABLE &quot;gsc_custom_procedure&quot;">`gsc_custom_procedure`</SwmToken> table provides a mechanism to define alternate procedures for custom-specific business logic. It contains a list of all system-supported procedures that satisfy these business rules, categorized by entity and procedure type. The programs that these procedures exist in will run persistently when required.

<SwmSnippet path="/dynamics/src/main/abl/db/icf/dfd/icfdb101100full.df" line="43">

---

This code snippet defines the <SwmToken path="dynamics/src/main/abl/db/icf/dfd/icfdb101100full.df" pos="43:5:5" line-data="ADD TABLE &quot;gsc_custom_procedure&quot;">`gsc_custom_procedure`</SwmToken> table, which is used for backward compatibility and will likely be replaced with flows and events in the future.

```df
ADD TABLE "gsc_custom_procedure"
  AREA "Schema Area"
  DESCRIPTION "This table is contained in Dynamics for backward compatibility and will likely be dropped at a later stage. It will be replaced with flows and events when these are fully implemented.

The purpose of this table is to provide a mechanism to define alternate procedures for custom specific business logic.

This table contains a list of all the system supported procedures that satisfy these business rules, categorised by entity and procedure type. A number of variations for each process may exist - the procedure to use in each case must be selected from this list.

The programs that these procedures exist in will run persistently when required."
```

---

</SwmSnippet>

## <SwmToken path="dynamics/src/main/abl/db/icf/dfd/icfdb101100full.df" pos="160:5:5" line-data="ADD TABLE &quot;gsc_dataset_entity&quot;">`gsc_dataset_entity`</SwmToken>

The <SwmToken path="dynamics/src/main/abl/db/icf/dfd/icfdb101100full.df" pos="160:5:5" line-data="ADD TABLE &quot;gsc_dataset_entity&quot;">`gsc_dataset_entity`</SwmToken> table contains a complete list of tables that need to be deployed with the dataset. One of the tables in the dataset must be marked as primary, <SwmToken path="dynamics/src/main/abl/db/icf/dfd/icfdb101100full.df" pos="164:25:27" line-data="One of the tables in the dataset must be marked as primary, i.e. the main table in the dataset. The join information between the tables must also be specified.">`i.e`</SwmToken>., the main table in the dataset. The join information between the tables must also be specified. The data in this table can be filtered using the filter where clause.

<SwmSnippet path="/dynamics/src/main/abl/db/icf/dfd/icfdb101100full.df" line="160">

---

This code snippet defines the <SwmToken path="dynamics/src/main/abl/db/icf/dfd/icfdb101100full.df" pos="160:5:5" line-data="ADD TABLE &quot;gsc_dataset_entity&quot;">`gsc_dataset_entity`</SwmToken> table, which includes triggers for various operations such as create, delete, and replication.

```df
ADD TABLE "gsc_dataset_entity"
  AREA "Schema Area"
  DESCRIPTION "This table contains a complete list of tables that need to be deployed with the  dataset.

One of the tables in the dataset must be marked as primary, i.e. the main table in the dataset. The join information between the tables must also be specified.

The data in this table can be filtered using the filter where clause."
  DUMP-NAME "gscde"
  TABLE-TRIGGER "CREATE" OVERRIDE PROCEDURE "icf/trg/gscdetrigc.p" CRC "?" 
  TABLE-TRIGGER "DELETE" OVERRIDE PROCEDURE "icf/trg/gscdetrigd.p" CRC "?" 
  TABLE-TRIGGER "REPLICATION-CREATE" OVERRIDE PROCEDURE "icf/trg/gscdereplc.p" CRC "?" 
  TABLE-TRIGGER "REPLICATION-DELETE" OVERRIDE PROCEDURE "icf/trg/gscderepld.p" CRC "?" 
  TABLE-TRIGGER "REPLICATION-WRITE" OVERRIDE PROCEDURE "icf/trg/gscdereplw.p" CRC "?" 
  TABLE-TRIGGER "WRITE" OVERRIDE PROCEDURE "icf/trg/gscdetrigw.p" CRC "?" 

ADD FIELD "dataset_entity_obj" OF "gsc_dataset_entity" AS decimal 
  FORMAT "->>>>>>>>>>>>>>>>>9.999999999"
  INITIAL "0"
  LABEL "Dataset entity obj"
  POSITION 2
  MAX-WIDTH 24
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==" repo-name="OpenEdge_Retired_Products"><sup>Powered by [Swimm](/)</sup></SwmMeta>
