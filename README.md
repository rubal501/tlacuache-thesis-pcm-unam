# tlacuache-thesis-pcm-unam template

🇺🇸 [English](README.en.md)

Este repositorio contiene un template para tesis de maestría del Posgrado en Ciencias Matemáticas de la Universidad Nacional Autónoma de México (UNAM).

El diseño está basado en el template [tlacuache-thesis-fc-unam](https://github.com/davidalencia/tlacuache-thesis-fc-unam), originalmente desarrollado para la licenciatura en la Facultad de Ciencias. La portada ha sido adaptada para cumplir (de manera aproximada) con los lineamientos del programa de posgrado.

## Uso

⚠️ Nota: Actualmente este template no se encuentra en el repositorio oficial de paquetes de Typst.

Si deseas usar la plantilla localmente antes de que esté en Typst Universe, puedes instalarla en el espacio de nombres `@local`. Para eso 
puedes seguir la [docuemntacion](https://github.com/typst/packages#local-packages)
o usar la siguiente opcion:

### Instalacion local simple

Copia y pega el comando correspondiente a tu sistema operativo en tu terminal:

**macOS**
```bash
TARGET="$HOME/Library/Application Support/typst/packages/local/tlacuache-thesis-msc-pcm-unam/0.1.0"

mkdir -p "$TARGET"
curl -sL "https://github.com/rubal501/tlacuache-thesis-msc-pcm-unam/archive/refs/tags/version.zip" -o /tmp/tlacuache.zip
unzip -q -o /tmp/tlacuache.zip -d /tmp
cp -r /tmp/tlacuache-thesis-msc-pcm-unam-version/* "$TARGET"
rm -rf /tmp/tlacuache.zip /tmp/tlacuache-thesis-msc-pcm-unam-version

echo "Plantilla instalada con éxito en @local"
```
**linux**
```bash
TARGET="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local/tlacuache-thesis-msc-pcm-unam/0.1.0"

mkdir -p "$TARGET"
curl -sL "https://github.com/rubal501/tlacuache-thesis-msc-pcm-unam/archive/refs/tags/version.zip" -o /tmp/tlacuache.zip
unzip -q -o /tmp/tlacuache.zip -d /tmp
cp -r /tmp/tlacuache-thesis-msc-pcm-unam-version/* "$TARGET"
rm -rf /tmp/tlacuache.zip /tmp/tlacuache-thesis-msc-pcm-unam-version

echo "Plantilla instalada con éxito en @local"
```

**windows (powershell)**
```powershell
$target = "$env:APPDATA\typst\packages\local\tlacuache-thesis-msc-pcm-unam\0.1.0"
$zip    = "$env:TEMP\tlacuache.zip"
$ext    = "$env:TEMP\tlacuache-extracted"

New-Item -ItemType Directory -Force -Path $target | Out-Null
Invoke-WebRequest -Uri "https://github.com/rubal501/tlacuache-thesis-msc-pcm-unam/archive/refs/tags/version.zip" -OutFile $zip
Expand-Archive -Path $zip -DestinationPath $ext -Force
Copy-Item -Path "$ext\tlacuache-thesis-msc-pcm-unam-version\*" -Destination $target -Recurse -Force
Remove-Item -Recurse -Force $zip,$ext

Write-Host "Plantilla instalada con éxito en @local" -ForegroundColor Green
```

ya con eso basta con utlizar `typst init`
```bash
typst init @local/tlacuache-thesis-msc-pcm-unam:0.1.0 mi-tesis
cd mi-tesis
typst watch main.typ
```

## Configuración

Para configurar tu tesis puedes hacerlo con estas lineas al inicio de tu archivo principal.

```typ
#import "./tlacuache-thesis-pccm-unam/lib.typ":*

#show: thesis.with(
  titulo: [Titulo],
  autor: [Autor],
  asesor: [Asesor],
  asesor-adscripcion: [Instituto 1],
  asesor-genero: "directora",
  lugar: [Ciudad de México, México],
  agno: [#datetime.today().year()],
  bibliography: bibliography("references.bib"),
)

// Tu tesis va aquí
```

### Parámetros de la portada

| Parámetro             | Descripción                                                        | Valor por defecto               |
|-----------------------|--------------------------------------------------------------------|---------------------------------|
| `titulo`              | Título de la tesis                                                 | `[Titulo]`                      |
| `autor`               | Nombre completo del autor                                          | `[Autor]`                       |
| `asesor`              | Nombre del director de tesis                                       | `[Asesor]`                      |
| `asesor-adscripcion`  | Adscripción del director (instituto o facultad)                    | `[Adscripción]`                 |
| `asesor-genero`       | Tratamiento de género del director: `"directora"` o `"director"`   | `"directora"`                   |
| `lugar`               | Ciudad y país donde se presenta la tesis                           | `[Ciudad de México, México]`    |
| `agno`                | Año de presentación                                                | Año actual                      |

### Parámetros de contenido

| Parámetro         | Descripción                                                  | Valor por defecto |
|-------------------|--------------------------------------------------------------|-------------------|
| `bibliography`    | Referencia al archivo de bibliografía (`bibliography(...)`)  | `none` (ninguna)  |
| `resumen`         | Resumen de la tesis                                          | `none` (ninguno)  |
| `agradecimientos` | Sección de agradecimientos                                   | `none` (ninguno)  |

También puedes utilizar estas lineas para crear capítulos con bibliografía,
si deseas crear un pdf solamente para el capítulo.

```typ
#import "./tlacuache-thesis-pccm-unam/lib.typ":chapter


// completamente opcional cargar la bibliografía, compilar el capítulo
#show: chapter.with(bibliography: bibliography("references.bib"))

// Tu capítulo va aquí
```

Si quieres crear pdf aún más cortos, puedes utilizar estas lineas para crear un pdf solo para la sección de tu capítulo.

```typ
#import "./tlacuache-thesis-pccm-unam/lib.typ":section


// completamente opcional cargar la bibliografía, compilar el sección
#show: section.with(bibliography: bibliography("references.bib"))

// Tu sección va aquí
```

## 🫶 Agradecimientos

- [David Valencia Rodríguez](https://github.com/davidalencia) por el desarrollo del template original.

## 🚨 Disclaimer

Este template no es oficial y no está afiliado al Posgrado en Ciencias Matemáticas de la UNAM. Su uso es bajo responsabilidad del usuario.
