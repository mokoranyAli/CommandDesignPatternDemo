//
//  SelectionViewController.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit

/// ``` THIS IS OUR INVOKER IN COMMAND PATTERN```

// MARK: - SelectionViewController
//
class SelectionViewController<Command: SelectionCommand>: UIViewController,
                                                                   UITableViewDataSource,
                                                                   UITableViewDelegate
where Command.Model: ValidCommandModel {
  
  // MARK: - Typealiases
  
  typealias Element = Command.Model
  
  // MARK: Outlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Views
  
  /// Activity Indicator
  ///
  private let activityIndicator = ActivityIndicator()
  
  /// Done bar button item for multiple selections
  ///
  private var doneButton: UIBarButtonItem?
  
  /// Title view in navigation
  ///
  private let titleView = NavigationTitleView()
  
  // MARK: Properties
  
  /// Current Command
  ///
  var command: Command?
  
  /// Elements
  ///
  private(set) var list: [Element] = []
  
  /// Selected Elements
  ///
  private(set) var selectedIndices: [Element] = [] {
    didSet {
      onValueChange?()
    }
  }
  
  /// State for loading data from command
  ///
  var state: State = .loading {
    didSet {
      if state == .success {
        reloadData()
      }
      updateIndicatorVisibility()
        didEnterState(state)
    }
  }

  // MARK: - Callbacks
  
  /// This in case of multiple selections
  /// When selected element changed
  ///
  private var onValueChange: (() -> Void)?
  
  /// On dismiss ViewController
  ///
  public var onDismissCallback: ((UIViewController) -> Void)?
  
  /// When end selecting elements
  ///
  private var onEndEditing: ((SelectionValue<Element>) -> Void)?
  
  // MARK: - Init
  
  init(command: Command?, onEndEditing: @escaping (SelectionValue<Element>) -> Void) {
    self.command = command
    self.onEndEditing = onEndEditing
    super.init(nibName: Strings.nibName, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
    updateIndicatorVisibility()
    configureOnValueChange()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadData()
  }
  
  // MARK: - UITableviewDataSource Conformance
  

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dequeueCell(at: indexPath)
  }
  
  // MARK: - UITableviewDelegate Conformance
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let element = list[indexPath.row]
    if let command = command {
      command.allowsMultipleSelection ? selectElement(element) : submitElement(element)
    }
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    let element = list[indexPath.row]
    deselectElement(element)
  }
  
  // MARK: - Actions
  
  /// On done button tapped in case of multiple selections
  ///
  @objc func doneButtonHandler() {
    onEndEditing?(.multiple(values: selectedIndices))
    onDismissCallback?(self)
    print("values are \(selectedIndices)... should dismiss now in callback")
  }
  
  // MARK: - Configuration
  
  func configureOnValueChange() {
    onValueChange = { [weak self] in
      self?.updateBarButtonItemEnableState()
    }
  }
}

// MARK: - View's Configuration
//
private extension SelectionViewController {
  
  /// Configure view
  ///
  func configureView() {
    configureTableView()
    configureActivityIndicator()
    configureTitleView()
    configureDoneButtonIfNeeded()
  }
  
  /// Configure TableView
  ///
  func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.allowsMultipleSelection = command?.allowsMultipleSelection ?? false
    registerCells(in: tableView)
  }
  
  /// Register table view cells
  ///
  func registerCells(in tableView: UITableView) {
    tableView.register(SelectableTableViewCell.self, forCellReuseIdentifier: SelectableTableViewCell.classNameWithoutNamespaces)
    }
  
  /// Activity Indicator's Configurations
  ///
  func configureActivityIndicator() {
    activityIndicator.addToParentView(view)
  }
}

// MARK: - Configure: Navigation Controller
//
private extension SelectionViewController {
  
  /// Add title view to navigation item
  ///
  func configureTitleView() {
    titleView.title = command?.title
    titleView.subtitle = command?.subtitle
    navigationItem.titleView = titleView
  }
  
  /// Convigure navigation bar with button
  ///
  func configureDoneButtonIfNeeded() {
    guard let command = command else { return }
    if command.allowsMultipleSelection {
      configureNavigationDoneItem()
    }
  }
  
  /// Create and configure done bar button item
  ///
  func configureNavigationDoneItem() {
    if navigationController == nil {
      assertionFailure("Should be embedded in a navigation controller")
    }
    
    doneButton = UIBarButtonItem(title: Strings.done,
                                 style: .plain,
                                 target: self,
                                 action: #selector(doneButtonHandler))
    doneButton?.isEnabled = false
    navigationItem.rightBarButtonItem = doneButton
  }
}

// MARK: - Activity Indicator Handlers
//
private extension SelectionViewController {
  
  /// Update indicator visibility based on state
  ///
  func updateIndicatorVisibility() {
    let shouldShow = state == .loading
    shouldShow ? ensureLoadingIndicatorIsShown() : ensureLoadingIndicatorIsHidden()
  }
  
  /// Show loading indicator
  ///
  func ensureLoadingIndicatorIsShown() {
    activityIndicator.startAnimating()
  }
  
  /// Hide loading indicator
  ///
  func ensureLoadingIndicatorIsHidden() {
    activityIndicator.stopAnimating()
  }
}

// MARK: - Public Handlers
//
extension SelectionViewController {
  
  /// Set list to update tableview with new data
  ///
func updateList(_ list: [Element]) {
  self.list = list
  reloadData()
}
  
  /// Reload table view and selected selections
  ///
  func reloadData() {
    DispatchQueue.main.async { [weak self] in
        self?.tableView.reloadData()
    }
  }
}
// MARK: - Private Handlers
//
private extension SelectionViewController {
  
  /// Load command data to populate it in tableview
  ///
  func loadData() {
    command?.loadData { [weak self] result in
      switch result {
      case .success(let list):
        self?.updateList(list)
        self?.state = .success
        
      case .failure(let error):
        self?.state = .failure(error)
      }
    }
  }
  
  
  /// Select element
  /// It means this is multiple selections tablview
  /// Should update selected items
  ///
  func selectElement(_ element: Element) {
    selectedIndices.append(element)
  }
  
  /// Select element
  /// It means this is multiple selections tablview
  /// Should remove item from selected items
  ///
  func deselectElement(_ element: Element) {
    selectedIndices = selectedIndices.filter {$0 != element}
  }
  
  /// Select element
  /// It means this is single selections tablview
  /// Should dismiss with the result
  ///
  func submitElement(_ element: Element) {
    onEndEditing?(.single(value: element))
    onDismissCallback?(self)
  }
  
  /// Update enable state for done button item
  ///
  func updateBarButtonItemEnableState() {
    let isEmpty = selectedIndices.isEmpty == false
    doneButton?.isEnabled = isEmpty
  }
    
    func didEnterState(_ state: State) {
        switch state {
        case .success:
            updateToSuccessState()
        case .failure(let error):
            updateToErrorState(with: error)
        case .loading:
            ensureLoadingIndicatorIsShown()
        }
    }
    
    func updateToSuccessState() {
        if list.isEmpty {
            self.displayAlert(with: "Warning", message: "No data is found")
        }
        ensureLoadingIndicatorIsHidden()
    }
    
    func updateToErrorState(with error: Error) {
        self.displayAlert(with: "Error", message: error.localizedDescription)
           ensureLoadingIndicatorIsHidden()
       }
}

// MARK: - UITableViewDataSource Conformance
//
private extension SelectionViewController {
  
  /// Return configured element cell at indexPath
  ///
  func dequeueCell(at indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(SelectableTableViewCell.self, for: indexPath)
    configureCell(cell, at: indexPath)
    return cell
  }
  
  /// Configure normal cell which is `SelectableTableViewCell`
  ///
  func configureCell(_ cell: SelectableTableViewCell, at indexPath: IndexPath) {
    let item = list[indexPath.row]
    cell.textLabel?.text = item.displayValue
  }
  

}

// MARK: - Strings
//
private extension SelectionViewController {
  enum Strings {
    static var done: String { "Done" }
    static var nibName: String { "SelectionViewController" }
  }
}

