/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*               PSC                                                  *
*                                                                    *
*********************************************************************/

TRIGGER PROCEDURE FOR CREATE OF ryc_smartobject .

/* Created automatically using ERwin ICF Trigger template db/af/erw/afercustrg.i
   Do not change manually. Customisations to triggers should be placed in separate
   include files pulled into the trigger. ICF auto generates write trigger custom
   include files. Delete or create customisation include files need to be created
   manually. Be sure to put the hook in ERwin directly so as not to have you changes
   overwritten.
   User defined Macro (UDP) Summary (case sensitive)
   ryc_smartobject           Expands to full table name, e.g. gsm_user
   %TableFLA            Expands to table unique code, e.g. gsmus
   %TableObj            If blank or not defined expands to table_obj with no prefix (framework standard)
                        If defined, uses this field as the object field
                        If set to "none" then indicates table does not have an object field
   XYZ                  Do not define so we can compare against an empty string

   See docs for explanation of replication macros 
*/   

&SCOPED-DEFINE TRIGGER_TABLE ryc_smartobject
&SCOPED-DEFINE TRIGGER_FLA rycso
&SCOPED-DEFINE TRIGGER_OBJ smartobject_obj


DEFINE BUFFER lb_table FOR ryc_smartobject.      /* Used for recursive relationships */
DEFINE BUFFER lb1_table FOR ryc_smartobject.     /* Used for lock upgrades */

DEFINE BUFFER o_ryc_smartobject FOR ryc_smartobject.

/* Standard top of CREATE trigger code */
{af/sup/aftrigtopc.i}

  



/* Generated by ICF ERwin Template */
/* ryc_customization_result customizes ryc_smartobject ON CHILD INSERT SET NULL */
IF NOT(CAN-FIND(FIRST ryc_customization_result WHERE
    ryc_smartobject.customization_result_obj = ryc_customization_result.customization_result_obj)) THEN
  DO:
    
    ASSIGN ryc_smartobject.customization_result_obj = 0 .
  END.



/* Generated by ICF ERwin Template */
/* gsc_product_module contains ryc_smartobject ON CHILD INSERT RESTRICT */
IF 
    ( ryc_smartobject.product_module_obj <> 0 ) THEN
  DO:
    IF NOT(CAN-FIND(FIRST gsc_product_module WHERE
        ryc_smartobject.product_module_obj = gsc_product_module.product_module_obj)) THEN
        DO:
          /* Cannot create child because parent does not exist ! */
          ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 102 lv-include = "ryc_smartobject|gsc_product_module":U.
          RUN error-message (lv-errgrp, lv-errnum, lv-include).
        END.
    
    
  END.

/* Generated by ICF ERwin Template */
/* gsc_object_type defines ryc_smartobject ON CHILD INSERT RESTRICT */
IF 
    ( ryc_smartobject.object_type_obj <> 0 ) THEN
  DO:
    IF NOT(CAN-FIND(FIRST gsc_object_type WHERE
        ryc_smartobject.object_type_obj = gsc_object_type.object_type_obj)) THEN
        DO:
          /* Cannot create child because parent does not exist ! */
          ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 102 lv-include = "ryc_smartobject|gsc_object_type":U.
          RUN error-message (lv-errgrp, lv-errnum, lv-include).
        END.
    
    
  END.

/* Generated by ICF ERwin Template */
/* ryc_layout organises ryc_smartobject ON CHILD INSERT SET NULL */
IF NOT(CAN-FIND(FIRST ryc_layout WHERE
    ryc_smartobject.layout_obj = ryc_layout.layout_obj)) THEN
  DO:
    
    ASSIGN ryc_smartobject.layout_obj = 0 .
  END.








ASSIGN ryc_smartobject.{&TRIGGER_OBJ} = getNextObj() NO-ERROR.
IF ERROR-STATUS:ERROR THEN 
DO:
    ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 31 lv-include = "ryc_smartobject|the specified object number.  Please ensure your database sequences have been set correctly":U.
    RUN error-message (lv-errgrp, lv-errnum, lv-include).
END.







/* Update Audit Log */
IF CAN-FIND(FIRST gsc_entity_mnemonic
            WHERE gsc_entity_mnemonic.entity_mnemonic = 'rycso':U
              AND gsc_entity_mnemonic.auditing_enabled = YES) THEN
  RUN af/app/afauditlgp.p (INPUT "CREATE":U, INPUT "rycso":U, INPUT BUFFER ryc_smartobject:HANDLE, INPUT BUFFER o_ryc_smartobject:HANDLE).

/* Standard bottom of CREATE trigger code */
{af/sup/aftrigendc.i}


/* Place any specific CREATE trigger customisations here */



