/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*               PSC                                                  *
*                                                                    *
*********************************************************************/

TRIGGER PROCEDURE FOR CREATE OF gsm_profile_date_value .

/* Created automatically using ERwin ICF Trigger template db/af/erw/afercustrg.i
   Do not change manually. Customisations to triggers should be placed in separate
   include files pulled into the trigger. ICF auto generates write trigger custom
   include files. Delete or create customisation include files need to be created
   manually. Be sure to put the hook in ERwin directly so as not to have you changes
   overwritten.
   User defined Macro (UDP) Summary (case sensitive)
   gsm_profile_date_value           Expands to full table name, e.g. gsm_user
   %TableFLA            Expands to table unique code, e.g. gsmus
   %TableObj            If blank or not defined expands to table_obj with no prefix (framework standard)
                        If defined, uses this field as the object field
                        If set to "none" then indicates table does not have an object field
   XYZ                  Do not define so we can compare against an empty string

   See docs for explanation of replication macros 
*/   

&SCOPED-DEFINE TRIGGER_TABLE gsm_profile_date_value
&SCOPED-DEFINE TRIGGER_FLA gsmpd
&SCOPED-DEFINE TRIGGER_OBJ profile_date_value_obj


DEFINE BUFFER lb_table FOR gsm_profile_date_value.      /* Used for recursive relationships */
DEFINE BUFFER lb1_table FOR gsm_profile_date_value.     /* Used for lock upgrades */

DEFINE BUFFER o_gsm_profile_date_value FOR gsm_profile_date_value.

/* Standard top of CREATE trigger code */
{af/sup/aftrigtopc.i}

  



/* Generated by ICF ERwin Template */
/* gsm_profile  gsm_profile_date_value ON CHILD INSERT RESTRICT */
IF 
    ( gsm_profile_date_value.profile_obj <> 0 ) THEN
  DO:
    IF NOT(CAN-FIND(FIRST gsm_profile WHERE
        gsm_profile_date_value.profile_obj = gsm_profile.profile_obj)) THEN
        DO:
          /* Cannot create child because parent does not exist ! */
          ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 102 lv-include = "gsm_profile_date_value|gsm_profile":U.
          RUN error-message (lv-errgrp, lv-errnum, lv-include).
        END.
    
    
  END.






ASSIGN gsm_profile_date_value.{&TRIGGER_OBJ} = getNextObj() NO-ERROR.
IF ERROR-STATUS:ERROR THEN 
DO:
    ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 31 lv-include = "gsm_profile_date_value|the specified object number.  Please ensure your database sequences have been set correctly":U.
    RUN error-message (lv-errgrp, lv-errnum, lv-include).
END.







/* Update Audit Log */
IF CAN-FIND(FIRST gsc_entity_mnemonic
            WHERE gsc_entity_mnemonic.entity_mnemonic = 'gsmpd':U
              AND gsc_entity_mnemonic.auditing_enabled = YES) THEN
  RUN af/app/afauditlgp.p (INPUT "CREATE":U, INPUT "gsmpd":U, INPUT BUFFER gsm_profile_date_value:HANDLE, INPUT BUFFER o_gsm_profile_date_value:HANDLE).

/* Standard bottom of CREATE trigger code */
{af/sup/aftrigendc.i}


/* Place any specific CREATE trigger customisations here */
