#Checks that nvlink exists


proc has_nvlink {} {
    set status [catch { exec /bin/bash -c "nvidia-smi nvlink --id 0 --status >& /dev/null" } result ]
	if{$status == 0}{
		return true
	}
	else{
		return false
	}
	
}
