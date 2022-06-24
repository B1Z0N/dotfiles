Clear-Host

### Path
# git
$env:Path += ";C:\Program Files\Git\bin"
# msbuild
$env:Path += ";C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin"
# dotnet cli
$env:Path += ";C:\Program Files\Microsoft Visual Studio\2022\Community\dotnet\runtime"
# java
$env:Path += ";C:\Program Files\Java\jdk-11.0.15.1\bin"

# Functions
function cs {
  param(
    [Parameter()]
    [string]$Folder
  )

  if ($Folder) { Set-Location $Folder }

  Clear-Host; Get-ChildItem
}

function Notify-Job {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [scriptblock]$Job,
        [Parameter()]
        [string]$Name,
        [Parameter()]
        [scriptblock]$Continuation
    )

    $Name = If ($Name) { $Name } Else { $Job.ToString().Trim() }
    
    if (!$Continuation) {
        $Continuation = [scriptblock]::Create("Write-Host `"Job '${Name}' completed`"; Unregister-Event `$Event")
    } else {
        $Continuation = [scriptblock]::Create($Continuation.ToString() + "; Unregister-Event `$Event")
    }

    $Event=Register-ObjectEvent (Start-Job $Job -Name $Name) StateChanged -Action $Continuation

    $null
    
    <#
        .SYNOPSIS
        Notify on job background job completion.

        .DESCRIPTION
        Gets your scriptblock and turns it into a job 
        and sets it's continuation to notify you in different ways. 

        .PARAMETER Job
        Scriptblock to set for your background job.

        .PARAMETER Name
        Name of the job to notify for completion. 
        Body of $Job scriptblock is taken if $Name is absent.

        .PARAMETER Continuation
        Scriptblock to execute as a notification when $Job is completed.
        If absent set to just output that job with $Name is completed.

        .INPUTS
        None. You cannot pipe objects to Notify-Job.

        .OUTPUTS
        None. But may produce output in future in continuation.

        .EXAMPLE
        PS> Notify-Job -Job { Start-Sleep 1 }
        PS> Job 'Start-Sleep 1' completed

        .EXAMPLE
        PS> Notify-Job -Job { Start-Sleep 1 } -Name "job1"
        PS> Job 'job1' completed

        .EXAMPLE
        PS> Notify-Job -Job { Start-Sleep 1 } -Continuation { Write-Host "END" }
        PS> END

        .LINK
        Start-Sleep

        .LINK
        Write-Host

        .LINK
        Start-Job
    #>
}

