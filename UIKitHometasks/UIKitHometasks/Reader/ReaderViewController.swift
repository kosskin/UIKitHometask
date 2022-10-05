//
//  ReaderViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 04.10.2022.
//

import UIKit

/// экран с "читалкой"
final class ReaderViewController: UIViewController {
    
    // MARK: Constant
    
    private enum Constants {
        static let fontsArray = ["Verdana", "Optima", "Times New Roman"]
        static let dayNightLabelText = "День/Ночь"
        static let verseText = """
            Вы помните,
            Вы всё, конечно, помните,
            Как я стоял,
            Приблизившись к стене,
            Взволнованно ходили вы по комнате
            И что-то резкое
            В лицо бросали мне.

            Вы говорили:
            Нам пора расстаться,
            Что вас измучила
            Моя шальная жизнь,
            Что вам пора за дело приниматься,
            А мой удел —
            Катиться дальше, вниз.

            Любимая!
            Меня вы не любили.
            Не знали вы, что в сонмище людском
            Я был как лошадь, загнанная в мыле,
            Пришпоренная смелым ездоком.

            Не знали вы,
            Что я в сплошном дыму,
            В развороченном бурей быте
            С того и мучаюсь, что не пойму —
            Куда несет нас рок событий.

            Лицом к лицу
            Лица не увидать.
            Большое видится на расстоянье.
            Когда кипит морская гладь —
            Корабль в плачевном состоянье.

            Земля — корабль!
            Но кто-то вдруг
            За новой жизнью, новой славой
            В прямую гущу бурь и вьюг
            Ее направил величаво.

            Ну кто ж из нас на палубе большой
            Не падал, не блевал и не ругался?
            Их мало, с опытной душой,
            Кто крепким в качке оставался.

            Тогда и я,
            Под дикий шум,
            Но зрело знающий работу,
            Спустился в корабельный трюм,
            Чтоб не смотреть людскую рвоту.

            Тот трюм был —
            Русским кабаком.
            И я склонился над стаканом,
            Чтоб, не страдая ни о ком,
            Себя сгубить
            В угаре пьяном.

            Любимая!
            Я мучил вас,
            У вас была тоска
            В глазах усталых:
            Что я пред вами напоказ
            Себя растрачивал в скандалах.

            Но вы не знали,
            Что в сплошном дыму,
            В развороченном бурей быте
            С того и мучаюсь,
            Что не пойму,
            Куда несет нас рок событий…

            Теперь года прошли.
            Я в возрасте ином.
            И чувствую и мыслю по-иному.
            И говорю за праздничным вином:
            Хвала и слава рулевому!

            Сегодня я
            В ударе нежных чувств.
            Я вспомнил вашу грустную усталость.
            И вот теперь
            Я сообщить вам мчусь,
            Каков я был,
            И что со мною сталось!

            Любимая!
            Сказать приятно мне:
            Я избежал паденья с кручи.
            Теперь в Советской стороне
            Я самый яростный попутчик.

            Я стал не тем,
            Кем был тогда.
            Не мучил бы я вас,
            Как это было раньше.
            За знамя вольности
            И светлого труда
            Готов идти хоть до Ла-Манша.

            Простите мне…
            Я знаю: вы не та —
            Живете вы
            С серьезным, умным мужем;
            Что не нужна вам наша маета,
            И сам я вам
            Ни капельки не нужен.

            Живите так,
            Как вас ведет звезда,
            Под кущей обновленной сени.
            С приветствием,
            Вас помнящий всегда
            Знакомый ваш
            Сергей Есенин.
        """
    }
    
    // MARK: private properties
    
    private var currentFont = UIFont(name: "Verdana", size: 14)
    
    // MARK: UI elements
    
    private let readerTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.text = Constants.verseText
        textView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return textView
    }()
    
    private let sizeFontLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 705, width: 150, height: 15))
        label.text = "Размер шрифта"
        label.textColor = .white
        return label
    }()
    
    private let sizeFontSlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 5, y: 730, width: 160, height: 23))
        slider.minimumValue = 10
        slider.maximumValue = 20
        slider.tintColor = .lightGray
        slider.maximumTrackTintColor = .darkGray
        slider.addTarget(self, action: #selector(changeSliderAction), for: .valueChanged)
        return slider
    }()
    
    private let textColorLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 298, y: 705, width: 100, height: 15))
        label.text = "Цвет текста"
        label.textColor = .white
        return label
    }()
    
    private let darkGreyColorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 290, y: 730, width: 20, height: 20))
        button.layer.cornerRadius = 10
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(changeColorAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let lightGreyColorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 320, y: 730, width: 20, height: 20))
        button.layer.cornerRadius = 10
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(changeColorAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let redColorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 350, y: 730, width: 20, height: 20))
        button.layer.cornerRadius = 10
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(changeColorAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let whiteColorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 380, y: 730, width: 20, height: 20))
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(changeColorAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let fontThicknessLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 765, width: 100, height: 15))
        label.text = "Толщина"
        label.textColor = .white
        return label
    }()
    
    private let fontThicknessButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 785, width: 20, height: 20))
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(boldFontAction), for: .touchUpInside)
        return button
    }()
    
    private let fontBoldButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 90, y: 785, width: 20, height: 20))
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(thinFontAction), for: .touchUpInside)
        return button
    }()
    
    private let dayNightLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 300, y: 765, width: 100, height: 20))
        label.text = Constants.dayNightLabelText
        label.textColor = .white
        return label
    }()
    
    private let dayNightSwitch: UISwitch = {
        let switche = UISwitch(frame: CGRect(x: 320, y: 785, width: 20, height: 20))
        switche.addTarget(self, action: #selector(dayNightAction), for: .valueChanged)
        return switche
    }()
    
    private let fontPickerView: UIPickerView = {
        let picker = UIPickerView(frame: CGRect(x: 150, y: 700, width: 150, height: 100))
        return picker
    }()

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: Configuration UI
    
    private func configUI() {
        view.backgroundColor = .brown
        navigationController?.navigationBar.barTintColor = .brown
        navigationController?.navigationBar.tintColor = .white
        view.addSubview(readerTextView)
        readerTextView.frame = .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 200)
        view.addSubview(sizeFontLabel)
        view.addSubview(sizeFontSlider)
        view.addSubview(textColorLabel)
        view.addSubview(darkGreyColorButton)
        view.addSubview(lightGreyColorButton)
        view.addSubview(redColorButton)
        view.addSubview(whiteColorButton)
        view.addSubview(fontThicknessLabel)
        view.addSubview(fontThicknessButton)
        view.addSubview(fontBoldButton)
        view.addSubview(dayNightLabel)
        view.addSubview(dayNightSwitch)
        fontPickerView.delegate = self
        fontPickerView.dataSource = self
        view.addSubview(fontPickerView)
        readerTextView.font = currentFont
    }
    
    // MARK: Methods
    
    @objc private func changeSliderAction() {
        let valueOfSlider = sizeFontSlider.value
        readerTextView.font = UIFont.systemFont(ofSize: CGFloat(valueOfSlider))
    }
    
    @objc private func changeColorAction(sender: UIButton) {
        switch sender {
        case darkGreyColorButton:
            readerTextView.textColor = .darkGray
        case lightGreyColorButton:
            readerTextView.textColor = .lightGray
        case redColorButton:
            readerTextView.textColor = .red
        case whiteColorButton:
            readerTextView.textColor = .white
        default:
            break
        }
    }
    
    @objc private func boldFontAction() {
        readerTextView.font = currentFont?.bold
    }
    
    @objc private func thinFontAction() {
        readerTextView.font = currentFont
    }
    
    @objc private func dayNightAction(sender: UISwitch) {
        readerTextView.backgroundColor = sender.isOn ? .black : .white
    }
}

// MARK: UIPickerViewDelegate, UIPickerViewDataSource

extension ReaderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        ReaderViewController.Constants.fontsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(ReaderViewController.Constants.fontsArray[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            readerTextView.font = UIFont(name: "\(ReaderViewController.Constants.fontsArray[row])",
                                         size: CGFloat(sizeFontSlider.value))
        currentFont = UIFont(name: ReaderViewController.Constants.fontsArray[row],
                             size: CGFloat(sizeFontSlider.value))
    }
}

// MARK: UIFont
// Расширение для возможности применять методы, делающие любой шрифт жирным и полужирным
extension UIFont {
    var bold: UIFont { return withWeight(.bold) }
    var semibold: UIFont { return withWeight(.semibold) }

    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]

        traits[.weight] = weight

        attributes[.name] = nil
        attributes[.traits] = traits
        attributes[.family] = familyName

        let descriptor = UIFontDescriptor(fontAttributes: attributes)

        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
