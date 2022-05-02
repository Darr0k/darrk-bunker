Config = {}

Config.Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config.Debug = true

Config.Lang = 'en'

-- Config.Languages[Config.Lang].Welcome2
Config.Languages = {
    ['ar'] = {
        NoCrypto = 'لا تمتلك كريبتو كافي',
        SuccessText = 'تم استخراج الهوية',
        FingerPrint = 'تم بدأ العملية',
        ChangeFingerPrintDone = 'تم الأنتهاء من العملية بنجاح',
        ChangeFingerPrintF = 'فشلت عملية تبديل البصمة',
        NoFingerPrint = 'لا تمتلك بصمة لتبديلها',
        BuyWeapon = 'تم شراء السلاح بنجاح',
        EnterBunker = 'مرحبا بك, في البنكر نقوم بأستخدام البيت كوين هنا',
        Error = 'يوجد مشكلة',
        Welcome = 'مرحبا بك في قائمة',
        Welcome2 = 'يمكنك هنا ان تقوم بأنشاء هوية مزورة',
        NotRegister = '. ليست مسجلة بنظام الداخلية',
        firstname = 'الأسم الأول',
        lastname = 'الأسم الثاني',
        nationality = 'الجنسية',
        birthdate = 'تاريخ الميلاد',
        Confirm = 'تأكيد',
        name = 'الأسم',
        balance = 'الكريبتو',
        exp = 'الخبرات',
        WeaponOpt = 'الأسلحة',
        MissionOpt = 'المهام',
        back = 'عودة',
        NoPlayer = 'الاعب غير موجود',
        GivePerm = 'تم تسليم الشخص صلاحيات',
        RecivePerm = 'تم استلام صلاحيات البنكر',
        RemovePerm = 'تم سحب صلاحيات البنكر',
        RemovedPerm = 'تم سحب صلاحيات البنكر',
        buy = 'شراء مقابل',
        Crypto = 'كريبتو'
    },
    ['en'] = {
        NoCrypto = 'You don\'t have enough crypto',
        SuccessText = 'Identity extracted',
        FingerPrint = 'Process has started',
        ChangeFingerPrintDone = 'The operation completed successfully',
        NoFingerPrint = 'You don\'t have a fingerprint to swap',
        BuyWeapon = 'Weapon purchased successfully',
        EnterBunker = 'Welcome, we are using Crypto here',
        Error = 'There is a problem',
        Welcome = 'Welcome to Cards Panel',
        Welcome2 = 'You can create a fake ID here',
        NotRegister = 'It is not registered with the Police system.',
        firstname = 'First name',
        lastname = 'Second name',
        nationality = 'Nationality',
        birthdate = 'Birthdate',
        Confirm = 'Confirm',
        name = 'Name',
        balance = 'Crypto',
        exp = 'Experiences',
        WeaponOpt = 'Weapons',
        MissionOpt = 'Missions',
        back = 'Return',
        NoPlayer = 'Player Does Not Exist',
        GivePerm = 'Bunker Permissions gived',
        RecivePerm = 'Bunker Permissions have been received',
        buy = 'Buy For',
        Crypto = 'Crypto'
    },
}

Config.Font = {
    FirstFont = 'out',
    FontTwo = 'Arb',
}

Config.FingerPrint = {
    price = 30,
    Time = 3000,
    animDict = 'missarmenian2',
    anim = 'passout2'
}

Config.IdCardPrice = 5000000

Config.IDCardItemName = 'id_card'

Config.ItemQ = 1

Config.CitizenID = "BRK"..math.random(11111,99999)

Config.enableUsePermisson = true
Config.ShowNpc = true

Config.Vehicles = {
    ShowRoom = {
        [1] = {
            coords = vector4(922.61, -3236.09, -98.29, 87.25),
            defaultVehicle = 'Barrage',
            price = 290
        },
        [2] = {
            coords = vector4(933.86, -3220.77, -98.54, 37.39),
            defaultVehicle = 'Squaddie',
            price = 230
        },
        [3] = {
            coords = vector4(932.95, -3211.0, -98.27, 29.87),
            defaultVehicle = 'apc',
            price = 600
        },
        [4] = {
            coords = vector4(925.54, -3228.44, -98.28, 109.87),
            defaultVehicle = 'Halftrack',
            price = 530
        },
        [5] = {
            coords = vector4(925.08, -3214.38, -98.27, 83.89),
            defaultVehicle = 'dune3',
            price = 95
        },
    },
    Entery = {
        [1] = {
            coords = vector4(883.03, -3240.43, -98.89, 178.59),
            defaultVehicle = 'caddy3',
        },
        [2] = {
            coords = vector4(888.01, -3235.83, -98.28, 175.24),
            defaultVehicle = 'caddy2',
        },
        [3] = {
            coords = vector4(891.06, -3236.11, -98.28, 173.72),
            defaultVehicle = 'caddy2',
        },
        [4] = {
            coords = vector4(893.9, -3236.27, -98.26, 172.46),
            defaultVehicle = 'caddy2',
        },
        [5] = {
            coords = vector4(842.0, -3238.57, -98.62, 97.76),
            defaultVehicle = 'terbyte',
        },
    }
}

Config.Bandage = {
    item = 'bandage',
    price = 0.3532,
    amount = 1,
}

Config.Weapons = {
    ['Weapon1'] = {
        item = 'weapon_assaultrifle',
        label = 'Ak47',
        price = 50,
        img = 'https://th.bing.com/th/id/R.5da49c8f15dfcb77365106c742677a44?rik=0Rs9J0nH2oKZbA&pid=ImgRaw&r=0'
    },
    ['Weapon2'] = {
        item = 'weapon_bullpuprifle',
        label = 'Bullpup Rifle',
        price = 75,
        img = 'https://th.bing.com/th/id/OIP.CIwXpVUBlU6PbZI7AfPqQQHaEK?pid=ImgDet&w=1920&h=1080&rs=1'
    },
}