/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*               PSC                                                  *
*                                                                    *
*********************************************************************/
TRIGGER PROCEDURE FOR REPLICATION-DELETE OF ryc_relationship.

{af/sup/afreplicat.i  &TABLE-NAME   = "ryc_relationship"
                      &TABLE-FLA    = "rycre"
                      &TABLE-PK     = "relationship_obj"
                      &ACTION       = "DELETE"
                      
                      
                      &VERSION-DATA = "YES"
}
