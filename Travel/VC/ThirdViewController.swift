
import UIKit

class ThirdViewController: UIViewController , UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    private var mount: [AdventureElement] = []
    
    var filteredItems: [AdventureElement] = []
    
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "leftArrow")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "leftArrow")
        view.backgroundColor = .backgroundView
        commonInit()
        fetchData()
    }
    
    let search: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.searchBarStyle = .minimal
        search.backgroundColor = .white
        search.layer.cornerRadius = 20
        search.searchTextField.textColor = .black
        search.searchTextField.backgroundColor = .white
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    private var userIcon: UIImageView = {
        var userIcon = UIImageView()
        userIcon.image = UIImage(named: "Mask group")
        userIcon.backgroundColor = .sign
        userIcon.layer.cornerRadius = 35
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.contentMode = .scaleAspectFit
        return userIcon
    }()
    
    private var travelTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.labelTravel

        let fullText = "Let’s travel now"
        label.font = .notoSans(fontType: .light, size: 35)
        let attributedString = NSMutableAttributedString(string: fullText)

        let boldRange = (fullText as NSString).range(of: "travel")
        let boldFont = UIFont.notoSans(fontType: .bold, size: 35)
        attributedString.addAttribute(.font, value: boldFont, range: boldRange)

        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.labelTravel
        
        let fulltext = "Michael \nAlexander"
        label.font = .notoSans(fontType: .regular, size: 24)
        let attributedString = NSMutableAttributedString(string: fulltext)
        
        let boldRange = (fulltext as NSString).range(of: "Alexander")
        let boldFont = UIFont.notoSans(fontType: .bold, size: 24)
        attributedString.addAttribute(.font, value: boldFont, range: boldRange)
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        
        return label
    }()
    
    private var mountainLabel: UILabel = {
        var mountainLabel = UILabel()
        mountainLabel.text = "Mountains"
        mountainLabel.font = UIFont.notoSans(fontType: .regular, size: 24)
        mountainLabel.translatesAutoresizingMaskIntoConstraints = false
        return mountainLabel
    }()
    
    private var menuView: UIImageView = {
        var userIcon = UIImageView()
        userIcon.image = UIImage(named: "menuFourView")
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.contentMode = .scaleAspectFit
        return userIcon
    }()
    
    private func fetchData() {
        NetworkManager.shared.getHero{ [weak self] result in
            DispatchQueue.main.async{
                guard let self else {return}
                print(result.first?.name ?? "")
                print(result.first?.mountain_img ?? "")
                self.mount = result
                self.filteredItems = self.mount
                self.collectionView.reloadData()
            }
        }
    }

    
    private lazy var collectionView: UICollectionView = {
        var layout = createFlowLayout()
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AdventureViewCell.self, forCellWithReuseIdentifier: "\(AdventureViewCell.self)")
        collectionView.backgroundColor = .none
        
        return collectionView
    }()
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            userIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 43),
            userIcon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -760),
            userIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            userIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -310),
            
            travelTextLabel.topAnchor.constraint(equalTo: userIcon.bottomAnchor, constant: 32),
            travelTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            travelTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -106),
            travelTextLabel.heightAnchor.constraint(equalToConstant: 49),
            
            mountainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 280),
            mountainLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -566),
            mountainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            mountainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -250),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            search.topAnchor.constraint(equalTo: travelTextLabel.bottomAnchor, constant: 15),
            search.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            search.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            nameTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            nameTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108),
            nameTextLabel.heightAnchor.constraint(equalToConstant: 70),
            
            menuView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 337),
            menuView.heightAnchor.constraint(equalToConstant: 26),
            menuView.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        menuView.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapImage))
        menuView.addGestureRecognizer(tap)
        
    }
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 158, height: 205)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 36, bottom: 0, right: 27)
        return layout
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredItems = self.mount
        } else {
            isSearching = true
            filteredItems = self.mount.filter { ($0.name ?? "").lowercased().contains(searchText.lowercased()) }
        }
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleCells = collectionView.visibleCells
        let disappearThreshold: CGFloat = 300
        
        for cell in visibleCells {
            if let indexPath = collectionView.indexPath(for: cell) {
                let cellPosition = collectionView.convert(cell.frame, to: view).origin.y
                
                if cellPosition < disappearThreshold {
                    let distanse = disappearThreshold - cellPosition
                    let alpha = max(0, 1 - (distanse / 100))
                    cell.alpha = alpha
                } else {
                    cell.alpha = 1
                }
            }
        }
    }
}

extension ThirdViewController {
    func commonInit() {
        setupSubview()
        setupConstraint()
        
    }
    
    func setupSubview() {
        view.addSubview(userIcon)
        view.addSubview(menuView)
        view.addSubview(travelTextLabel)
        view.addSubview(mountainLabel)
        view.addSubview(search)
        search.delegate = self
        filteredItems = mount
        view.addSubview(collectionView)
        view.addSubview(nameTextLabel)
        
    }
    
}

extension ThirdViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing:AdventureViewCell.self),
            for: indexPath
        ) as? AdventureViewCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .white
        let mountain = filteredItems[indexPath.row]
        cell.configureCell(stringUrl: mountain.mountain_img ?? "", mountName: mountain.name ?? "", country: mountain.location ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fourthViewController = FourthViewController(mountsInfo: self.filteredItems[indexPath.row])
        fourthViewController.mountsInfo = filteredItems[indexPath.row]
        let backBarButton = UIBarButtonItem()
        navigationItem.leftBarButtonItem = backBarButton
        navigationItem.backBarButtonItem = backBarButton
        navigationItem.titleView?.tintColor = .black
        self.navigationController?.pushViewController(fourthViewController, animated: true)
    }

}

extension ThirdViewController {
    @objc
    private func handleTapImage() {
        let secondViewController = SecondViewController()
        let secondNavCon = UINavigationController(rootViewController: secondViewController)
        secondNavCon.navigationBar.prefersLargeTitles = true
        secondNavCon.modalPresentationStyle = .fullScreen
        present(secondNavCon, animated: true)
    }
}

