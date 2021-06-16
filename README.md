### CommandDesignPatternDemo

This is demo implementation on command pattern in two examples 

# First Example in SelectionViewController 

Using a single component which is UITableview to apply diffrent kind of actions
Like passing diffrent lists and apply single and multiple selections in tableview 
Everything using the same component and make it based on Command

code sample
``` 
func getMovieSelectionController() -> SelectionViewController<MultipleMoviesCommand> {
        let selectionViewController = SelectionViewController(command: MultipleMoviesCommand(), onEndEditing: didReceiveUserResult)
        selectionViewController.onDismissCallback = {
            $0.dismiss(animated: true, completion: nil)
        }
        return selectionViewController
    }
```
    
    

 # Second Example in AppDelegate - array of commands to be executed 

Seperate appDelegate code for configue dependecies and setup views on different commands.
This fix massive appDelegate proplem and make it dosn't violate SRP(Single Responsibilty Principle).
Also every acion or setup or configuration is stand alone now so we can test it easily

Code sample in AppDelegate
``` 
StartupCommandsBuilder()
            .setKeyWindow(window)
            .build()
            .forEach { $0.execute() }
```
