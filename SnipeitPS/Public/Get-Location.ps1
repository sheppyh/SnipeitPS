<#
.SYNOPSIS
# Gets a list of Snipe-it Locations

.PARAMETER url
URL of Snipeit system, can be set using Set-Info command

.PARAMETER apiKey
Users API Key for Snipeit, can be set using Set-Info command

.EXAMPLE
Get-Location -url "https://assets.example.com" -token "token..."

.EXAMPLE
Get-Location -url "https://assets.example.com" -token "token..." | Where-Object {$_.name -eq "Location1" }

#>

function Get-Location()
{
    Param(
        [parameter(mandatory=$true)]
        [string]$url,

        [parameter(mandatory=$true)]
        [string]$apiKey
    )

    $Parameters = @{
        Uri           = "$url/api/v1/locations"
        Method        = 'Get'
        Token         = $apiKey
    }

    $result = Invoke-SnipeitMethod @Parameters

    $result
}
