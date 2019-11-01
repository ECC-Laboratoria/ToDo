# Prework Week 6 
**Fecha de entrega:** 2 Nov. 2019 a las 23:59 hrs mediante un **pull request**

### Introducción 

Para esta sesión de Prework, es necesario que contestes las siguientes preguntas en el archivo **README.md** dentro de la carpeta **Week$i/Prework.** Para hacer esto, necesitarás usar un editor de Markdown o tu editor de texto favorito. 

**$i** equivale al número de semana en la cual nos encontramos. 

#### **Notas importantes** 

Las preguntas deberán ser respondidas de manera individual, es decir, cada estudiante deberá tener contestado la serie de preguntas dentro del  archivo **README.md**. Sin embargo, es completamente válido que trabajen en equipo para contestarlas. 

Al inicio de cada sesión, haremos preguntas sobre el Prework. Les recomendamos ampliamente que realicen el Prework para que no se atrasen. 

---

### Preguntas de Prework 

#### Swift
Repasa el código de la sesión anterior y en un documento redacta todos los pasos para crear un UITableView. Incluye tanto los pasos en Swift como para el Storyboard.

1. Primero en el Main.Storyboard creamos un Navigation Controller. Este por defecto trae un table view. En el podemos agregar titulo a la tabla, y agregar titulo al contenido de la celda y contenido. Y debemos asegurarnos de tener el initial view controller. 
2. Es necesario crear un archivo en swift que sea el controlador de nuestra tabla, para ello necesitamos crear una clase que tenga distintos métodos.
3. Metodos de Data Source: Modelo de Datos
- numberOfSections- el número de secciones de la tabla 
- numberOfRowsInSection- el número de filas de la tabla
- cellForRowAt- En este método se crea la celda, se pone contenido en la celda y se regresa la celda.
4. Métodos Delegate: Administrar Vista/Apariencia  
- Estos métodos nos permiten eliminar alguna celda, mover la posición de la celda, etc. 
5. Es necesario en el main.Storyboard asegurarnos que la celda tenga el mismo identificador que en el código para que podamos reutilizarla. 

