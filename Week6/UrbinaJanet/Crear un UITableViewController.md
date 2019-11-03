### **Crear un UITableViewController.**

**Xcode.**

1. Crear un nuevo proyecto y seleccionar la opción ***Single View App***.
2. Rellenar los campos  Product Name, Organization Name, Organization Identifier.
3. Language: *Swift*.
4.  Deseleccionar Use Core Data, Include Unit Tests, Include UI Tests.
5. Guardar proyecto dentro de una carpeta.

**UI**

1. Abrir `Main.storyboard` y agregar mediante el menú (Object Library) un `Navigator Controller`. En el inspector de Atributos seleccionar la casilla *(Is Initial View Controller)*.

   El Navigation Controller tiene por defecto un Table View Controller.

![NavigationController](.\Imagenes\NavigationController.png)

2. Cambiar el título del *Root View Controller*, agregado por Default, por **Table View Controller**.

**Swift**

Agregando datos a la tabla:

1. Borra la clase *ViewController.swift*
2. Crear un archivo de Swift y guardarlo con el mismo nombre que se usará para la clase Table View Controller.
3. Dentro del archivo importar el módulo **UIKit**
4. Crear una clase, con el mismo nombre del archivo, que herede el `UITableViewController`.
5. Dentro de la clase agregar el método `viewDidLoad` (es uno de los métodos del ciclo de vida de un controlador). La primera vez que se carga la vista se manda llamar éste método.

```swift
class EmojiTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
```



6. Conectar en el Main.storyboard, el TableViewController con la clase creada dentro del inspector de identidad.

![Atributos-de-clase](C:\Users\DELL\Desktop\Swift_Laboratoria\Week 6 Pretrabajo\Imagenes\Atributos-de-clase.png)

------------------------------------------------------------------------------------------

7. Se crea el modelo tipo [Emoji] que contendrá las propiedades

   *symbol, name, description y usage* en un archivo de tipo `swift`

   ```swift
   struct Emoji {
       var symbol : String
       var name:   String
       var description: String
       var usage: String
   }
   ```

------------------------------------------------------------------------------------------------------

8. Agregar la información que se desplegará en la tabla, en el archivo `TableViewController`  en éste caso es un arreglo tipo [Emoji]

```swift
var emojis: [Emoji] = [
    Emoji(symbol: "😀", name: "Grining Face", description: "A typical smiley face", usage: "happiness"),
    Emoji(symbol: "😂", name: "Tears of joy", description: "A face to denote someone is laughing", usage: "laughter"),
    Emoji(symbol: "😍", name: "Heart eyes", description: "A smiley face with hearts for eyes.", usage: "in love")
	]
```

​	

Existen dos tipos de Table View el Plain y el Grouped.

`UITableView` tiene dos protocolos: `UITableViewDataSource` (obligatorio) y `UITableViewDelegate` (opcional).

El protocolo **UITableViewDataSource** permite decirle a la clase UITableView que información mostrar.

Este protocolo declara tres métodos para crear la tabla:

1. `tableView:numberOfSections`()  -éste método es opcional-

2. `tableView:numberOfRowsInSection`()

3. `tableView:cellForRowAt`()

   

Agregar el método **numberOfSections()** que en éste ejemplo retornará una sola sección.

```swift
override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
```

​		El método **numberOfRowsInSection()**, especifica el número de celdas (renglones) que se mostrarán en la tabla, que en éste caso con la propiedad `.count` se determina el número de elementos almacenados en el arreglo `emojis`

```swift
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
```



   	El método **cellForRowAt()** especifica los datos que se mostrarán en cada celda.

Éste método contiene un objeto de la clase **NSIndexPath** y contiene dos propiedades; *.section* que indica una sección de la tabla y *.row* que determina una celda de dicha sección.

> *NOTA: Si se crea una tabla a partir de la clase ViewController, se deberán agregar los protocolos que pertenecen a UITableViewController: UITableViewDataSource y UITableViewDelegate* 

```swift
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
```

Éste método crea un objeto celda *(cell)* de tipo `UITableViewCell` generalmente tiene 3 atributos que pueden o no usarse:

textLabel.text, title.text  e imageView.

Para especificar la celda se siguen los siguientes pasos:

1. Crear la celda

   ```swift
   let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
   let emoji = emojis[indexPath.row]
   ```

   Se crea una instancia de la celda con un identificador "*String*" para un *indexPath* específico.

   El identificador "**EmojiCell**" servirá para conectar en el  `Main.Storyboard` con la celda `"TableViewCell"`

   --------------------------------------------

   **UI**

   En el `Main.Storyboard` se selecciona el *Table View Cell* y en el inspector de atributos se cambia el estilo de la celda, para éste ejemplo, **Subtitle** y se conecta el identificador **"EmojiCell"** 

   

   ![TableViewCell](C:\Users\DELL\Desktop\Swift_Laboratoria\Week 6 Pretrabajo\Imagenes\TableViewCell.png)

   -------------------------------------------------------------------------------

   

2. Especificar el contenido de la celda

      

   ```swift
    cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
    cell.detailTextLabel?.text = emoji.description
    cell.showsReorderControl = true 
   ```

   

3. Regresar la celda

   ```swift
    return cell
   ```



El protocolo **UITableViewDelegate**  es el encargado de determinar la apariencia de la UITableView, sus métodos son opcionales , entre las funcionalidades que ofrece éste protocolo están, seleccionar una celda para ver contenido específico, reordenar las celdas, editar, borrar contenido de una celda.

1. Seleccionar una celda:

```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(emojis[indexPath.row].symbol)")
    }
```

2. Reordenar la tabla

```swift
override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let emojiToMove = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(emojiToMove, at: destinationIndexPath.row)
        tableView.reloadData()
    }
```

3. Borrar contenido de una celda

```swift
override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
```
