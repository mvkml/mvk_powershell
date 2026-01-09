# PowerShell Functions

## Introduction to Functions

Functions in PowerShell are reusable blocks of code that perform specific tasks. They help organize code, improve readability, and promote code reuse. Functions can accept input through parameters and return output.

### Basic Function Syntax

```powershell
function FunctionName {
    # Function body
    # Code to execute
}
```

### Function with Return Value

```powershell
function Get-Sum {
    param($a, $b)
    return $a + $b
}
```

## Parameters

Parameters allow functions to accept input values. PowerShell provides several ways to define parameters:

### Simple Parameters

```powershell
function Show-Message {
    param($message)
    Write-Host $message
}
```

### Multiple Parameters

```powershell
function Get-FullName {
    param($firstName, $lastName)
    return "$firstName $lastName"
}
```

### Typed Parameters

```powershell
function Add-Numbers {
    param(
        [int]$num1,
        [int]$num2
    )
    return $num1 + $num2
}
```

### Parameters with Default Values

```powershell
function Greet-User {
    param(
        [string]$name = "Guest",
        [string]$greeting = "Hello"
    )
    Write-Host "$greeting, $name!"
}
```

### Mandatory Parameters

```powershell
function New-User {
    param(
        [Parameter(Mandatory=$true)]
        [string]$username,
        
        [Parameter(Mandatory=$false)]
        [string]$email
    )
    Write-Host "Creating user: $username"
}
```

### Parameter Attributes

```powershell
function Test-Input {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]$name,
        
        [Parameter(Position=1)]
        [ValidateRange(1, 100)]
        [int]$age
    )
}
```

## Different Types of Functions

### 1. Simple Functions

Basic functions without advanced features:

```powershell
function Say-Hello {
    Write-Host "Hello, World!"
}
```

### 2. Functions with Parameters

Functions that accept input:

```powershell
function Calculate-Area {
    param([double]$length, [double]$width)
    return $length * $width
}
```

### 3. Advanced Functions (Cmdlets)

Functions with CmdletBinding attribute that behave like compiled cmdlets:

```powershell
function Get-ProcessInfo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]$processName
    )
    
    begin {
        Write-Verbose "Starting process search..."
    }
    
    process {
        Get-Process -Name $processName
    }
    
    end {
        Write-Verbose "Process search completed."
    }
}
```

### 4. Functions with Pipeline Support

Functions that accept pipeline input:

```powershell
function Convert-ToUpper {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline=$true)]
        [string]$text
    )
    
    process {
        $text.ToUpper()
    }
}

# Usage: "hello" | Convert-ToUpper
```

### 5. Filter Functions

Special functions that process pipeline input one item at a time:

```powershell
filter Get-EvenNumbers {
    if ($_ % 2 -eq 0) {
        $_
    }
}

# Usage: 1..10 | Get-EvenNumbers
```

### 6. Functions with Output Types

Functions that specify their return type:

```powershell
function Get-ComputerDetails {
    [OutputType([PSCustomObject])]
    param()
    
    [PSCustomObject]@{
        ComputerName = $env:COMPUTERNAME
        OS = (Get-CimInstance Win32_OperatingSystem).Caption
        LastBoot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    }
}
```

### 7. Functions with Multiple Parameter Sets

Functions with different ways to call them:

```powershell
function Get-Data {
    [CmdletBinding(DefaultParameterSetName='ByName')]
    param(
        [Parameter(ParameterSetName='ByName', Position=0)]
        [string]$name,
        
        [Parameter(ParameterSetName='ById', Position=0)]
        [int]$id
    )
    
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        Write-Host "Getting data by name: $name"
    }
    else {
        Write-Host "Getting data by ID: $id"
    }
}
```

### 8. Functions with Switch Parameters

Functions with boolean flags:

```powershell
function Copy-Files {
    param(
        [string]$source,
        [string]$destination,
        [switch]$recursive,
        [switch]$force
    )
    
    if ($recursive) {
        Write-Host "Copying recursively..."
    }
    if ($force) {
        Write-Host "Forcing overwrite..."
    }
}

# Usage: Copy-Files -source "C:\src" -destination "C:\dest" -recursive -force
```

## Best Practices

1. **Use Approved Verbs**: Follow PowerShell verb naming conventions (Get-, Set-, New-, Remove-, etc.)
2. **Add Help Documentation**: Include comment-based help
3. **Validate Parameters**: Use validation attributes
4. **Support Pipeline**: Use ValueFromPipeline when appropriate
5. **Use CmdletBinding**: For advanced functionality
6. **Error Handling**: Use try-catch blocks
7. **Return Objects**: Return structured data instead of formatted text

## Example with Comment-Based Help

```powershell
function Get-UserStatus {
    <#
    .SYNOPSIS
        Gets the status of a user account.
    
    .DESCRIPTION
        This function retrieves detailed status information for a specified user account.
    
    .PARAMETER username
        The username to check. This parameter is mandatory.
    
    .EXAMPLE
        Get-UserStatus -username "john.doe"
        Gets the status of user john.doe
    
    .NOTES
        Author: Your Name
        Date: January 9, 2026
    #>
    
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$username
    )
    
    Write-Host "Checking status for user: $username"
    # Implementation here
}
```

## Common Parameter Validation Attributes

- `[ValidateNotNull()]` - Parameter cannot be null
- `[ValidateNotNullOrEmpty()]` - Parameter cannot be null or empty
- `[ValidateRange(min, max)]` - Numeric value must be within range
- `[ValidateLength(min, max)]` - String length must be within range
- `[ValidatePattern(regex)]` - String must match regex pattern
- `[ValidateSet('val1', 'val2')]` - Parameter must be one of specified values
- `[ValidateScript({scriptblock})]` - Custom validation logic

## Conclusion

PowerShell functions are powerful tools for creating reusable, maintainable code. By understanding parameters, function types, and best practices, you can write professional-grade PowerShell scripts.
