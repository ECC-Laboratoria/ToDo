# Prework week 6

## Preguntas de Prework 

### Swift: 

*Repasa el código de la sesión anterior y en un documento redacta todos los pasos para crear un UITableView. Incluye tanto los pasos en Swift como para el Storyboard. *


1. Crear un proyecto nuevo (Single View App)

2. Crear un Navigation Controller en el archivo Main.storyboard, indicando que será nuestro *Initial View Controller*, esto se hace desde el inspector de atributos.

3. Crear un archivo *.swift* que será el controlador de nuestra tabla (Eliminar previamente el archivo _ViewController.swift_) ó cambiar el nombre y la clase de este, es buena practica que el nombre del archivo sea el mismo que se usará para la clase del Table View Controller.
    
    La clase a usar debe heredar de `UITableViewController` y estar conectada al TableViewController del archivo Main.storyboard.

4.  Crear archivo .swift con el nombre de el modelo que se usará para rellenar la data de nuestra tabla.

```swift
    struct Example {
        var example1: String
        var example2: Bolean
        var example3: Int
        var example4: false
}
```

5.  Hacer uso de los métodos del protocolo `UITableViewDataSource`, para administrar los datos y proporcionar celdas para una vista de tabla, obligatorio:

    [Documentación](https://developer.apple.com/documentation/uikit/uitableviewdatasource)

- numberOfSections / *número de secciones de la tabla, opcional* 
```swift
    override func numberOfSections(in tableView: UITableView) -> Int {
        return <#code#>
    }
```

- numberOfRowsInSection / *número de filas de la tabla, obligatorio*
```swift
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return <#code#> // Normalmente será la misma cantidad que datos a mostrar
    }
```

- cellForRowAt - / *Creación, adición de contenido y regreso de la celda, obligatorio*
```swift
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. definir celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "exampleCell", for: indexPath)
        
        //2. contenido celda
        cell.textLabel.text = example[indexPath.row]
        
        //3. regresar celda
        return cell
    }
```

6. Hacer uso de los métodos del protocolo `UITableViewDelegate` para administrar selecciones, configurar encabezados y pies de página de sección, eliminar y reordenar celdas y realizar otras acciones en una vista de tabla.

    [Documentación](https://developer.apple.com/documentation/uikit/uitableviewdelegate)


#### NOTAS:

* Existen dos tipos de Table View el Plain y el Grouped.

* `withIdentifier: "exampleCell"`  es el identificador que se usa para *conectar* con el `TableViewCell` del archivo Main.storyboard
