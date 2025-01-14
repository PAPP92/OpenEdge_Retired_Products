/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*               PSC                                                  *
*                                                                    *
*********************************************************************/

TRIGGER PROCEDURE FOR CREATE OF gst_dataset_file .

/* Created automatically using ERwin ICF Trigger template db/af/erw/afercustrg.i
   Do not change manually. Customisations to triggers should be placed in separate
   include files pulled into the trigger. ICF auto generates write trigger custom
   include files. Delete or create customisation include files need to be created
   manually. Be sure to put the hook in ERwin directly so as not to have you changes
   overwritten.
   User defined Macro (UDP) Summary (case sensitive)
   gst_dataset_file           Expands to full table name, e.g. gsm_user
   %TableFLA            Expands to table unique code, e.g. gsmus
   %TableObj            If blank or not defined expands to table_obj with no prefix (framework standard)
                        If defined, uses this field as the object field
                        If set to "none" then indicates table does not have an object field
   XYZ                  Do not define so we can compare against an empty string

   See docs for explanation of replication macros 
*/   

&SCOPED-DEFINE TRIGGER_TABLE gst_dataset_file
&SCOPED-DEFINE TRIGGER_FLA gstdf
&SCOPED-DEFINE TRIGGER_OBJ dataset_file_obj


DEFINE BUFFER lb_table FOR gst_dataset_file.      /* Used for recursive relationships */
DEFINE BUFFER lb1_table FOR gst_dataset_file.     /* Used for lock upgrades */

DEFINE BUFFER o_gst_dataset_file FOR gst_dataset_file.

/* Standard top of CREATE trigger code */
{af/sup/aftrigtopc.i}

  



/* Generated by ICF ERwin Template */
/* gst_deployment consists of gst_dataset_file ON CHILD INSERT SET NULL */
IF NOT(CAN-FIND(FIRST gst_deployment WHERE
    gst_dataset_file.deployment_obj = gst_deployment.deployment_obj)) THEN
  DO:
    
    ASSIGN gst_dataset_file.deployment_obj = 0 .
  END.



/* Generated by ICF ERwin Template */
/* gsc_deploy_dataset generated gst_dataset_file ON CHILD INSERT RESTRICT */
IF 
    ( gst_dataset_file.deploy_dataset_obj <> 0 ) THEN
  DO:
    IF NOT(CAN-FIND(FIRST gsc_deploy_dataset WHERE
        gst_dataset_file.deploy_dataset_obj = gsc_deploy_dataset.deploy_dataset_obj)) THEN
        DO:
          /* Cannot create child because parent does not exist ! */
          ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 102 lv-include = "gst_dataset_file|gsc_deploy_dataset":U.
          RUN error-message (lv-errgrp, lv-errnum, lv-include).
        END.
    
    
  END.






ASSIGN gst_dataset_file.{&TRIGGER_OBJ} = getNextObj() NO-ERROR.
IF ERROR-STATUS:ERROR THEN 
DO:
    ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 31 lv-include = "gst_dataset_file|the specified object number.  Please ensure your database sequences have been set correctly":U.
    RUN error-message (lv-errgrp, lv-errnum, lv-include).
END.







/* Update Audit Log */
IF CAN-FIND(FIRST gsc_entity_mnemonic
            WHERE gsc_entity_mnemonic.entity_mnemonic = 'gstdf':U
              AND gsc_entity_mnemonic.auditing_enabled = YES) THEN
  RUN af/app/afauditlgp.p (INPUT "CREATE":U, INPUT "gstdf":U, INPUT BUFFER gst_dataset_file:HANDLE, INPUT BUFFER o_gst_dataset_file:HANDLE).

/* Standard bottom of CREATE trigger code */
{af/sup/aftrigendc.i}


/* Place any specific CREATE trigger customisations here */
