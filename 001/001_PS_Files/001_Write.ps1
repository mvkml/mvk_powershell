<#
    Write-Host
    # Use when you want to display messages directly to the console for the user to see.
    # Does not output to the pipeline. Best for visual feedback only.

    Write-Output
    # Use when you want to send data to the pipeline or return values from a script/function.
    # Preferred for passing data along in scripts.

    Write-Verbose
    # Use for detailed diagnostic messages that are only shown when -Verbose is specified.
    # Good for providing extra information during troubleshooting.

    Write-Debug
    # Use for debug tracing information, shown only when -Debug is specified.
    # Helpful for developers to trace variable values and execution flow.

    Write-Warning
    # Use to display warning messages for non-fatal issues.
    # These messages are highlighted and can be captured or suppressed.

    Write-Error
    # Use to report errors and stop execution if necessary.
    # Can be caught with try/catch blocks for error handling.

    Write-Information
    # Use for informational messages that can be controlled with -InformationAction.
    # Useful for structured logging and controlled output.

    Out-File
    # Use to write output to a file.
    # Useful for logging or saving results for later use.
#>
 
Write-Host "Hello World"

Write-Host "SUCCESS" -ForegroundColor Green

Write-Output "Hello World"

$result = Write-Output "Data"
print($result)

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

