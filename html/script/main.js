Darrk = {}
Darrk.Player = {}
Darrk.Player.PlayerData = {}
Lang = 'ar'

$(function () {

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)

                Darrk.Player.PlayerData.Name = item.fname+ ' ' + item.lname
                Darrk.Player.PlayerData.balance = item.balance
                Darrk.Player.PlayerData.exp = item.exp
                Lang = item.ll
                
                console.log(Lang)
                if (Lang == 'ar') {
                    $('body').css('font-family', 'Tajawal');
                    $('.header').css('text-align', 'right');
                } else {
                    $('body').css('font-family', "'Roboto Mono', monospace");
                    $('.header').css('text-align', 'center');
                }
                $('.name').html(item.Lang.name + ' : ' + item.fname+ ' ' + item.lname)
                $('.balance').html(item.Lang.balance + ' : ' + item.balance)
                $('.exp').html(item.Lang.exp + ' : ' + item.exp)
                $('.WeaponOpt').html(item.Lang.WeaponOpt);
                $('.MissionOpt').html(item.Lang.MissionOpt);
                $('.back').html(item.Lang.back);
            } else {
               display(false)
            }
        }

        if (item.type === "notify") {
            $('.notify').html(item.msg)
            setTimeout(() => {
                $('.notify').html('')
            }, 5000);
        }
    })

    function display(bool) {
        if (bool) {
            $("#container").fadeIn(1000);
            $("body").fadeIn(1000)
        } else {
            
            $("#idcard").hide();
            $("#container").hide();
            $(".WeaponPage").hide()
            $(".WeaponPage2").hide()
            $(".WeaponExtra2").hide()
            $(".MissionPage").hide()
            
            $("body").hide()
        }
    }
    function ShowWeaponPage(item) {
        // let html = ""
        $("#container").fadeOut(200);
        
        // $.each(item.weapons, function (i, weapon) { 
        //     html += getButtonRender(weapon.label, weapon.price, weapon.img, item.lang, i);  
        // });

        // $(".WeaponPage2").html(`
        //     <div class="header">
        //         <div class="name">${item.lang.name + ' : ' + Darrk.Player.PlayerData.Name}</div>
        //         <div class="balance">${item.lang.balance + ' : ' + Darrk.Player.PlayerData.balance}</div>
        //         <div class="exp">${item.lang.exp + ' : ' +Darrk.Player.PlayerData.exp}</div>
        //         <img src="./img/player.jfif" class="player">
        //         <img src="./img/logo.png" class="logo">
        //     </div>
        //     <br>
        //     <div class="swiper mySwiper">
        // `
        //     +
        //     html
        //     +
        //     `
        //     <div class="swiper-button-next"></div>
        //     <div class="swiper-button-prev"></div>
        //     <div class="swiper-pagination"></div>
        //     </div>`
        // )
        
        $('.WeaponPage2').fadeIn(500)
    }

    // const getButtonRender = (label, price, img, lang, i) => {
    //     return `
    //         <div class="swiper-slide" id="buy_weapon">
    //             <img src="${img}">

    //             <i>${label}</i>

    //             <br>

    //             <h1 class="buyweapon_23" onclick="buyWeapon(${i})">${lang.buy + ' ' + price + ' ' + lang.Crypto}</h1>
    //         </div>
    //     `;
    // };

    function Back() {
        $("#container").fadeIn(500)
        $('.WeaponPage').fadeOut(200)
        $('.MissionPage').fadeOut(200)
        $('.WeaponPage2').fadeOut(200)
    }

    function ShowMissionPage() {
        setTimeout(() => {
            $('.notify').html('')
        }, 5000);
    }

    function ShowExtraPage() {
        $("#container").fadeOut(200);
        $('.WeaponExtra2').fadeIn(500)
    }

    function Close() {
        $("#container").fadeOut(200);
        $('.WeaponPage').fadeOut(200);
        $('.MissionPage').fadeOut(200);

        setTimeout(() => {
            $.post('https://darrk-bunker/HideIdCard', JSON.stringify({}));
            $.post('https://darrk-bunker/exit', JSON.stringify({}));
        }, 100);
    }

    display(false)
    
    
    document.onkeyup = function (data) {
        if (data.which == 27) {
            Close()
            return
        }
    };

    $('.close').click(function () {
        Close()
    })

    $('.WeaponOpt').click(function () {
        $.post('https://darrk-bunker/getweapons', JSON.stringify({}), function(data) {
            ShowWeaponPage(data)
        });
    })
    
    $('.WeaponExtra').click(function () {
        ShowExtraPage()
    })
    
    $('.WaponBuy').click(function () {
        $.post('https://darrk-bunker/getweapons', JSON.stringify({}), function(data) {
            ShowBuyWeaponPage(data)
        });
    })

    $('.MissionOpt').click(function () {
        ShowMissionPage()
    })

    $('.back').click(function () {
        Back()
    })

    $('#cia_mission').click(function () {
        $.post('https://darrk-bunker/StartMission', JSON.stringify({
            mission: "cia",
            btc: 190,
        }))
    })

    $('#ship_mission').click(function () {
        $.post('https://darrk-bunker/StartMission', JSON.stringify({
            mission: "ship",
            btc: 150,
        }))
    })

    $('#lab_mission').click(function () {
        $.post('https://darrk-bunker/StartMission', JSON.stringify({
            mission: "lab",
            btc: 75,
        }))
    })

    // ID Card \\
    function Ss(bool, Lang) {
        if (bool) {
            $('#idcard').html(`
            <div class="welcome">  
                <br>
                ${Lang.Welcome}
            </div>

            <div class="about">
                ${Lang.Welcome2}
                <br>
                ${Lang.NotRegister}
            </div>

            <input type="text" id="first_name" placeholder="${Lang.firstname}" class="char-reg-input1">
            <input type="text" id="last_name" placeholder="${Lang.lastname}" class="char-reg-input2">
            <input type="text" id="nationality" placeholder="${Lang.nationality}" class="char-reg-input3">
            
            <input type="date" id="birthdate" placeholder="${Lang.birthdate}" min="1900-01-01" max="2000-12-31" class="char-reg-input4">
           
            <button id="confirm" class="confirm">${Lang.Confirm}</button>

            <img src="../html/img/logo.png" class="logo2">
            `);
            $("body").show(300);
            $("#idcard").show(300);
        } else {
            $("#idcard").hide(300);
            $("body").hide(300)
        }
    }

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.action === "ui") {
            if (item.status == true) {
                Ss(true, item.Lang)
            } else {
                Ss(false)
            }
        }
    })
    
    $("#confirm").click(function () {
        $.post('https://darrk-bunker/confirm', JSON.stringify({
            firstname: $('#first_name').val(),
            lastname: $('#last_name').val(),
            nationality: $('#nationality').val(),
            birthdate: $('#birthdate').val(),
        }));
        return
    })
})


var swiper = new Swiper(".mySwiper", {
    pagination: {
      el: ".swiper-pagination",
      type: "progressbar",
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
});