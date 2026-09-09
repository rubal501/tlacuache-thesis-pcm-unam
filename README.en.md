# tlacuache-thesis-pcm-unam template

🇲🇽 [Español](README.md)

This repository provides a thesis template for the Master's Program in Mathematical Sciences at the Universidad Nacional Autónoma de México (UNAM).

The design is based on the [tlacuache-thesis-fc-unam](https://github.com/davidalencia/tlacuache-thesis-fc-unam) template, originally created for undergraduate theses at the Faculty of Sciences. The cover has been adapted to (approximately) comply with the graduate program requirements.

## Usage

⚠️ Note: This template is not currently available in the official Typst package repository.

If you want to use the template locally before it is published on Typst Universe, you can install it under the `@local` namespace. For that, you can follow the [documentation](https://github.com/typst/packages#local-packages) or use the following option:

### Simple local install

Copy and paste the command for your operating system into your terminal:

**macOS**
```bash
TARGET="$HOME/Library/Application Support/typst/packages/local/tlacuache-thesis-msc-pcm-unam/0.1.0"

mkdir -p "$TARGET"
curl -sL "https://github.com/rubal501/tlacuache-thesis-msc-pcm-unam/archive/refs/tags/version.zip" -o /tmp/tlacuache.zip
unzip -q -o /tmp/tlacuache.zip -d /tmp
cp -r /tmp/tlacuache-thesis-msc-pcm-unam-version/* "$TARGET"
rm -rf /tmp/tlacuache.zip /tmp/tlacuache-thesis-msc-pcm-unam-version

echo "Template installed successfully in @local"
```
**linux**
```bash
TARGET="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local/tlacuache-thesis-msc-pcm-unam/0.1.0"

mkdir -p "$TARGET"
curl -sL "https://github.com/rubal501/tlacuache-thesis-msc-pcm-unam/archive/refs/tags/version.zip" -o /tmp/tlacuache.zip
unzip -q -o /tmp/tlacuache.zip -d /tmp
cp -r /tmp/tlacuache-thesis-msc-pcm-unam-version/* "$TARGET"
rm -rf /tmp/tlacuache.zip /tmp/tlacuache-thesis-msc-pcm-unam-version

echo "Template installed successfully in @local"
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

Write-Host "Template installed successfully in @local" -ForegroundColor Green
```

With that, all you need to do is run `typst init`
```bash
typst init @local/tlacuache-thesis-msc-pcm-unam:0.1.0 mi-tesis
cd mi-tesis
typst watch main.typ
```

## Configuration

You can configure your thesis with these lines at the beginning of your main file.

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

// Your thesis goes here
```

### Cover parameters

| Parameter             | Description                                                      | Default value                   |
|-----------------------|------------------------------------------------------------------|---------------------------------|
| `titulo`              | Thesis title                                                     | `[Titulo]`                      |
| `autor`               | Author's full name                                               | `[Autor]`                       |
| `asesor`              | Thesis advisor's name                                            | `[Asesor]`                      |
| `asesor-adscripcion`  | Advisor's institutional affiliation (institute or faculty)       | `[Adscripción]`                 |
| `asesor-genero`       | Gender title for the advisor: `"directora"` or `"director"`      | `"directora"`                   |
| `lugar`               | City and country where the thesis is presented                   | `[Ciudad de México, México]`    |
| `agno`                | Year of presentation                                             | Current year                    |

### Content parameters

| Parameter         | Description                                                  | Default value     |
|-------------------|--------------------------------------------------------------|-------------------|
| `bibliography`    | Reference to the bibliography file (`bibliography(...)`)     | `none` (none)     |
| `resumen`         | Thesis abstract                                              | `none` (none)     |
| `agradecimientos` | Acknowledgements section                                     | `none` (none)     |

You can also use these lines to create chapters with a bibliography, if you want to create a PDF for just the chapter.

```typ
#import "./tlacuache-thesis-pccm-unam/lib.typ":chapter


// loading the bibliography is completely optional
#show: chapter.with(bibliography: bibliography("references.bib"))

// Your chapter goes here
```

If you want to create even shorter PDFs, you can use these lines to create a PDF for just a section of your chapter.

```typ
#import "./tlacuache-thesis-pccm-unam/lib.typ":section


// loading the bibliography is completely optional
#show: section.with(bibliography: bibliography("references.bib"))

// Your section goes here
```

## 🫶 Acknowledgements

- [David Valencia Rodríguez](https://github.com/davidalencia) for developing the original template.

## 🚨 Disclaimer

This template is not official and is not affiliated with the Mathematical Sciences Graduate Program at UNAM. Use it at your own discretion.
