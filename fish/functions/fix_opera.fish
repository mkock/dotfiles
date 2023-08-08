function fix_opera --description 'overwrite libffmpeg.so with working version, requires sudo'
    cp ./my-resources/libffmpeg.so /lib/x86_64-linux-gnu/opera/
    cp ./my-resources/libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/
end

