/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*               PSC                                                  *
*                                                                    *
*********************************************************************/
TRIGGER PROCEDURE FOR REPLICATION-CREATE OF gsm_menu_item.

{af/sup/afreplicat.i  &TABLE-NAME   = "gsm_menu_item"
                      &TABLE-FLA    = "gsmmi"
                      &TABLE-PK     = "menu_item_obj"
                      &ACTION       = "CREATE"
                      
                      
                      &VERSION-DATA = "YES"
}
