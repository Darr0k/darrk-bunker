fx_version 'cerulean'
game 'gta5'
 
description 'Darrk Example Manifest'
version '1.0.0'
 
lua54 'yes'
 
shared_script { 
    'config.lua',
    '@drk-core/import.lua',
}
 
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/cl_*.lua'
}
 
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua'
}
 
ui_page 'html/index.html'
 
files {
    'html/index.html',
    'html/style/*.css',
    'html/script/*.js',
    'html/img/*.*',
    'html/fonts/Musamim.ttf',
}
 
dependencys {
    'drk-core',
    'drk-target',
    'PolyZone'
} 