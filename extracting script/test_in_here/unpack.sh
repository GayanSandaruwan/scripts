success=0
verb_or_queit="-v"
extract() {
    for plik in "$@"; do
        echo $(file "$plik")
        # tar -xvaf "$plik" 2>/dev/null && 
        #     return 0
        case $(file "$plik") in
            *bzip2*)    bzip2 -dkf $verb_or_queit $verb_or_queit "$plik" 2>/dev/null && success="$(($success + 1))"      ;;
            *gzip*)     gunzip -dfk $verb_or_queit "$plik" 2>/dev/null && success="$(($success + 1))"           ;;
            *'7-zip'*)  7z x "$plik"   2>/dev/null && success="$(($success + 1))"           ;;
            *zip*)      unzip -do $verb_or_queit "$plik"  2>/dev/null && success="$(($success + 1))"           ;;
            *Zip*)      unzip -do $verb_or_queit "$plik"  2>/dev/null && success="$(($success + 1))"           ;;
            *xz*)       unxz  -dkf $verb_or_queit "$plik"  2>/dev/null && success="$(($success + 1))"           ;;
            *XZ*)       unxz  -dkf $verb_or_queit "$plik"  2>/dev/null && success="$(($success + 1))"           ;;
            *compress\'d*)  
            *)          1>&2 echo "Unknown archive '$plik'"; return 1 ;;
        esac
    done
}

extract archive.bz2 archive.gz archive.zip archive.cmpr
echo $success