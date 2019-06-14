# SlideButton Swift 5

[Project created with Xcode V10.2.1]
[Deployment Target > 9.0 ]

## Project Base.
Creación de un Botón Deslizante (Usando StoryBoard):
Un Label se comportará como el botón deslizante (*Activar User Interaction Enabled). 
Éste está dentro de un View, que es el área donde se podrá desplazar. 
Se muestra un mensaje que cambia según la posición en que se encuentre el botón deslizado.
Uso de Pan Gesture Recognizer: Referenciado al Label

## Animations
Creación de tres animaciones para el botón deslizante:
[expandButton]: Cuando el botón llega hasta el final del área, el botón toma el tamaño del área.
[moveButtonBack]: Cuando el botón no llega hasta el final del área, el botón regresa hasta su posición inicial.
[collapseButton]: Cuando el botón está del tamaño del área, se podrá regresar a su tamaño original.

## Style
Ahora, un ImageView se comportará como el botón deslizante (*Activar User Interaction Enabled).
Al Botón Deslizante se le da estilo de esquinas redondeadas.