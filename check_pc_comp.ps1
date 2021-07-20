Get-WmiObject Win32_VideoController | Format-Table name,@{Expression={$_.adapterram/1GB};label="GB"} | Out-File -FilePath "x\$env:COMPUTERNAME.txt"
Get-CimInstance -ClassName Win32_PhysicalMemory | Format-Table -Property Manufacturer, @{Name="Model";Expression={$_.PartNumber}}, @{Name="Size";Expression={[math]::round(($_.Capacity/1gb)).ToString()+" GB"}}, @{Name="Clock Speed";Expression={$_.ConfiguredClockSpeed}}, @{Name="RAM Slot";Expression={$_.DeviceLocator}} | Out-File -FilePath "x\$env:COMPUTERNAME.txt" -Append
Get-WmiObject Win32_Processor | Format-Table -Property DeviceID,Manufacturer,Name,NumberOfCores,MaxClockSpeed | Out-File -FilePath "x\$env:COMPUTERNAME.txt" -Append
Get-WmiObject Win32_OperatingSystem | Format-Table -Property BuildNumber,Version | Out-File -FilePath "x\$env:COMPUTERNAME.txt" -Append
Get-WmiObject Win32_BaseBoard | Format-Table -Property TableManufacturer,Product,SerialNumber | Out-File -FilePath "x\$env:COMPUTERNAME.txt" -Append
