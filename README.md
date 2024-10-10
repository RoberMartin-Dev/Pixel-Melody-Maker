# Pixel Melody Maker

## Descripción
Pixel Melody Maker es un programa creado para facilitar el trabajo de sonido a los creadores de videojuegos retro. Con dos minutos y algo de imaginación, tendrás la melodía ideal en tu ordenador. Si no estás creando videojuegos retro, no huyas, también puede serte útil. Se pueden generar archivos de audio de forma automática o manual. Dispone de una base rítmica completamente aleatoria, la cual genera sonidos con 37 notas que van alternándose entre ellas. Además ofrece una función manual tipo piano para componer melodías de forma independiente utilizando el teclado del ordenador. Está horientado a la temática de videojuegos clásicos (8 bits), pero las melodías que permite generar pueden utilizarse para cualquier fin, desde vídeos hasta aplicaciones. Los archivos de audio se guardan en formato WAV.

## Instalación
No es necesario instalar nada, es portable.

## Uso
Pixel Melody Maker muestra una interfaz sencilla. No pretende ser una aplicación detallada ni demasiado compleja, sino una herramienta sencilla y eficaz para su propósito. Con cuatro botones, dos deslizadores y el teclado, ofrece una cómoda experiencia de creación. Puede que consigas una excelente melodía con su modo automático, o que te inspire para crear manualmente la melodía deseada.

### Funciones
1. **Generar melodías aleatorias**: Según se inicia el programa y hasta que finaliza, se genera una secuencia aleatoria.
2. **Generar melodías manuales**: Una vez activado el botón para el control manual, el teclado del ordenador permitirá al usuario crear melodías personalizadas.

### Controles
1. **Cambiar tipo de sonido/onda**: Pixel Melody Maker permite utilizar 4 tipos de onda para generar sonidos diferentes. El cambio de sonido se puede realizar mediante los botones "SINE", "SAW", "TRIANGLE" y "SQUARE" de la interfaz o la *flecha derecha* del teclado.
> Cada sonido tiene su nicho, pero siempre se pueden ir mezclando. Pulsa la flecha derecha mientras tocas tu melodía.
3. **Modificar tempo**: Para la melodía automática, se puede modificar el tempo mediante un deslizador o con las *flechas arriba y abajo* del teclado. Esto hará que la melodía sea más lenta o más rápida.
> No pide el mismo ritmo un juego de carreras que uno de cartas, pero quien sabe.
4. **Modificar volumen**: Tanto para las melodías automáticas como para las manuales, se ha implementado un deslizador de volumen.
> Ambos deslizadores son accionables pulsando y deslizando con el ratón o simplemente moviendo la rueda al poner el cursor sobre ellos.
4. **Guardar el audio**: Mediante la *flecha izquierda* del teclado, se pueden guardar audios en formato .wav. Cada audio llevará un número consecutivo al anterior no ocupado.
> [!TIP]
> Los audios se recogen por secciones. Si se utiliza el programa durante 5 minutos desde su inicio y se guarda el audio, ese primer audio durará 5 minutos. Si después se guarda otro audio de 2 minutos, se guardará el sonido desde el minuto 5 hasta el minuto 7 de uso del programa. Esto es importante pues que permite empezar de cero cada vez que se desea grabar algo de una forma extremadamente sencilla, sólo se debe guardar antes de iniciar la secuencia deseada y volver a guardar. Después es muy sencillo unir pistas o recortarlas con cualquier herramienta de edición (estoy trabajando en una).

## Tecnologías utilizadas
Processing 4. Processing es un lenguaje de programación y entorno de desarrollo integrado de código abierto basado en Java, que sirve como medio para la enseñanza y producción de proyectos multimedia e interactivos de diseño digital. Lo había utilizado en varias ocasiones para trabajar con lectura y generación de imágenes, pero me sorprendió también su versatilidad con el sonido.

## Contribuciones
¡Gracias por tu interés en contribuir a este proyecto! Aquí hay algunas formas en las que puedes ayudar:

1. **Reportar Errores**: Si encuentras algún error o problema, por favor abre un issue en GitHub describiendo el problema en detalle.

2. **Documentación**: Ayuda a mejorar la documentación del proyecto, ya sea corrigiendo errores, añadiendo ejemplos o mejorando las explicaciones.

3. **Pruebas**: Escribe y mejora las pruebas para asegurar que el código sea robusto y libre de errores.

### Código de Conducta
> [!IMPORTANT] 
Este proyecto sigue el Código de Conducta de Colaboradores. Al participar, te pedimos que respetes este código para mantener un ambiente respetuoso para todos.

## Licencia
Este proyecto está licenciado bajo los términos de una licencia personalizada. El uso comercial del software está restringido únicamente al autor. Cualquier uso comercial por parte de terceros requiere el permiso explícito del autor. Las bibliotecas **Minim** y **controlP5** utilizadas en este software están licenciadas bajo la GNU Lesser General Public License (LGPL). Cualquier modificación a estas bibliotecas debe ser distribuida bajo los términos de la LGPL. Para más detalles, consulta el archivo LICENSE. Copyright © RoberMartin-Dev.
> [!NOTE] 
> Las melodías generadas por el programa no son propiedad del autor, pueden ser utilizadas para cualquier fin debiendo el usuario hacerse cargo del copyright de sus creaciones.
