segunda tarea de programación requerirá que escriba una función R es capaz de almacenar en caché cálculos que pueden consumir mucho tiempo. Por ejemplo, calcular la media de un vector numérico suele ser una operación rápida. Sin embargo, para un vector muy largo, puede llevar demasiado tiempo calcular la media, especialmente si tiene que calcularse repetidamente (por ejemplo, en un bucle). Si el contenido de un vector no cambia, puede tener sentido almacenar en caché el valor de la media para que, cuando volvamos a necesitarlo, se pueda buscar en la caché en lugar de volver a calcularlo. En esta asignación de programación aprovecharemos las reglas de alcance del lenguaje R y cómo pueden manipularse para preservar el estado dentro de un objeto R.

Esta tarea se calificará mediante la evaluación por pares. Durante la fase de evaluación, deberá evaluar y calificar los envíos de al menos 4 de sus compañeros de clase. Si no realiza al menos 4 evaluaciones, su propia calificación de la tarea se reducirá en un 20%.

En este ejemplo introducimos el operador <<- que puede utilizarse para asignar un valor a un objeto en un entorno distinto del actual. A continuación se presentan dos funciones que se utilizan para crear un objeto especial que almacena un vector numérico y almacena en caché su media.

La primera función, makeVector crea un "vector" especial, que en realidad es una lista que contiene una función para

establecer el valor del vector

obtener el valor del vector

establecer el valor de la media

obtener el valor de la media

12345678910111213
makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,

La siguiente función calcula la media del "vector" especial creado con la función anterior. Sin embargo, primero comprueba si ya se ha calculado la media. Si es así, obtiene la media de la caché y se salta el cálculo. En caso contrario, calcula la media de los datos y establece el valor de la media en la caché mediante la función setmean.

1234567891011
cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m


La inversión de matrices suele ser un cálculo costoso y puede resultar ventajoso almacenar en caché la inversa de una matriz en lugar de calcularla repetidamente (también existen alternativas a la inversión de matrices que no trataremos aquí). Su tarea consiste en escribir un par de funciones que almacenen en caché la inversa de una matriz.

Escriba las siguientes funciones:

makeCacheMatrix: Esta función crea un objeto "matriz" especial que puede almacenar en caché su inversa.

cacheSolve: Esta función calcula la inversa de la "matriz" especial devuelta por makeCacheMatrix anteriormente. Si la inversa ya ha sido calculada (y la matriz no ha cambiado), entonces cacheSolve debe recuperar la inversa de la caché.

Calcular la inversa de una matriz cuadrada puede hacerse con la función solve de R. Por ejemplo, si X es una matriz cuadrada invertible, entonces solve(X) devuelve su inversa.

Para esta tarea, suponga que la matriz suministrada es siempre invertible.

Para completar esta tarea, debe hacer lo siguiente:

Bifurque el repositorio de GitHub que contiene los archivos R stub en
https://github.com/rdpeng/ProgrammingAssignment2 para
 crear una copia bajo su propia cuenta.

Clone el repositorio GitHub bifurcado en su ordenador para poder editar los archivos localmente en su propia máquina.

Edite el archivo R contenido en el repositorio git y coloque su solución en ese archivo (por favor, no cambie el nombre del archivo).

Confirme su archivo R completado en SU repositorio git y empuje su rama git al repositorio GitHub bajo su cuenta.

Envíe a Coursera la URL de su repositorio GitHub que contiene el código R completado para la tarea.

Además de enviar la URL de su repositorio GitHub, deberá enviar elhash SHA-1 de 40 caracteres(como cadena de números del 0 al 9 y letras de la a a la f) que identifica el commit del repositorio que contiene la versión de los archivos que desea enviar. Puede hacer esto en GitHub haciendo lo siguiente

Vaya a la página web de su repositorio GitHub para esta tarea

Haga clic en el enlace "?? commits" donde ?? es el número de commits que tiene en el repositorio. Por ejemplo, si ha realizado un total de 10 commits en este repositorio, el enlace debería decir "10 commits".

Verá una lista de las confirmaciones que ha hecho en este repositorio. El commit más reciente está en la parte superior. Si esto representa la versión de los archivos que desea enviar, entonces simplemente haga clic en el botón "copiar al portapapeles" en la parte derecha que debería aparecer cuando pase el ratón por encima del hash SHA-1. Pegue este hash SHA-1 en el sitio web del curso cuando envíe su tarea. Si no desea utilizar el commit más reciente, baje y busque el commit que desee y copie el hash SHA-1.

Un envío válido tendrá un aspecto parecido a (¡esto es sólo unejemplo!)
