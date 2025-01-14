/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/
/*---------------------------------------------------------------------------------
  File: afsessrvrp.p

  Description:  Astra Server Session Manager

  Purpose:      This is the actual Server Side Session Manager.
                The actual code for the Session Manager is contained in the 
                include file af/app/afsesmngrp.i
                This code is also used by the Client Side Session Manager
                af/sup2/afsesclntp.p
                Server side and client side code is conditionally included using
                the pre-processors server-side and client-side.
                This is not a structured include and contains no wizards as it
                contains no specific code other than the definition of a 
                pre-processor and an include file containing the actual code.

  Parameters:   <none>

  History:
  --------
  (v:010000)    Task:        5653   UserRef:    
                Date:   30/05/2000  Author:     Anthony Swindells

  Update Notes: Created from Template aftemplipp.p

---------------------------------------------------------------------------------*/
/*                   This .W file was created with the Progress UIB.             */
/*-------------------------------------------------------------------------------*/

&global-define server-side  yes
{af/app/afsesmngrp.i}
