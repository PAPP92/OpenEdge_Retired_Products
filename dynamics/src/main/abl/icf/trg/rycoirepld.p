/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*               PSC                                                  *
*                                                                    *
*********************************************************************/
TRIGGER PROCEDURE FOR REPLICATION-DELETE OF ryc_object_instance.

{af/sup/afreplicat.i  &TABLE-NAME   = "ryc_object_instance"
                      &TABLE-FLA    = "rycoi"
                      &TABLE-PK     = "object_instance_obj"
                      &ACTION       = "DELETE"
                      &PRIMARY-FLA  = "rycso"
                      &PRIMARY-KEY  = "container_smartobject_obj"
                      &VERSION-DATA = "YES"
}
