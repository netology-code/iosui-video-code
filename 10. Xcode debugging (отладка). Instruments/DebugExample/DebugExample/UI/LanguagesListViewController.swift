import UIKit

class LanguagesListViewController: UIViewController {
    
    // MARK: - Data
    
    fileprivate let data = Language.make()
    
    fileprivate var dataCount: Int {
        data.count
    }
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private enum CellReuseID: String {
        case base = "BaseTableViewCell_ReuseID"
    }
    
    private enum HeaderFooterReuseID: String {
        case base = "TableSectionFooterHeaderView_ReuseID"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupConstraints()

        tuneTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.indexPathsForSelectedRows?.forEach{ indexPath in
            tableView.deselectRow(
                at: indexPath,
                animated: animated
            )
        }
    }
    
    // MARK: - Private
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Debug example"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
        ])
    }
    
    private func tuneTableView() {
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0.0
        }
        tableView.tableFooterView = UIView()
        
        tableView.register(
            BaseTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.base.rawValue
        )
        
        tableView.register(
            TableSectionFooterHeaderView.self,
            forHeaderFooterViewReuseIdentifier: HeaderFooterReuseID.base.rawValue
        )
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension LanguagesListViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        dataCount
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.base.rawValue,
            for: indexPath
        ) as? BaseTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        
        cell.update(data[indexPath.row])
        
        return cell
    }
}

extension LanguagesListViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        44.0
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {

        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: HeaderFooterReuseID.base.rawValue
        ) as? TableSectionFooterHeaderView else {
            fatalError("could not dequeueReusableCell")
        }

        let title = "Всего языков: \(dataCount)"
        headerView.update(title: title)

        return headerView
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let nextViewController = LanguageDetailsViewController()
        
        let model = data[indexPath.row]
        nextViewController.update(model: model)
        
        navigationController?.pushViewController(
            nextViewController,
            animated: true
        )
    }
}

// CustomStringConvertible + CustomDebugStringConvertible
extension LanguagesListViewController {
    
    override var description: String {
        "\(super.description) the list of programming languages"
    }
    
    override var debugDescription: String {
        "LanguagesListViewController represents the list of programming languages with count \"\(dataCount)\""
    }
}
