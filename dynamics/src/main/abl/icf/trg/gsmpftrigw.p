/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*               PSC                                                  *
*                                                                    *
*********************************************************************/

TRIGGER PROCEDURE FOR WRITE OF gsm_profile_data OLD BUFFER o_gsm_profile_data.

/* Created automatically using ERwin ICF Trigger template db/af/erw/afercustrg.i
   Do not change manually. Customisations to triggers should be placed in separate
   include files pulled into the trigger. ICF auto generates write trigger custom
   include files. Delete or create customisation include files need to be created
   manually. Be sure to put the hook in ERwin directly so as not to have you changes
   overwritten.
   User defined Macro (UDP) Summary (case sensitive)
   gsm_profile_data           Expands to full table name, e.g. gsm_user
   %TableFLA            Expands to table unique code, e.g. gsmus
   %TableObj            If blank or not defined expands to table_obj with no prefix (framework standard)
                        If defined, uses this field as the object field
                        If set to "none" then indicates table does not have an object field
   XYZ                  Do not define so we can compare against an empty string

   See docs for explanation of replication macros 
*/   

&SCOPED-DEFINE TRIGGER_TABLE gsm_profile_data
&SCOPED-DEFINE TRIGGER_FLA gsmpf
&SCOPED-DEFINE TRIGGER_OBJ profile_data_obj


DEFINE BUFFER lb_table FOR gsm_profile_data.      /* Used for recursive relationships */
DEFINE BUFFER lb1_table FOR gsm_profile_data.     /* Used for lock upgrades */



/* Standard top of WRITE trigger code */
{af/sup/aftrigtopw.i}

/* properform fields if enabled for table */
IF CAN-FIND(FIRST gsc_entity_mnemonic
            WHERE gsc_entity_mnemonic.entity_mnemonic = 'gsmpf':U
              AND gsc_entity_mnemonic.auto_properform_strings = YES) THEN
  RUN af/app/afpropfrmp.p (INPUT BUFFER gsm_profile_data:HANDLE).
  



/* Generated by ICF ERwin Template */
/* gsc_profile_code is used by gsm_profile_data ON CHILD UPDATE RESTRICT */
IF NEW gsm_profile_data OR  gsm_profile_data.profile_type_obj <> o_gsm_profile_data.profile_type_obj OR gsm_profile_data.profile_code_obj <> o_gsm_profile_data.profile_code_obj  THEN
  DO:
    IF NOT(CAN-FIND(FIRST gsc_profile_code WHERE
        gsm_profile_data.profile_type_obj = gsc_profile_code.profile_type_obj and
        gsm_profile_data.profile_code_obj = gsc_profile_code.profile_code_obj)) THEN
              DO:
                /* Cannot update child because parent does not exist ! */
                ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 103 lv-include = "gsm_profile_data|gsc_profile_code":U.
                RUN error-message (lv-errgrp, lv-errnum, lv-include).
              END.
    
    
  END.

/* Generated by ICF ERwin Template */
/* gsm_user has gsm_profile_data ON CHILD UPDATE RESTRICT */
IF NEW gsm_profile_data OR  gsm_profile_data.user_obj <> o_gsm_profile_data.user_obj  THEN
  DO:
    IF NOT(CAN-FIND(FIRST gsm_user WHERE
        gsm_profile_data.user_obj = gsm_user.user_obj)) THEN
              DO:
                /* Cannot update child because parent does not exist ! */
                ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 103 lv-include = "gsm_profile_data|gsm_user":U.
                RUN error-message (lv-errgrp, lv-errnum, lv-include).
              END.
    
    
  END.








IF NOT NEW gsm_profile_data AND gsm_profile_data.{&TRIGGER_OBJ} <> o_gsm_profile_data.{&TRIGGER_OBJ} THEN
    DO:
        ASSIGN lv-error = YES lv-errgrp = "AF":U lv-errnum = 13 lv-include = "table object number":U.
        RUN error-message (lv-errgrp,lv-errnum,lv-include).
    END.

/* Customisations to WRITE trigger */
{icf/trg/gsmpftrigw.i}



/* Update Audit Log */
IF CAN-FIND(FIRST gsc_entity_mnemonic
            WHERE gsc_entity_mnemonic.entity_mnemonic = 'gsmpf':U
              AND gsc_entity_mnemonic.auditing_enabled = YES) THEN
  RUN af/app/afauditlgp.p (INPUT "WRITE":U, INPUT "gsmpf":U, INPUT BUFFER gsm_profile_data:HANDLE, INPUT BUFFER o_gsm_profile_data:HANDLE).

/* Standard bottom of WRITE trigger code */
{af/sup/aftrigendw.i}



