fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'sync_evidence'
author 'Sync Development' 
description 'Interactable Props Stashes with Custom Models'
version '1.0'

client_scripts {'client/*.lua', 'framework/client/*.lua'}
server_scripts { '@oxmysql/lib/MySQL.lua','server/*.lua',}
shared_scripts {'@ox_lib/init.lua','shared/cl-config.lua'}
escrow_ignore {'shared/*.lua',}
data_file 'DLC_ITYP_REQUEST' 'stream/sync_lockers.ytyp'


files {
    'stream/anim@sync_lockers.ycd'
}