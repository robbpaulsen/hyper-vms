# Parametros basicos Nombre, Version de Windows y nuemero de CPU's
Param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$VMName,
    [Parameter(Mandatory=$True,Position=2)]
    [string]$version,
    [Parameter(Mandatory=$True,Position=3)]
    [string]$CPUCount
)

# Variables para la configuración de la VM (puedes ajustarlas)
$VMName = Read-SpectreText -Prompt "[bold blue]Nombre de la VM Plantilla:[/]" -DefaultValue "PlantillaBase"
$MemoryGB = Read-SpectreText -Prompt "[bold blue]Memoria (GB):[/]" -DefaultValue "8" -ValidateScript { $_ -as [int] -gt 0 } -ValidationMessage "[red]La memoria debe ser un número entero mayor que cero.[/]"
$VHDPath = Read-SpectreText -Prompt "[bold blue]Ruta del disco duro virtual (.vhdx):[/]" -DefaultValue "D:\Hyper-V\Templates\"

# --- Crear la VM --- #
New-VM -Name $VMName -MemoryStartupBytes ($MemoryGB * 8GB) -VHDPath $VHDPath -Generation 2

# --- Mensaje de éxito --- #
Format-SpectrePanel -Border Rounded -Data '[Bold Turquoise]VM Plantilla '$VMName' creada[/] [Blink Underline Yellow1 on Turquoise4]exitosamente![/]'

# Copiar el disco del directorio de plantillas y ubicarlo en el directorio de la
# maquina virtual  en Hyper-V
Copy-Item -Path "D:\Hyper-V\Templates\Win-PI-$($version).vhdx" -Destination "D:\Hyper-V\VHDXFiles\$($VMName).vhdx" -Force | Out-Null

# Establecer la definicion de la maquina virtual

# Configuracion pre establecida para la maquina virtual

