 
Write-Host "Hello World"

Write-Host "SUCCESS" -ForegroundColor Green

Write-Output "Hello World"

$result = Write-Output "Data"

Write-Verbose "Starting deployment"

Write-Debug "Value of x is $x"

Write-Warning "Config file not found"

Write-Error "Deployment failed"

try {
    Write-Error "Boom"
} catch {
    Write-Host "Caught error"
}


Write-Information "Info message" -InformationAction Continue


"Hello World" | Out-File log.txt



# | Cmdlet              | Purpose       | Pipeline | Use Case         |
# | ------------------- | ------------- | -------- | ---------------- |
# | `Write-Host`        | Console only  | ❌        | Visual output    |
# | `Write-Output`      | Data output   | ✅        | Return values    |
# | `Write-Verbose`     | Detailed logs | ✅        | Diagnostics      |
# | `Write-Debug`       | Debug tracing | ✅        | Dev debugging    |
# | `Write-Warning`     | Warning       | ✅        | Non-fatal issues |
# | `Write-Error`       | Error         | ✅        | Failures         |
# | `Write-Information` | Info logs     | ✅        | Controlled logs  |

