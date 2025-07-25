#todo

write-output "-- building inspec linux x86_64 hab package"

hab license accept
hab origin key download $HAB_ORIGIN
hab origin key download --auth ${PIPELINE_HAB_AUTH_TOKEN} --secret chef
sudo hab pkg build ./habitat --refresh-channel $HAB_REFRESH_CHANNEL