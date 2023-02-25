function Return-FileHash { 
    param ( 
    [Parameter(Position=0,Mandatory=$true,ValueFromPipeline=$true)]
    [ValidateSet("SHA1","SHA256","SHA384","SHA512","MD5")] [STRING[]] $hashAlgorithm,
    [Parameter(Position=1, Mandatory=$true,ValueFromPipeline=$true)] $filepath,
    [Parameter(Position=2,Mandatory=$true,ValueFromPipeline=$true)] $hashOutput 
    )
    New-Item $hashOutput
    $hashAlgorithm | ForEach-Object -Process {
        Get-FileHash $filepath -Algorithm $_ | Add-Content $hashOutput
    }

}

Return-FileHash 
