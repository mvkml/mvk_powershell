# PowerShell Basics and Timeline

## What is PowerShell?
- Task automation and configuration shell from Microsoft.
- Built on .NET; pipelines pass rich objects instead of plain text.
- Combines interactive shell, scripting language, and extensible modules; cross-platform since PowerShell 6+.

## What is a cmdlet?
- Small, single-purpose PowerShell command implemented in .NET.
- Verb-Noun naming (e.g., Get-Process, Set-Content).
- Outputs structured objects, making pipeline composition predictable.

## PowerShell History (Year-wise)
| Year | Release / Milestone | Notes |
| --- | --- | --- |
| 2006 | PowerShell 1.0 (Monad) | First release; Windows XP/2003; object-based pipeline. |
| 2009 | PowerShell 2.0 | Remoting (PSRemoting), background jobs, modules; shipped with Win7/Server 2008 R2. |
| 2012 | PowerShell 3.0 | Workflow, updatable help, better CIM support; shipped with Win8/Server 2012. |
| 2013 | PowerShell 4.0 | Desired State Configuration (DSC) debut; shipped with Win8.1/Server 2012 R2. |
| 2014 | PowerShell 5.0 | OneGet/PackageManagement, PowerShellGet, classes, new debugging features. |
| 2016 | PowerShell 5.1 | Last Windows-only Windows PowerShell; compatibility and security improvements. |
| 2018 | PowerShell Core 6.1 | Cross-platform (.NET Core 2.1); side-by-side with 5.1. |
| 2020 | PowerShell 7.0 | Rebranded to "PowerShell" (dropping "Core"); .NET Core 3.1; ForEach-Object -Parallel. |
| 2021 | PowerShell 7.1 | .NET 5; performance and error view updates. |
| 2022 | PowerShell 7.2 | LTS on .NET 6; Set-StrictMode -Version Latest; Predictive IntelliSense improvements. |
| 2023 | PowerShell 7.3 | .NET 7; error handling and performance tweaks. |
| 2024 | PowerShell 7.4 | .NET 8; continued UX and performance updates. |
| 2025 | PowerShell 7.5 (preview) | Aligns with .NET 9; incremental reliability/telemetry/perf updates. |

## Quick version check
Run in a PowerShell prompt:

```powershell
$PSVersionTable
```
