<##########################################################################  
   
Script Name:		
Show All Chat Rooms
   
Contact Info: 
C. Anthony Caragol 
https://www.linkedin.com/profile/view?id=18013352
  
Description:		
Just playing with a script here to display all chat rooms
including disabled chat rooms.

Notes:				
Please let me know if you'd like any additional features.
		
Please excuse the sloppy coding for now, I don't use a
development environment, IDE or ISE.  I use notepad, not
even Notepad++, just notepad.
 
Update v1.01 - updated to use Out-GridView instead of custom GUI
 
##########################################################################>  

$ChatRoomList = @()


 	$getdata=Get-CsPersistentChatRoom 
	foreach ($Row in $getdata) {
		$RowPool = $Row.Identity.substring(0,$Row.Identity.indexof("\"))
		$ChatRoomList += New-Object PSCustomObject -Property @{
 			Pool = $RowPool
			Name = $Row.Name
			Disabled = $Row.Disabled
			Category = $Row.Category
			Type = $Row.Type
			Privacy = $Row.Privacy
			Invitations = $Row.Invitations
			Members = [string]$Row.Members
			Managers = [string]$Row.Managers
			Presenters = [string]$Row.Presenters

		}
	}
 	$getdata=Get-CsPersistentChatRoom -disabled $true
	foreach ($Row in $getdata) {
		$RowPool = $Row.Identity.substring(0,$Row.Identity.indexof("\"))
		$ChatRoomList += New-Object PSCustomObject -Property @{
 			Pool = $RowPool
			Name = $Row.Name
			Disabled = $Row.Disabled
			Category = $Row.Category
			Type = $Row.Type
			Privacy = $Row.Privacy
			Invitations = $Row.Invitations
			Members = [string]$Row.Members
			Managers = [string]$Row.Managers
			Presenters = [string]$Row.Presenters

		}
	}

$ChatRoomList  | Select Pool, Name, Disabled, Category, Type, Privacy, Inviations, Members, Managers, Presenters |Out-GridView -Title ”Show All Persistent Chat Rooms v1.01”