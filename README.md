# tlacuache-thesis-pcc-unam template

ES 🇲🇽

Este repositorio contiene un template para tesis de maestría del Posgrado en Ciencias Matemáticas de la Universidad Nacional Autónoma de México (UNAM).

El diseño está basado en el template [tlacuache-thesis-fc-unam](https://github.com/davidalencia/tlacuache-thesis-fc-unam), originalmente desarrollado para la licenciatura en la Facultad de Ciencias. La portada ha sido adaptada para cumplir (de manera aproximada) con los lineamientos del programa de posgrado.

EN 🇺🇸

This repository provides a thesis template for the Master's Program in Mathematical Sciences at the Universidad Nacional Autónoma de México (UNAM).

The design is based on the [tlacuache-thesis-fc-unam](https://github.com/davidalencia/tlacuache-thesis-fc-unam) template, originally created for undergraduate thesis at the Faculty of Sciences. The cover has been adapted to (approximately) comply with the graduate program requirements.

## Uso/Usage

ES 🇲🇽

⚠️ Nota: Actualmente este template no se encuentra en el repositorio oficial de paquetes de Typst.

- Clonar el repositorio usando git:
  ```bash
  git clone git@github.com:rubal501/tlacuache-thesis-pccm-unam.git
  ```
- Importa el template en tu archivo principal:
  ```typ
  #import "./tlacuache-thesis-pccm-unam/lib.typ":*
  ```
  
EN 🇺🇸

⚠️ Note: This template is not currently available in the official Typst package repository.

- Clone the repository:
  ```bash
  git clone git@github.com:rubal501/tlacuache-thesis-pccm-unam.git
  ```
- Import the template in your main file::
  ```typ
  #import "./tlacuache-thesis-pccm-unam/lib.typ":*
  ```


## Configuración/Configuration

Para configurar tu tesis puedes hacerlo con estas lineas al
inicio de tu archivo principal.


```typ
#import "./tlacuache-thesis-pccm-unam/lib.typ":*

#show: thesis.with(
  titulo: [Titulo],
  autor: [Autor],
  asesor: [Asesor],
  asesorAD: [Instituto 1],
  lugar: [Ciudad de México, México],
  agno: [#datetime.today().year()],
  bibliography: bibliography("references.bib"),
)

// Tu tesis va aquí
```

Tambien puedes utilizar estas lineas para crear capítulos con bibliografía,
si deseas crear un pdf solomente para el capítulo.

You could also create a pdf for just a chapter with bibliography, by using the following lines.

```typ
#import "./tlacuache-thesis-pccm-unam/lib.typ":chapter


// completamente opcional cargar la bibliografía, compilar el capítulo
#show: chapter.with(bibliography: bibliography("references.bib"))

// Tu capítulo va aquí
```

Si quieres crear pdf aun mas cortos, puedes utilizar estas lineas para crear un pdf solo para el sección de tu capítulo.

You could even create a pdf for just a section of a chapter.

```typ
#import "./tlacuache-thesis-pccm-unam/lib.typ":section


// completamente opcional cargar la bibliografía, compilar el sección
#show: section.with(bibliography: bibliography("references.bib"))

// Tu sección va aquí
```

## 🫶 Agradecimientos

- [David Valencia Rodríguez](https://github.com/davidalencia) por el desarrollo del template original.
- 
## 🚨 Disclaimer

ES 🇲🇽

Este template no es oficial y no está afiliado al Posgrado en Ciencias Matemáticas de la UNAM. Su uso es bajo responsabilidad del usuario.

EN 🇺🇸

This template is not official and is not affiliated with the Mathematical Sciences Graduate Program at UNAM. Use it at your own discretion.

