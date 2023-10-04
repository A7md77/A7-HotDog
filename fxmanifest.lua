fx_version 'cerulean'
game 'gta5'

description 'A7-hotdog'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'A7_c.lua',
}

server_scripts  {
    '@oxmysql/lib/MySQL.lua',
    'A7_s.lua'
}

lua54 'yes'
