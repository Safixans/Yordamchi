//
//  MockData.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import Foundation
let posts = [mockPost1, mockPost2, mockPost3, mockPost4, mockPost5, mockPost6, mockPost7]
let govPosts = [mockPost8, mockPost9, mockPost10]
let mockProfile1 = Profile(
    id: String(UUID().uuidString),
    profilePhoto: "mockPhoto1",
    fullName: "Asror Aliqulov", bio: "",
    location: "Toshkent, Yangi Hayot",
    phoneNumber: "88 888 88 88",
    role: .employee(
        currentStatus: .free,
        rating: nil,
        abilities: ["Swift", "SwiftUI", "SwiftData", "Mobile Design", "Figma"],
        completedJobsIds: nil,
        completedQuickHelpsIds: nil
    )
)
let mockProfile2 = Profile(
    id: UUID().uuidString,
    profilePhoto: "mockPhoto2",
    fullName: "EPAM", bio: "",
    location: "Toshkent, Oybek Metro",
    phoneNumber: "70 123 45 67",
    role: .employer(
        rating: 4.6,
        postsIds: nil,
        quickHelpersIds: nil
    )
)
let mockProfile3 = Profile(
    id: UUID().uuidString,
    profilePhoto: "mockPhoto3",
    fullName: "Argos Uz", bio: "",
    location: "Toshkent, Yunusobod",
    phoneNumber: "70 123 45 67",
    role: .employer(
        rating: 4.6,
        postsIds: nil,
        quickHelpersIds: nil
    )
)



let mockPost1 = Post(
    id: String(UUID().uuidString),
    creatorId: mockProfile2.id,
    postPrivacyLevel: .public,
    jobName: "Java Backend Developer",
    jobDescription: """
                    Kompaniyaning yangi mahsulotlarini ishlab chiqish va mavjudlarini qo'llab-quvvatlash;
                    Xizmatlar va APIlarni integratsiyalash;
                    Mikroservislarni yozish;
                    REST, WebSocket orqali tashqi xizmatlar bilan integratsiya;
                    Sql/noSql so'rovlarini yozish (PostgreSql, Redis);
                    Dam olish api yozish

                    *Java
                    *REST
                    *API
                    *Spring Framework
                    """, 
    jobLocation: "Tashkent",
    numberOfPeopleNeeded: 4,
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)
let mockPost2 = Post(
    id: UUID().uuidString,
    creatorId: mockProfile2.id,
    postPrivacyLevel: .public,
    jobName: "iOS Engineer",
    jobDescription: """
    Asosiy Vazifalar:

    iOS ilovalarini ishlab chiqish va yangilash;
    Kod sinovi va optimallashtirish.
    Talablar:

    iOS dasturlashda tajriba (Swift va Objective-C);
    Mobil ilovalar dizayni va foydalanuvchi tajribasi haqida bilim.
    Yorqin kelajakka qadam qo'yish uchun biz bilan bog'laning!
    """,
    jobLocation: "Toshkent, Yakkasaroy",
    tags: ["Swift", "iOS", "SwiftUI"],
    startingDate: nil,
    approximateDuration: nil,
    numberOfPeopleNeeded: nil,
    relevantImages: nil,
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)
let mockPost3 = Post(
    id: String(UUID().uuidString),
    creatorId: mockProfile2.id,
    postPrivacyLevel: .public,
    jobName: "Grafik Dizayner",
    jobDescription: """
                    Talablar:
                    • Yoshi 20-35 yoshgacha
                    • Korxona shaxsiy brendi va shaxsiy brend yaratishdan xabari bo’lishi
                    • 1-3 yilgacha tajriba
                    Rus tilini bilsa yaxshi
                    • Dizaynerlikdan habari bo’lishi
                    • Kontent marketdan xabari bo’lishi

                    Vazifasi:
                    • Kontent tuzish
                    • Brand yaratish va uni yurgizish/tanitish;
                    • Videoga olish
                    • Proyekt boshqarish

                    Afzalliklarimiz:
                    • Team building
                    • Tushlik
                    • Karyerniy rost

                    Ish tartibi: 6/1
                    Ish vaqti: 9:00 - 18:00 gacha

                    Oylik maosh: 4 000 000 + 9 000 000 so’mgacha topish imkoniyati
                    Manzil: Toshkent shahar, Bog’ishamol ko’chasi 260A Sampi Mall savdo markazi
                    """,
    jobLocation: "Tashkent, Yakkasaroy",
    numberOfPeopleNeeded: 4,
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)
let mockPost4 = Post(
    id: String(UUID().uuidString),
    creatorId: mockProfile2.id,
    postPrivacyLevel: .public,
    jobName: "Python",
    jobDescription: """
                    • Python va uning ekotizimida tajriba
                    • ML, dasturiy ta'minot muhandisligi va taqsimlangan hisoblash asoslari bilan tanishish
                    • Ma'lumotlar bazasi va turli xil ma'lumotlar modellarida (relyatsion, ustunli, hujjat va boshqalar) fon.
                    • Taqsimlangan tizimlar uchun HTTP-asosidagi API-larni yaratish malakasi
                    • Pandas, Numpy, Scikit-Learn, TensorFlow, PyTorch, DeepAR, Prophet, Catboost, XGBoost, Spark, PySpark kabi mashinalarni o'rganish vositalaridan va vaqt seriyasini prognozlash, kompyuterni ko'rish, tavsiya qilish tizimlari kabi vazifalardan foydalanish moslashuvchanligi
                    • AWS, Azure yoki GCP kabi bulutli hisoblash platformalari bilan tanishish
                    """,
    jobLocation: "Tashkent, Yakkasaroy",
    numberOfPeopleNeeded: 4,
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)
let mockPost5 = Post(
    id: String(UUID().uuidString),
    creatorId: mockProfile2.id,
    postPrivacyLevel: .public,
    jobName: "Java",
    jobDescription: """
                    • Kuchli Java foni, Java 8+ tajribasi
                    • Bahor bilan tanishish (Yadro, Data va h.k.)
                    • Mikro-xizmatlarni ishlab chiqish va CI/CD quvurlarini sozlash bo'yicha ish tajribasi
                    • SQL/NoSQL ma'lumotlar bazalarini bilish
                    • Bulutli xizmat ko‘rsatuvchi provayderlar (AWS, Google yoki Azure) bilan ishlash rekordi
                    • Java-da Reaktiv dasturlash imkoniyatlarini yaxshi tushunish (masalan, Spring Reactor, RxJava)
                    • Agile usullaridan foydalanish qobiliyati (Scrum / Kanban)
                    • Ingliz tili darajasi – B2 va undan yuqori
                    """,
    jobLocation: "Tashkent, Yakkasaroy",
    numberOfPeopleNeeded: 4,
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)
let mockPost6 = Post(
    id: String(UUID().uuidString),
    creatorId: mockProfile2.id,
    postPrivacyLevel: .public,
    jobName: "Data Science",
    jobDescription: """
                    • Data Science bo'yicha to'rt yillik tajribaga ega, kamida bir yil DS jamoasi rahbari sifatida
                    • Bir sohada tajriba: CV, NLP, RecSys, Time Series, MLOps
                    • Python bo'yicha malaka (NumPy / SciPy / scikit-learn / pandas / Matplotlib)
                    • Deep Learning (PyTorch, Tensorflow, Keras) bilan tanishish
                    • Data Science yechimlarini ishlab chiqarish ko'nikmalari
                    • Bulutli xizmatlar bo‘yicha tajriba (AWS SageMaker, GCP Vertex, Azure ML Studio)
                    • Ingliz tilini o'rta yoki undan yuqori daraja
                    """,
    jobLocation: "Tashkent, Yakkasaroy",
    numberOfPeopleNeeded: 4,
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)
let mockPost7 = Post(
    id: UUID().uuidString,
    creatorId: mockProfile2.id,
    postPrivacyLevel: .public,
    jobName: ".NET Developer",
    jobDescription: """
Backend : .NET Fremwork 4.5 wcf ASP.NET
ma'lumotlar bilan ishlash: MS SQL Server/Postgres;
backend: .NET Framework 4.5, WCF, ASP.NET;
frontend: JavaScript ES6, ES7 (Babel), React/Redux, WebPack;
ishlab chiqish vositalari: MS Visual Studio 2017;
kod bilan ishlash: TFS 2017, Git.
haftasiga kamida 40 soat dasturlashni xohlaydi va qila oladi;
allaqachon C# dasturini ishlab chiqish, akademik ish yoki uy loyihalarida ko'rsatishdan uyalmaysiz;
veb-ishlab chiqishni yaxshi ko'ring: frontend va backend.

""",
    jobLocation: "Toshkent, Yakkasaroy",
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)
let mockPost8 = Post(
    id: UUID().uuidString,
    creatorId: mockProfile3.id,
    postPrivacyLevel: .public,
    jobName: "Hokim Yordamchisi",
    jobDescription: """
MALAKAVIY TALABLAR
1.Bakalavr darajasidagi oliy ma’lumotga (Iqtisodiyot, moliya, soliq, menejment, bank ishi, buxgalteriya, biznes boshqaruvi va boshqa iqtisodiy sohalarida mutaxassis) ega bo‘lishi lozim. Tadbirkorlik faoliyatida (ta’sischi yoki mazkur tadbirkorlik faoliyatini boshqargan) yuqori natijalarga erishgan, intiluvchan, qobiliyatli, sohada 5 yildan ortiq tajribaga ega tadbirkorlar, faol yoshlar, istisno tariqasida oliy ma’lumotga ega bo‘lmagan fuqarolar ham ishga qabul qilinishi mumkin.
2. Kamida 3 yil ish tajribaga ega bo‘lgan, Investitsiyalar, sanoat va savdo, Iqtisodiyot va moliya, Kambagallikni qisqartirish va bandlik vazirliklarida, tijorat banklari, iqtisodiy va investitsiya komplekslariga kiruvchi boshqa idoralar, ularning hududiy bo‘linmalarida bo‘lim (sho‘ba) boshlig‘idan past bo‘lmagan lavozimda ishlagan rahbar xodimlar, shuningdek, mahalliy hokimliklarda rahbar bo‘lib ishlagan nomzodlar qabul qilinadi.
3. Mircosoft Office dasturi (Word, Excel,PowerPoint va h.k), zamonaviy axborot texnologiyalarida va internet tarmog‘ida mustaqil foydalanuvchi sifatida turli ish dasturlari bilan ishlash bo‘yicha yetarli ko‘nikmaga ega bo‘lishi lozim.
4. Nomzodlarni baholashda quyidagilarga afzalliklar beriladi: Hududlarda iqtisodiy o‘sish omillarini tahlil qilish hamda ijtimoiy- iqtisodiy strategik dasturlarni ishlab chiqish, investitsiyalarni jalb etish va yuritish siyosati, islohotlarni muvofiqlashtirish va boshqarish tajribasiga ega bo‘lgan nomzodlar. Chet tilini bilishi (xalqaro sertifikatlarga ega bo‘lgan yoki xorijiy mamlakatlarda oliy ta’limni bitirgan nomzodlar).
5. O'zbekiston Respublikasining 2022 yil 8 avgustdagi "Davlat fuqarolik xizmati to'g'risida"gi 788-son qonunning 28-moddasida keltirilgan ta'lablar.

""",
    jobLocation: "Toshkent, Chilonzor",
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)
let mockPost9 = Post(
    id: UUID().uuidString,
    creatorId: mockProfile3.id,
    postPrivacyLevel: .public,
    jobName: "Veterenar ish boshqaruvchi",
    jobDescription: """
MALAKAVIY TALABLAR
Veterinariya mutaxassisligi bo‘yicha oliy maʼlumotga ega (veterinariya vrachi); Davlat organlari va tashkilotlarida mehnat faoliyatini yuritgan;
Ish staji 2 yildan kam bo'lmagan; Sohada epizootik tadbirlarda rejalashtirish va boshqarish faoliyatini yuritgan, Sohaga oid normativ-huquqiy hujjatlarni bilishi;
Kompyuterdagi dasturiy majmualar - Microsoft Word, Exsel va Power Point dasturlarida ishlay olishi; Jismoniy va yuridik shaxslar murojaatlari bilan ishlarni tashkil eta olishi;
Rus va ingliz tillarini bilishi ustunlik beradi.
""",
    jobLocation: "Toshkent, Yakkasaroy",
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)
let mockPost10 = Post(
    id: UUID().uuidString,
    creatorId: mockProfile3.id,
    postPrivacyLevel: .public,
    jobName: "Inson Resurslari bo'yicha boshqaruvchi",
    jobDescription: """
Oliy ma’lumotga ega bo‘lishi kerak.
Davlat organlari va tashkilotlarida mehnat faoliyatini yuritgan;
veterinariya va chorvachilik sohasi bo‘yicha meyoriy hujjatlarni yaxshi bilishi, statistik ma’lumotlarni tahlil qilish va yig‘ma ma’lumot tayyorlashda yuqori malakaga ega bo‘lishi lozim; 
strategik va tahliliy fikr yurita olishi lozim. Meyoriy hujjatlar bilan ishlash bo‘yicha 1 yildan kam bo‘lmagan mehnat staji Kompyuterdagi dasturiy majmualar Microsoft Word, Exsel va Power Point dasturlarida erkin ishlashi Sohga oid Hukumat qaror loyihalarini ishlab chiqish; 
Sohaga oid normativ-huquqiy hujjatlarni bilishi. Davlat organlari va tashkilotlarida mehnat faoliyatini yuritgan; YAMMT («Yagona milliy mehnat tizimi» idoralararo dasturiy-apparat kompleksi) va vacancy.argos.uz, ish.uzedu.uz elektron dasturlarida va boshqa kadrlarga oid hujjatlar bilan ishlay bilishi;
kadrlar sohasiga oid buyruq, bayon, chora-tadbirlar rejasi va boshqa hujjatlar loyihalarini ishlab chiqish;
""",
    jobLocation: "Toshkent, Yangi Hayot",
    postStatus: .searching(appliedPeopleIds: nil, acceptedPeopleIds: nil)
)

let mockQuicHelp1 = QuickHelp(
    id: String(UUID().uuidString),
    creatorId: mockProfile1.id,
    jobName: "To'shakni 5-qavatga olib borish kerak",
    jobDesription: "Menda 2 darajali karavot bor, uni zinapoya orqali 4-qavatga olib chiqish uchun menga 4 kishi kerak.",
    numberOfPeopleNeeded: "4",
    hourlyWage: "30000"
)

let mockReview1 = Review(
    id: String(UUID().uuidString),
    creatorId: mockProfile1.id,
    to: mockPost1.id,
    stars: 4,
    comment: "Ish yaxshi edi. Ular yaxshi to'lashdi. Davom eting va rahmat!"
)

let mockResponse1 = EmployeeResponse(
    id: String(UUID().uuidString),
    postId: mockPost1.id,
    wage: "",
    metric: "",
    reasoning: ""
)
