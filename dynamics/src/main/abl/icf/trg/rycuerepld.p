/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*               PSC                                                  *
*                                                                    *
*********************************************************************/
TRIGGER PROCEDURE FOR REPLICATION-DELETE OF ryc_ui_event.

{af/sup/afreplicat.i  &TABLE-NAME   = "ryc_ui_event"
                      &TABLE-FLA    = "rycue"
                      &TABLE-PK     = "ui_event_obj"
                      &ACTION       = "DELETE"
                      &PRIMARY-FLA  = "rycso"
                      &PRIMARY-KEY  = "primary_smartobject_obj"
                      &VERSION-DATA = "YES"
}
