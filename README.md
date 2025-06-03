# Hyper-Shell Automation

Este proyecto no es nada nuevo, nadie deberia de clonarlo o asumir que cualquiera de la pedaceria
de ps scripts pegados aqui funcione o tenga el resultado deseado que dice cumplir.

> `# You've Been Warned`
>

## Estructura

Se reuiere una estructura basica para que funcione el proyecto, ya sea declarandola cada vez que se invoque
el script, generandola y/o declarando variables. El como hacer cada una queda a discrecion de quien lo use. Pero
para rapida referencia consta de estos elementos:

* 2 Directorios, (Plantillas e Imagen Iso)

Esto se podria representar como:

> `En el $env:Path\Drive-de-Proyecto`
>> En donde hay dos directorios:
>>>
>>> `Plantillas`
>>> `Imagenes Iso`
>

En donde la ejecucion del script buscara una plantilla de nombre `"Clave"+"Veresion"` (Ej; WinServ-2019),
al encontrarla copiara la plantilla y ubicara la copia en el directorio para "Hyper-V" (Tu sabras en que ruta
estara ubicado, Ej; D:\Proyectos-HyperV). Y esta copia se reenombrara segun el nuevo nombre que se declare 
interactivamente en el script `crea-HazEzzo.ps1` con tipo de extension `VHDX` que es la nativa del hypervisor.

```powershell
PS1> Copy-Item -Path "D:\Hyper-V\Templates-$($version).vhdx" -Destination "D:\Hyper-V\VHDXFiles\$($VMName).vhdx" -Force | Out-Null
```
